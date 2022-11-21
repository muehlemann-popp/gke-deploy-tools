# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.10.2
```


# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:410.0.0
docker push muehlemannpopp/gke-deploy-tools:410.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version          | last updated                | digest                                                                  |
|------------ |---------------- |--------------------------- |----------------------------------------------------------------------- |
| google-cloud | 410.0.0-alpine   | 2022-11-15T19:15:33.640248Z | sha256:0cce8b6a4677749c39e3aeb7bcb783c369ee2729a3104e2d51b557356691579c |
| kustomize    | kustomize/v4.5.7 | 2022-08-02T16:39:10Z        |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z        |                                                                         |
| Helm         | Helm v3.10.2     | 2022-11-10T17:13:10Z        |                                                                         |


## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>


## Kustomize

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>


## Sops

The latest `sops` version can be checked here:

<https://github.com/mozilla/sops/releases>


## Helm

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>