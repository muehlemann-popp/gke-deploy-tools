{
  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      dockerfile-template = pkgs.writeText "dockerfile-template" ''
        FROM google/cloud-sdk:''${CLOUD_SDK_BASE_IMAGE}@''${CLOUD_SDK_BASE_IMAGE_HASH} AS base
        ARG KUSTOMIZE_VERSION=''${KUSTOMIZE_VER}
        ARG SOPS_VERSION=''${SOPS_VER}
        ARG HELM_VERSION=''${HELM_VER}
        ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv''${KUSTOMIZE_VERSION}/kustomize_v''${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
        ADD https://get.helm.sh/helm-v''${HELM_VERSION}-linux-amd64.tar.gz /tmp
        RUN tar xf /tmp/kustomize_v''${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
            tar xf /tmp/helm-v''${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
            wget https://github.com/mozilla/sops/releases/download/v''${SOPS_VERSION}/sops-v''${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
            chmod a+x /usr/bin/sops

        FROM google/cloud-sdk:''${CLOUD_SDK_BASE_IMAGE}@''${CLOUD_SDK_BASE_IMAGE_HASH}
        COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
        COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
        COPY --from=base /usr/bin/sops /usr/bin/sops

        RUN gcloud components install gke-gcloud-auth-plugin && \
            gcloud components install kubectl                && \
            addgroup -S deployer && adduser -S deployer -G deployer

        USER deployer
        WORKDIR /home/deployer
      '';
      dockerfile-generator = pkgs.writeShellApplication {
        name = "dockerfile-generator";
        runtimeInputs = [ pkgs.gettext ];
        text = ''
          # shellcheck disable=SC2016 
          envsubst '
          ''${CLOUD_SDK_BASE_IMAGE}
          ''${CLOUD_SDK_BASE_IMAGE_HASH}
          ''${KUSTOMIZE_VER}
          ''${SOPS_VER}
          ''${HELM_VER}
          ' <${dockerfile-template} >Dockerfile 
        '';
      };
    in {
      checks.x86_64-linux.dockerfile-linting =
        (pkgs.runCommand "hadolint" { buildInputs = [ pkgs.hadolint ]; } ''
          hadolint ${self}/Dockerfile --ignore DL3047 > $out
        '');
      devShells.x86_64-linux.default =
        pkgs.mkShell { packages = [ dockerfile-generator ]; };
    };
}
