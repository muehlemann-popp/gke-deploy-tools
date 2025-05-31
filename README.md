# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.6.0 \
       --build-arg SOPS_VERSION=3.10.2 \
       --build-arg HELM_VERSION=3.18.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:524.0.0
docker push muehlemannpopp/gke-deploy-tools:524.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 524.0.0-alpine | 2025-05-28T15:03:10.407991Z | sha256:cad12907540b1a43c9279503796723817e62da1f8fd3b8723755effb9d55e1e1 |
| kustomize    | 5.6.0        | 2025-01-14T15:32:11Z            |                              |
| sops         | 3.10.2             | 2025-04-14T19:17:02Z                 |                              |
| Helm         | 3.18.1             | 2025-05-28T19:25:31Z                 |                              |


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
