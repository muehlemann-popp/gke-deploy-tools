# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.0 \
       --build-arg SOPS_VERSION=3.11.0 \
       --build-arg HELM_VERSION=4.0.5
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:552.0.0
docker push muehlemannpopp/gke-deploy-tools:552.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 552.0.0-alpine | 2026-01-13T16:48:47.209603Z | sha256:a5c1fd097775fa98883f9887158738da930cace20748dc03791198544c61cf09 |
| kustomize    | 5.8.0        | 2025-11-09T15:00:06Z            |                              |
| sops         | 3.11.0             | 2025-09-28T18:28:49Z                 |                              |
| Helm         | 4.0.5             | 2026-01-14T23:46:31Z                 |                              |


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
