# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.2 \
       --build-arg SOPS_VERSION=3.9.0 \
       --build-arg HELM_VERSION=3.15.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:482.0.0
docker push muehlemannpopp/gke-deploy-tools:482.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 482.0.0-alpine | 2024-06-27T10:50:24.391823Z | sha256:631e956c53d40b5ca68902d40e6f9b61f20a38cb9502aa27a1ce86ee78b36b71 |
| kustomize    | 5.4.2        | 2024-05-22T15:28:37Z            |                              |
| sops         | 3.9.0             | 2024-06-28T06:14:47Z                 |                              |
| Helm         | 3.15.2             | 2024-06-12T14:17:48Z                 |                              |


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
