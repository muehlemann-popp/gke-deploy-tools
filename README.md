# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.3.0 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.13.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:456.0.0
docker push muehlemannpopp/gke-deploy-tools:456.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 456.0.0-alpine | 2023-12-09T11:53:46.473302Z | sha256:fef22a1e06b30a5923ba517347c66f79fa79ad608cb4c820d33ebdc70c6f9280 |
| kustomize    | 5.3.0 | 2023-12-07T10:53:09Z |                                                                         |
| sops         | 3.8.1          | 2023-10-11T15:25:32Z       |                                                                         |
| Helm         | 3.13.2         | 2023-11-08T13:39:28Z       |                                                                         |


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
