# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.1.0 \
       --build-arg SOPS_VERSION=3.7.3 \
       --build-arg HELM_VERSION=3.12.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:436.0.0
docker push muehlemannpopp/gke-deploy-tools:436.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 436.0.0-alpine | 2023-06-26T10:52:24.362948Z | sha256:4dbfea08fa1a452c80b2cd69a70a58d252a8d73bfcfa8234f70af34fb6be9c96 |
| kustomize    | 5.1.0 | 2023-06-19T17:03:14Z |                                                                         |
| sops         | 3.7.3          | 2022-05-09T17:37:50Z       |                                                                         |
| Helm         | 3.12.1         | 2023-06-14T20:52:55Z       |                                                                         |


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
