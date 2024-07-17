# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.4.2 \
       --build-arg SOPS_VERSION=3.9.0 \
       --build-arg HELM_VERSION=3.15.3
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:484.0.0
docker push muehlemannpopp/gke-deploy-tools:484.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 484.0.0-alpine | 2024-07-16T16:05:35.167616Z | sha256:2546e448718ffa68c934af13728e927f48b5b9fd74aa14539a48e000662413c9 |
| kustomize    | 5.4.2        | 2024-05-22T15:28:37Z            |                              |
| sops         | 3.9.0             | 2024-06-28T06:14:47Z                 |                              |
| Helm         | 3.15.3             | 2024-07-10T19:41:53Z                 |                              |


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
