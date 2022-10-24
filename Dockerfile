FROM google/cloud-sdk:406.0.0-alpine@sha256:f50a39bf88bccb033af6ee606340456754f7f78b00b89f087cf8e66a258b8379
ARG KUSTOMIZE_VERSION=4.5.7
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.10.1
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:406.0.0-alpine@sha256:f50a39bf88bccb033af6ee606340456754f7f78b00b89f087cf8e66a258b8379
COPY --from=0 /usr/bin/kustomize /usr/bin/kustomize
COPY --from=0 /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=0 /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
