
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.9.4
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:400.0.0 \
       muehlemannpopp/gke-deploy-tools:latest
docker push muehlemannpopp/gke-deploy-tools:400.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Checking the version of the dependencies

## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>

## Kustomize

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>

## Sops

The latest `sops` version can be checked here:

<https://github.com/mozilla/sops/releases>

## Helm

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>
