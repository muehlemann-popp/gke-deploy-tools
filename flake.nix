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
      readme-template = pkgs.writeText "readme-template" ''
        # Build image

        You can manually build the Docker image with the following command:

        ```bash
        docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
               --build-arg KUSTOMIZE_VERSION=''${KUSTOMIZE_VER} \
               --build-arg SOPS_VERSION=''${SOPS_VER} \
               --build-arg HELM_VERSION=''${HELM_VER}
        ```

        # Push image

        ```bash
        docker tag muehlemannpopp/gke-deploy-tools:latest \
               muehlemannpopp/gke-deploy-tools:''${TOOL_VER}
        docker push muehlemannpopp/gke-deploy-tools:''${TOOL_VER}
        docker push muehlemannpopp/gke-deploy-tools:latest
        ```


        # Dependency versions

        | dependency   | version        | last updated               | digest                                                                  |
        |------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
        | google-cloud | ''${CLOUD_SDK_BASE_IMAGE} | ''${CLOUD_SDK_BASE_IMAGE_DATE} | ''${CLOUD_SDK_BASE_IMAGE_HASH} |
        | kustomize    | ''${KUSTOMIZE_VER} | ''${KUSTOMIZE_DATE} |                                                                         |
        | sops         | ''${SOPS_VER}          | ''${SOPS_DATE}       |                                                                         |
        | Helm         | ''${HELM_VER}         | ''${HELM_DATE}       |                                                                         |


        ## Google Cloud SDK

        The latest base image version can be checked here:

        <https://hub.docker.com/r/google/cloud-sdk/tags>


        ## Kustomize

        The latest `kustomize` version can be checked here:

        <https://github.com/kubernetes-sigs/kustomize/releases>


        ## Sops

        The latest `sops` version can be checked here:

        <https://github.com/mozilla/sops/releases>


        ## Helm

        The latest `Helm` version can be checked here:

        <https://github.com/helm/helm/releases>
      '';

      dockerfile-generator = pkgs.writeShellApplication {
        name = "dockerfile-generator";
        runtimeInputs = [ pkgs.gettext pkgs.jq get-cloud-sdk-script ]
          ++ get-release-scripts;
        text = ''

          cloud_sdk=$(get-cloud-sdk-release)
          CLOUD_SDK_BASE_IMAGE=$(jq -r '.name' <<<"$cloud_sdk")
          export CLOUD_SDK_BASE_IMAGE
          CLOUD_SDK_BASE_IMAGE_DATE=$(jq -r '.published_at' <<<"$cloud_sdk")
          export CLOUD_SDK_BASE_IMAGE_DATE
          CLOUD_SDK_BASE_IMAGE_HASH=$(jq -r '.digest' <<<"$cloud_sdk")
          export CLOUD_SDK_BASE_IMAGE_HASH

          #TOOL_VER=$(sed '$CLOUD_SDK_BASE_IMAGE/-alpine//g'")
          TOOL_VER="''${CLOUD_SDK_BASE_IMAGE//-alpine/}"
          export TOOL_VER          

          kustomize=$(get-kustomize-release)
          KUSTOMIZE_VER=$(jq -r '.name' <<<"$kustomize" )
          export KUSTOMIZE_VER
          KUSTOMIZE_DATE=$(jq -r '.published_at' <<<"$kustomize")
          export KUSTOMIZE_DATE

          sops=$(get-sops-release)
          SOPS_VER=$(jq -r '.name' <<<"$sops" )
          export SOPS_VER
          SOPS_DATE=$(jq -r '.published_at' <<<"$sops" )
          export SOPS_DATE

          helm=$(get-helm-release)
          HELM_VER=$(jq -r '.name' <<<"$helm" )
          export HELM_VER
          HELM_DATE=$(jq -r '.published_at' <<<"$helm" )
          export HELM_DATE

          echo "TOOL_VER=''${TOOL_VER}"
          echo "CLOUD_SDK_BASE_IMAGE=''${CLOUD_SDK_BASE_IMAGE}"
          echo "CLOUD_SDK_BASE_IMAGE_DATE=''${CLOUD_SDK_BASE_IMAGE_DATE}"
          echo "CLOUD_SDK_BASE_IMAGE_HASH=''${CLOUD_SDK_BASE_IMAGE_HASH}"
          echo "KUSTOMIZE_VER=''${KUSTOMIZE_VER}"
          echo "KUSTOMIZE_DATE=''${KUSTOMIZE_DATE}"
          echo "SOPS_VER=''${SOPS_VER}"
          echo "SOPS_DATE=''${SOPS_DATE}"
          echo "HELM_VER=''${HELM_VER}"
          echo "HELM_DATE=''${HELM_DATE}"

          # shellcheck disable=SC2016 
          envsubst '
          ''${CLOUD_SDK_BASE_IMAGE}
          ''${CLOUD_SDK_BASE_IMAGE_HASH}
          ''${KUSTOMIZE_VER}
          ''${SOPS_VER}
          ''${HELM_VER}
          ' <${dockerfile-template} >Dockerfile 

          # shellcheck disable=SC2016 
          envsubst '
          ''${CLOUD_SDK_BASE_IMAGE}
          ''${CLOUD_SDK_BASE_IMAGE_HASH}
          ''${CLOUD_SDK_BASE_IMAGE_DATE}
          ''${TOOL_VER}
          ''${KUSTOMIZE_VER}
          ''${KUSTOMIZE_DATE}
          ''${SOPS_VER}
          ''${SOPS_DATE}
          ''${HELM_VER}
          ''${HELM_DATE}
          ' <${readme-template} >README.md 
        '';
      };

      get-release-script = name: repo: filter-regex: transform-regex:
        pkgs.writeShellApplication {
          name = "get-${name}-release";
          runtimeInputs = [ pkgs.gh ];
          text = ''
            gh api repos/${repo}/releases --jq '. | map(select(.name | . != null and test("${filter-regex}"))) | {name: .[0].name | match ("${transform-regex}").captures[0].string, published_at: .[0].published_at}';
          '';
        };

      get-cloud-sdk-script = pkgs.writeShellApplication {
        name = "get-cloud-sdk-release";
        runtimeInputs = with pkgs; [ curl jq ];
        text = ''
          curl -s https://registry.hub.docker.com/v2/repositories/google/cloud-sdk/tags |
            jq -r '.results | map(select(.name | . != null and test(".*-alpine$"))) | .[0] | { name: .name, published_at: .tag_last_pushed, digest: .digest }';
        '';
      };
      get-release-scripts-data = {
        helm = {
          repo = "helm/helm";
          filter-regex = "^Helm";
          transform-regex = "^Helm v(.*)";
        };
        kustomize = {
          repo = "kubernetes-sigs/kustomize";
          filter-regex = "^kustomize";
          transform-regex = "^kustomize/v(.*)";
        };
        sops = {
          repo = "mozilla/sops";
          filter-regex = "^v";
          transform-regex = "^v(.*)";
        };
      };

      get-release-scripts = builtins.map (name:
        let value = builtins.getAttr name get-release-scripts-data;
        in get-release-script name value.repo value.filter-regex
        value.transform-regex) (builtins.attrNames get-release-scripts-data);

      git-create-pr = pkgs.writeShellApplication {
        name = "git-create-pr";
        runtimeInputs = with pkgs; [ git gh dockerfile-generator ];
        text = ''
          current_branch_name=$(git branch --show-current)
          branch_name=$(date -u +%Y_%m_%d_%H_%M_%S)

          echo "Creating git branch ''${branch_name}"
          git checkout -b "''${branch_name}"

          echo "Generating Dockerfile and README"
          dockerfile-generator

          echo "Diffing the changes"
          if git diff --exit-code; then
            echo "We did not change the code"
          else
            echo "We changed the code"
            git config user.name "dockerfile-generator"
            git config user.email "dockerfile-generator@github.actions"
            git commit -a -m "Code changes from dockerfile-generator"
            git push --set-upstream origin "''${branch_name}"
            gh pr create --title "Automated dependency bumping"                           \
                         --body "Dependencies are updated by dockerfile-generator script" \
                         --label "dependencies"
          fi

          echo "Switching back to ''${current_branch_name}"
          git switch "''${current_branch_name}"
          echo "Deleting ''${branch_name} branch"
          git branch --delete "''${branch_name}"
        '';
      };
      new-release = pkgs.writeShellApplication {
        name = "new-release";
        runtimeInputs = with pkgs; [ gh ];
        text = ''
          release_id="v$(head -n 1 Dockerfile | sed 's|^FROM google/cloud-sdk:\([0-9\\.]*\)-alpine.*$|\1|')"
          echo "Creating release: ''${release_id}"
          gh release create "''${release_id}" --generate-notes --title "''${release_id}"
        '';
      };
      nix-update = pkgs.writeShellApplication {
        name = "nix-update";
        runtimeInputs = with pkgs; [ nix git gh ];
        text = ''
          current_branch_name=$(git branch --show-current)
          branch_name=$(date -u +%Y_%m_%d_%H_%M_%S)

          echo "Creating git branch ''${branch_name}"
          git checkout -b "''${branch_name}"

          echo "Updating nix inputs"

          nix flake update 

          echo "Diffing the changes"
          if git diff --exit-code; then
            echo "We did not change the code"
          else
            echo "We changed the code"
            git config user.name "nix-flake-updater"
            git config user.email "nix-flake-updater@github.actions"
            git commit -a -m "Code changes from nix-flake-updater"
            git push --set-upstream origin "''${branch_name}"
            gh pr create --title "Automated nix flake update"                           \
                         --body "Nix flake inputs are updated" \
                         --label "dependencies"
          fi

          echo "Switching back to ''${current_branch_name}"
          git switch "''${current_branch_name}"
          echo "Deleting ''${branch_name} branch"
          git branch --delete "''${branch_name}"
        '';
      };
    in {
      checks.x86_64-linux.dockerfile-linting =
        (pkgs.runCommand "hadolint" { buildInputs = [ pkgs.hadolint ]; } ''
          hadolint ${self}/Dockerfile --ignore DL3047 > $out
        '');
      devShells.x86_64-linux = {
        default = pkgs.mkShell {
          packages = [
            dockerfile-generator
            git-create-pr
            get-cloud-sdk-script
            new-release
            nix-update
          ] ++ get-release-scripts;
        };
        git-create-pr =
          pkgs.mkShell { packages = [ git-create-pr ]; };
        new-release =
          pkgs.mkShell { packages = [ new-release ]; };
        nix-update =
          pkgs.mkShell { packages = [ nix-update ]; };
      };
    };
}
