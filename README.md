# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.3.0 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.13.3
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:458.0.1
docker push muehlemannpopp/gke-deploy-tools:458.0.1
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 458.0.1-alpine | 2024-01-04T11:52:22.909468Z | sha256:9b14a5d3a402930143e946cc84368029a6750413497919eb247f47a103d27d94 |
| kustomize    | 5.3.0 | 2023-12-07T10:53:09Z |                                                                         |
| sops         | 3.8.1          | 2023-10-11T15:25:32Z       |                                                                         |
| Helm         | 3.13.3         | 2023-12-13T21:41:49Z       |                                                                         |


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
