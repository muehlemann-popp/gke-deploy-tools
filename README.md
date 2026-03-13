# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.1 \
       --build-arg SOPS_VERSION=3.12.1 \
       --build-arg HELM_VERSION=4.1.3
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:560.0.0
docker push muehlemannpopp/gke-deploy-tools:560.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 560.0.0-alpine | 2026-03-11T23:25:56.460201Z | sha256:29c754ca16207a2f032b741e138e26d3b170deff896a9a13a51c28bcfe7870c0 |
| kustomize    | 5.8.1        | 2026-02-09T16:40:16Z            |                              |
| sops         | 3.12.1             | 2026-02-22T07:45:09Z                 |                              |
| Helm         | 4.1.3             | 2026-03-11T23:01:58Z                 |                              |


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
