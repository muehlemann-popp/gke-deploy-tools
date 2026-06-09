# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.8.1 \
       --build-arg SOPS_VERSION=3.13.1 \
       --build-arg HELM_VERSION=4.2.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:571.0.0
docker push muehlemannpopp/gke-deploy-tools:571.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 571.0.0-alpine | 2026-06-02T12:56:27.180088Z | sha256:84b3a5f9842a1956d2650e632439997466b514861789706444e552da0712a78e |
| kustomize    | 5.8.1        | 2026-02-09T16:40:16Z            |                              |
| sops         | 3.13.1             | 2026-05-16T14:32:59Z                 |                              |
| Helm         | 4.2.0             | 2026-05-14T01:13:00Z                 |                              |


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
