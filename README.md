# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.1 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.15.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:477.0.0
docker push muehlemannpopp/gke-deploy-tools:477.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 477.0.0-alpine | 2024-05-21T15:14:03.077555Z | sha256:577007b29199fbe39d66bc1a26a84d9842cb302d49eb3bfc659044f9f087323f |
| kustomize    | 5.4.1        | 2024-04-04T17:18:31Z            |                              |
| sops         | 3.8.1             | 2023-10-11T15:25:32Z                 |                              |
| Helm         | 3.15.0             | 2024-05-15T20:59:25Z                 |                              |


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
