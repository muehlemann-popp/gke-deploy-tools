# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=${KUSTOMIZE_VER} \
       --build-arg SOPS_VERSION=${SOPS_VER} \
       --build-arg HELM_VERSION=${HELM_VER}
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:${TOOL_VER}
docker push muehlemannpopp/gke-deploy-tools:${TOOL_VER}
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | ${CLOUD_SDK_BASE_IMAGE} | ${CLOUD_SDK_BASE_IMAGE_DATE} | ${CLOUD_SDK_BASE_IMAGE_HASH} |
| kustomize    | ${KUSTOMIZE_VER}        | ${KUSTOMIZE_DATE}            |                              |
| sops         | ${SOPS_VER}             | ${SOPS_DATE}                 |                              |
| Helm         | ${HELM_VER}             | ${HELM_DATE}                 |                              |


## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>


## Kustomize

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>


## Sops

The latest `sops` version can be checked here:

<https://github.com/getsops/sops/releases>


## Helm

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>
