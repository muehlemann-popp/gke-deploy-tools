# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.1 \
       --build-arg SOPS_VERSION=3.12.2 \
       --build-arg HELM_VERSION=4.1.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:566.0.0
docker push muehlemannpopp/gke-deploy-tools:566.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 566.0.0-alpine | 2026-04-28T14:38:12.433637Z | sha256:33d1cbcca1a312750b7a121747f35793db71efbade15b9405510009a6d2a1b6d |
| kustomize    | 5.8.1        | 2026-02-09T16:40:16Z            |                              |
| sops         | 3.12.2             | 2026-03-18T06:11:11Z                 |                              |
| Helm         | 4.1.4             | 2026-04-09T06:01:47Z                 |                              |


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
