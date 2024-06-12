# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.2 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.15.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:480.0.0
docker push muehlemannpopp/gke-deploy-tools:480.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 480.0.0-alpine | 2024-06-12T04:10:03.946182Z | sha256:6a0f0ecf1f3db4563b4d952f36674e3d4e7ec8964e7af05b3c3c4c0d8061d994 |
| kustomize    | 5.4.2        | 2024-05-22T15:28:37Z            |                              |
| sops         | 3.8.1             | 2023-10-11T15:25:32Z                 |                              |
| Helm         | 3.15.1             | 2024-05-23T16:01:32Z                 |                              |


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
