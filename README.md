# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.1 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.14.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:475.0.0
docker push muehlemannpopp/gke-deploy-tools:475.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 475.0.0-alpine | 2024-05-07T15:53:18.376948Z | sha256:bbc76c6e89ed29657598378643aee1e55af25cdd7d9a6a7f397c22112e078388 |
| kustomize    | 5.4.1        | 2024-04-04T17:18:31Z            |                              |
| sops         | 3.8.1             | 2023-10-11T15:25:32Z                 |                              |
| Helm         | 3.14.4             | 2024-04-10T20:45:47Z                 |                              |


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
