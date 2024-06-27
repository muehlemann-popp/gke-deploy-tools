# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.2 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.15.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:482.0.0
docker push muehlemannpopp/gke-deploy-tools:482.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 482.0.0-alpine | 2024-06-26T10:48:50.037869Z | sha256:4b315c729d22f0a8e31638e55edbfffb5191876d79c5bc8837f8141d0586efab |
| kustomize    | 5.4.2        | 2024-05-22T15:28:37Z            |                              |
| sops         | 3.8.1             | 2023-10-11T15:25:32Z                 |                              |
| Helm         | 3.15.2             | 2024-06-12T14:17:48Z                 |                              |


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
