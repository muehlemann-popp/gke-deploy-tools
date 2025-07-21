FROM google/cloud-sdk:530.0.0-alpine@sha256:25acf81d3b7db5a22f5c5b8dad9b191b70f0cec2c0743ee59c5c9244ef7b6996 AS base
ARG KUSTOMIZE_VERSION=5.7.0
ARG SOPS_VERSION=3.10.2
ARG HELM_VERSION=3.17.4
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:530.0.0-alpine@sha256:25acf81d3b7db5a22f5c5b8dad9b191b70f0cec2c0743ee59c5c9244ef7b6996
COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=base /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
