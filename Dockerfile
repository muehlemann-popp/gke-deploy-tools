FROM google/cloud-sdk:402.0.0-alpine@sha256:20ec5831f167b1e1283348a98651b1068fa46cabad4c349758be75038e55df8a
ARG KUSTOMIZE_VERSION=4.5.7
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.9.4
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:402.0.0-alpine@sha256:20ec5831f167b1e1283348a98651b1068fa46cabad4c349758be75038e55df8a
COPY --from=0 /usr/bin/kustomize /usr/bin/kustomize
COPY --from=0 /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=0 /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
