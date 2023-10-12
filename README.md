# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.1.1 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.13.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:450.0.0
docker push muehlemannpopp/gke-deploy-tools:450.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 450.0.0-alpine | 2023-10-11T10:55:28.956827Z | sha256:b2ec3cfa2fc62418a6e39f61649ee95772b9235e8498cbd1cc5c239ad179e618 |
| kustomize    | 5.1.1 | 2023-07-31T17:20:01Z |                                                                         |
| sops         | 3.8.1          | 2023-10-11T15:25:32Z       |                                                                         |
| Helm         | 3.13.0         | 2023-09-27T20:51:15Z       |                                                                         |


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
