FROM google/cloud-sdk:462.0.1-alpine@sha256:c2903ae8eeba3e9d31e5e62ad1b6ab8647ddd87d8abd4efa95c9d1cc15dfdcf7 AS base
ARG KUSTOMIZE_VERSION=5.3.0
ARG SOPS_VERSION=3.8.1
ARG HELM_VERSION=3.14.0
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:462.0.1-alpine@sha256:c2903ae8eeba3e9d31e5e62ad1b6ab8647ddd87d8abd4efa95c9d1cc15dfdcf7
COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=base /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
