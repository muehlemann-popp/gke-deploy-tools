FROM google/cloud-sdk:418.0.0-alpine@sha256:2efaf225a4336e94bf0010faa5719981cdef722954271ba9eb8e3497f6100cfb
ARG KUSTOMIZE_VERSION=5.0.0
ARG SOPS_VERSION=3.7.3
ARG HELM_VERSION=3.11.1
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz /tmp
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz /tmp
RUN tar xf /tmp/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
    tar xf /tmp/helm-v${HELM_VERSION}-linux-amd64.tar.gz -C /usr/bin && \
    wget https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64 -O /usr/bin/sops && \
    chmod a+x /usr/bin/sops

FROM google/cloud-sdk:418.0.0-alpine@sha256:2efaf225a4336e94bf0010faa5719981cdef722954271ba9eb8e3497f6100cfb
COPY --from=0 /usr/bin/kustomize /usr/bin/kustomize
COPY --from=0 /usr/bin/linux-amd64/helm /usr/bin/helm
COPY --from=0 /usr/bin/sops /usr/bin/sops

RUN gcloud components install gke-gcloud-auth-plugin && \
    gcloud components install kubectl                && \
    addgroup -S deployer && adduser -S deployer -G deployer

USER deployer
WORKDIR /home/deployer
