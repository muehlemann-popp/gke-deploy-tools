FROM google/cloud-sdk:411.0.0-alpine@sha256:2221cfdb0c94a90ef015684e1f6b2de36246e118b0db355eeb263a18548de6f3
ARG KUSTOMIZE_VERSION=4.5.7
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.10.2
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:411.0.0-alpine@sha256:2221cfdb0c94a90ef015684e1f6b2de36246e118b0db355eeb263a18548de6f3
COPY --from=0 /usr/bin/kustomize /usr/bin/kustomize
COPY --from=0 /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=0 /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
