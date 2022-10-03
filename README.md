
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.10.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:403.0.0
docker push muehlemannpopp/gke-deploy-tools:403.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Dependency versions

| dependency   | version          | last updated                | digest                                                                  |
|------------ |---------------- |--------------------------- |----------------------------------------------------------------------- |
| google-cloud | 404.0.0-alpine   | 2022-09-27T18:24:00.536393Z | sha256:9f002ad4b9c14026b84e4ac5684c0aff4f167acb7982c32be2db45798f70ba8c |
| kustomize    | kustomize/v4.5.7 | 2022-08-02T16:39:10Z        |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z        |                                                                         |
| Helm         | Helm 3.10.0      | 2022-09-21T17:32:35Z        |                                                                         |

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
