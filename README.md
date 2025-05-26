# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.6.0 \
       --build-arg SOPS_VERSION=3.10.2 \
       --build-arg HELM_VERSION=3.18.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:523.0.1
docker push muehlemannpopp/gke-deploy-tools:523.0.1
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 523.0.1-alpine | 2025-05-23T13:21:33.448445Z | sha256:389927ec8e32bb80b6d97c28bff55ff41ad1cca566d3ff3f473df1b50949a5a4 |
| kustomize    | 5.6.0        | 2025-01-14T15:32:11Z            |                              |
| sops         | 3.10.2             | 2025-04-14T19:17:02Z                 |                              |
| Helm         | 3.18.0             | 2025-05-19T17:54:54Z                 |                              |


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
