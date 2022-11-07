
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.10.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:408.0.1
docker push muehlemannpopp/gke-deploy-tools:408.0.1
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Dependency versions

| dependency   | version          | last updated                | digest                                                                  |
|------------ |---------------- |--------------------------- |----------------------------------------------------------------------- |
| google-cloud | 408.0.1-alpine   | 2022-11-02T22:15:31.601845Z | sha256:61ed9eaee69862f312e79ebeb7c0d61aa3b415c3e3cb7ab5d8b756f5c5d86902 |
| kustomize    | kustomize/v4.5.7 | 2022-08-02T16:39:10Z        |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z        |                                                                         |
| Helm         | Helm 3.10.1      | 2022-10-12T20:51:20Z        |                                                                         |

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
