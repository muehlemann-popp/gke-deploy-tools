
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.9.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:402.0.0
docker push muehlemannpopp/gke-deploy-tools:402.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Dependency versions

| dependency   | version          | last updated               | digest                                                                  |
|------------ |---------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 403.0.0-alpine   | 2022-09-23T15:06:30.03001Z | sha256:3791683bade5ec26f37527d09cd531a617c0fb96da89154eb2b0484c97020f4a |
| kustomize    | kustomize/v4.5.7 | 2022-05-09T17:37:50Z       |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z       |                                                                         |
| Helm         | Helm 3.10.0      | 2022-09-21T17:32:35Z       |                                                                         |

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
