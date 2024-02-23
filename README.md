# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.3.0 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.14.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:465.0.0
docker push muehlemannpopp/gke-deploy-tools:465.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 465.0.0-alpine | 2024-02-22T11:55:13.425115Z | sha256:9cca8fc6fc93b77ad7358c8522d0554164b5d766c5e1e719ca60578c164b87be |
| kustomize    | 5.3.0 | 2023-12-07T10:53:09Z |                                                                         |
| sops         | 3.8.1          | 2023-10-11T15:25:32Z       |                                                                         |
| Helm         | 3.14.2         | 2024-02-21T20:39:45Z       |                                                                         |


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
