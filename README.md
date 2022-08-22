- [Build image](#sec-1)
- [Push image](#sec-2)
- [Checking the version of the dependencies](#sec-3)
  - [Google Cloud SDK](#sec-3-1)
  - [Kustomize](#sec-3-2)
  - [Sops](#sec-3-3)
  - [Helm](#sec-3-4)


# Build image<a id="sec-1"></a>

You can manually build the Docker image with the following command:

```bash
docker build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.9.3
```

# Push image<a id="sec-2"></a>

```bash
docker tag muehlemannpopp/gke-deploy-tools:398.0.0 \
       muehlemannpopp/gke-deploy-tools:latest
docker push muehlemannpopp/gke-deploy-tools:398.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Checking the version of the dependencies<a id="sec-3"></a>

## Google Cloud SDK<a id="sec-3-1"></a>

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>

## Kustomize<a id="sec-3-2"></a>

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>

## Sops<a id="sec-3-3"></a>

The latest `sops` version can be checked here:

<https://github.com/mozilla/sops/releases>

## Helm<a id="sec-3-4"></a>

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>
