# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.5.0 \
       --build-arg SOPS_VERSION=3.9.1 \
       --build-arg HELM_VERSION=3.16.2
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:497.0.0
docker push muehlemannpopp/gke-deploy-tools:497.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 497.0.0-alpine | 2024-10-15T18:35:19.586457Z | sha256:52cd14ad0320c2b53173d02e09b539fcb8a65bfa068e75ab72a27d59f464415c |
| kustomize    | 5.5.0        | 2024-10-09T13:17:14Z            |                              |
| sops         | 3.9.1             | 2024-10-04T05:14:58Z                 |                              |
| Helm         | 3.16.2             | 2024-10-09T19:49:39Z                 |                              |


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
