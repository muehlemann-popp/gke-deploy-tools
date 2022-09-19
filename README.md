
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
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:402.0.0
docker push muehlemannpopp/gke-deploy-tools:402.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Checking the version of the dependencies

## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>

Latest alpine image tag is `402.0.0-alpine` updated at *2022-09-14T14:44:28.483417Z*.

The digest is `sha256:20ec5831f167b1e1283348a98651b1068fa46cabad4c349758be75038e55df8a`.

## Kustomize

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>

Latest kustomize release is `kustomize/v4.5.7` published at *2022-08-02T16:39:10Z*.

## Sops

The latest `sops` version can be checked here:

<https://github.com/mozilla/sops/releases>

Latest sops release is `v3.7.3` published at *2022-05-09T17:37:50Z*.

## Helm

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>

Latest Helm release is `Helm 3.9.4` published at *2022-08-24T20:00:15Z*.
