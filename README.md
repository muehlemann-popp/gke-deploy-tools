# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.7.0 \
       --build-arg SOPS_VERSION=3.10.2 \
       --build-arg HELM_VERSION=3.17.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:530.0.0
docker push muehlemannpopp/gke-deploy-tools:530.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 530.0.0-alpine | 2025-07-15T15:52:06.293385Z | sha256:25acf81d3b7db5a22f5c5b8dad9b191b70f0cec2c0743ee59c5c9244ef7b6996 |
| kustomize    | 5.7.0        | 2025-06-28T07:09:54Z            |                              |
| sops         | 3.10.2             | 2025-04-14T19:17:02Z                 |                              |
| Helm         | 3.17.4             | 2025-07-16T19:30:02Z                 |                              |


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
