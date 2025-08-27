# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.7.1 \
       --build-arg SOPS_VERSION=3.10.2 \
       --build-arg HELM_VERSION=3.18.6
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:536.0.0
docker push muehlemannpopp/gke-deploy-tools:536.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version                 | last updated                 | digest                       |
|--------------|-------------------------|------------------------------|------------------------------|
| google-cloud | 536.0.0-alpine | 2025-08-26T14:06:50.145583Z | sha256:110bee5ced066c82ae5a967299691b587386b14a0ceeb697787f1b95fe180efe |
| kustomize    | 5.7.1        | 2025-07-23T12:54:41Z            |                              |
| sops         | 3.10.2             | 2025-04-14T19:17:02Z                 |                              |
| Helm         | 3.18.6             | 2025-08-19T20:33:29Z                 |                              |


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
