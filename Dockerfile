FROM google/cloud-sdk:444.0.0-alpine@sha256:6e651907a452838350be09a8407a4f894737fe3034495d1aa58fa2ec5b5ca29e AS base
ARG KUSTOMIZE_VERSION=5.1.1
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.12.3
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:444.0.0-alpine@sha256:6e651907a452838350be09a8407a4f894737fe3034495d1aa58fa2ec5b5ca29e
COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=base /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
