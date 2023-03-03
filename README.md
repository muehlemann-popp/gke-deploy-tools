# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.0.0 \
       --build-arg SOPS_VERSION=3.7.3 \
       --build-arg HELM_VERSION=3.11.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:420.0.0
docker push muehlemannpopp/gke-deploy-tools:420.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 420.0.0-alpine | 2023-02-28T16:27:51.855934Z | sha256:1c36c09e31a160ae76ee8391e8c346e1cad9e5c3d3198a34b60b7bffc3be04a9 |
| kustomize    | 5.0.0 | 2023-02-02T17:19:31Z |                                                                         |
| sops         | 3.7.3          | 2022-05-09T17:37:50Z       |                                                                         |
| Helm         | 3.11.1         | 2023-02-08T18:02:00Z       |                                                                         |


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
