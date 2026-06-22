# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.1 \
       --build-arg SOPS_VERSION=3.13.1 \
       --build-arg HELM_VERSION=3.21.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:573.0.0
docker push muehlemannpopp/gke-deploy-tools:573.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 573.0.0-alpine | 2026-06-16T19:13:11.054329Z | sha256:986ed5cfc306a28fa14a2595bd8dfaeea64fd049cdc5c9d9002eb08b78ae2615 |
| kustomize    | 5.8.1        | 2026-02-09T16:40:16Z            |                              |
| sops         | 3.13.1             | 2026-05-16T14:32:59Z                 |                              |
| Helm         | 3.21.2             | 2026-06-20T04:36:23Z                 |                              |


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
