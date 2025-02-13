# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.6.0 \
       --build-arg SOPS_VERSION=3.9.4 \
       --build-arg HELM_VERSION=3.17.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:510.0.0
docker push muehlemannpopp/gke-deploy-tools:510.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 510.0.0-alpine | 2025-02-11T15:45:23.993605Z | sha256:9ad259397860aed208bcdd92af34b270d095e5d79659c05ba55d59d436657b1b |
| kustomize    | 5.6.0        | 2025-01-14T15:32:11Z            |                              |
| sops         | 3.9.4             | 2025-01-25T19:46:43Z                 |                              |
| Helm         | 3.17.1             | 2025-02-12T21:01:05Z                 |                              |


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
