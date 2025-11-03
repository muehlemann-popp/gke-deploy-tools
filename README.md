# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.7.1 \
       --build-arg SOPS_VERSION=3.11.0 \
       --build-arg HELM_VERSION=3.19.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:545.0.0
docker push muehlemannpopp/gke-deploy-tools:545.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 545.0.0-alpine | 2025-10-28T19:06:54.072065Z | sha256:69857eb8768d2eaa0d84b84098d54a590c5bc3080ccdb51034a3756c839762c2 |
| kustomize    | 5.7.1        | 2025-07-23T12:54:41Z            |                              |
| sops         | 3.11.0             | 2025-09-28T18:28:49Z                 |                              |
| Helm         | 3.19.0             | 2025-09-11T21:06:02Z                 |                              |


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
