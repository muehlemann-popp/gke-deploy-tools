FROM google/cloud-sdk:435.0.1-alpine@sha256:c711568f60f858028f1328bc7c0c8c2f8de456ae9b40bf0b20515fee5822ac29 AS base
ARG KUSTOMIZE_VERSION=5.0.3
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.12.1
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:435.0.1-alpine@sha256:c711568f60f858028f1328bc7c0c8c2f8de456ae9b40bf0b20515fee5822ac29
COPY --from=base /usr/bin/kustomize /usr/bin/kustomize
COPY --from=base /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=base /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
