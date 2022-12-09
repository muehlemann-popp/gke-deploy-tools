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
       muehlemannpopp/gke-deploy-tools:411.0.0
docker push muehlemannpopp/gke-deploy-tools:411.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version          | last updated                | digest                                                                  |
|------------ |---------------- |--------------------------- |----------------------------------------------------------------------- |
| google-cloud | 411.0.0-alpine   | 2022-12-06T17:25:30.729839Z | sha256:2221cfdb0c94a90ef015684e1f6b2de36246e118b0db355eeb263a18548de6f3 |
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