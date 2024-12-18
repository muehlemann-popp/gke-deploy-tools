# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.5.0 \
       --build-arg SOPS_VERSION=3.9.2 \
       --build-arg HELM_VERSION=3.16.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:504.0.0
docker push muehlemannpopp/gke-deploy-tools:504.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 504.0.0-alpine | 2024-12-17T16:36:53.025911Z | sha256:1f53910cc44a8661592241e166ef6318414179358d23a3607b0d4b00676bd859 |
| kustomize    | 5.5.0        | 2024-10-09T13:17:14Z            |                              |
| sops         | 3.9.2             | 2024-12-02T20:21:48Z                 |                              |
| Helm         | 3.16.4             | 2024-12-16T18:53:38Z                 |                              |


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
