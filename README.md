# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.0.3 \
       --build-arg SOPS_VERSION=3.7.3 \
       --build-arg HELM_VERSION=3.12.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:432.0.0
docker push muehlemannpopp/gke-deploy-tools:432.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 432.0.0-alpine | 2023-05-30T10:54:22.919517Z | sha256:209815c63c14da8aee5d7dd96d30159818d64b8a6eacfe63d2998744c75e8df5 |
| kustomize    | 5.0.3 | 2023-05-09T20:13:29Z |                                                                         |
| sops         | 3.7.3          | 2022-05-09T17:37:50Z       |                                                                         |
| Helm         | 3.12.0         | 2023-05-10T18:22:32Z       |                                                                         |


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
