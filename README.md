# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.11.0
```


# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:415.0.0
docker push muehlemannpopp/gke-deploy-tools:415.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version          | last updated                | digest                                                                  |
|------------ |---------------- |--------------------------- |----------------------------------------------------------------------- |
| google-cloud | 416.0.0-alpine   | 2023-02-01T12:52:01.987657Z | sha256:bf106d79c8d20925981b76f414c968ed4a19c3a19b73369d28ae1aeea6482c81 |
| kustomize    | kustomize/v5.0.0 | 2023-02-02T17:19:31Z        |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z        |                                                                         |
| Helm         | Helm v3.11.0     | 2023-01-18T17:33:47Z        |                                                                         |


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