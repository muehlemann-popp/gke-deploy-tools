# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.3 \
       --build-arg SOPS_VERSION=3.9.0 \
       --build-arg HELM_VERSION=3.15.3
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:487.0.0
docker push muehlemannpopp/gke-deploy-tools:487.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 487.0.0-alpine | 2024-08-06T18:51:07.983752Z | sha256:6107ccd19bf65819f63763b9c04d3f3fd68293a0856e941cfb4ecb108451c93b |
| kustomize    | 5.4.3        | 2024-07-19T16:52:40Z            |                              |
| sops         | 3.9.0             | 2024-06-28T06:14:47Z                 |                              |
| Helm         | 3.15.3             | 2024-07-10T19:41:53Z                 |                              |


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
