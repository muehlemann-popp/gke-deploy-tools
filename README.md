# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.6.0 \
       --build-arg SOPS_VERSION=3.9.3 \
       --build-arg HELM_VERSION=3.17.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:506.0.0
docker push muehlemannpopp/gke-deploy-tools:506.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 506.0.0-alpine | 2025-01-14T10:52:22.00968Z | sha256:394e7fe1be5ee95fbd0ff376ed6bfc38ea56329dc2fe8747d5dd3327732e1cf0 |
| kustomize    | 5.6.0        | 2025-01-14T15:32:11Z            |                              |
| sops         | 3.9.3             | 2024-12-31T12:54:35Z                 |                              |
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
