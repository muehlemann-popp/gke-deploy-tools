# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.6.0 \
       --build-arg SOPS_VERSION=3.9.4 \
       --build-arg HELM_VERSION=3.17.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:509.0.0
docker push muehlemannpopp/gke-deploy-tools:509.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 509.0.0-alpine | 2025-02-04T15:35:58.445205Z | sha256:9a77c6865401e6f80d9a693a6ee4b05fc9fc509e104a92c493d90e1f172eb8ba |
| kustomize    | 5.6.0        | 2025-01-14T15:32:11Z            |                              |
| sops         | 3.9.4             | 2025-01-25T19:46:43Z                 |                              |
| Helm         | 3.17.0             | 2025-01-15T21:55:26Z                 |                              |


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
