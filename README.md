# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.1 \
       --build-arg SOPS_VERSION=3.13.0 \
       --build-arg HELM_VERSION=4.2.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:568.0.0
docker push muehlemannpopp/gke-deploy-tools:568.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 568.0.0-alpine | 2026-05-12T12:53:26.907184Z | sha256:e4ccce8a6c9b7480ef1510f736def23340958c79c5c96a31de0876bbf2764cf7 |
| kustomize    | 5.8.1        | 2026-02-09T16:40:16Z            |                              |
| sops         | 3.13.0             | 2026-05-08T18:10:42Z                 |                              |
| Helm         | 4.2.0             | 2026-05-14T01:13:00Z                 |                              |


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
