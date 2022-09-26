
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.10.0
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:403.0.0
docker push muehlemannpopp/gke-deploy-tools:403.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Checking the version of the dependencies

## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>

Latest alpine image tag is `403.0.0-alpine` updated at *2022-09-23T15:06:30.03001Z*.

The digest is `sha256:3791683bade5ec26f37527d09cd531a617c0fb96da89154eb2b0484c97020f4a`.

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

Latest Helm release is `Helm 3.10.0` published at *2022-09-21T17:32:35Z*.
