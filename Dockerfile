FROM google/cloud-sdk:420.0.0-alpine@sha256:1c36c09e31a160ae76ee8391e8c346e1cad9e5c3d3198a34b60b7bffc3be04a9 AS base
ARG KUSTOMIZE_VERSION=5.0.0
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.11.1
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:420.0.0-alpine@sha256:1c36c09e31a160ae76ee8391e8c346e1cad9e5c3d3198a34b60b7bffc3be04a9
COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=base /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
