FROM google/cloud-sdk:398.0.0-alpine@sha256:282aa5efa274bd99f2ede0b07807994525282c9d6facc764fc22521e521fae83
ARG KUSTOMIZE_VERSION
ARG SOPS_VERSION
ARG HELM_VERSION
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin

FROM google/cloud-sdk:398.0.0-alpine@sha256:282aa5efa274bd99f2ede0b07807994525282c9d6facc764fc22521e521fae83
ARG SOPS_VERSION
COPY --from=0 /usr/bin/kustomize /usr/bin/kustomize
COPY --from=0 /usr/bin/linux-amd64/helm /usr/bin/helm

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops                          && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
