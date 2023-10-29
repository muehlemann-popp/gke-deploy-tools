# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=5.2.1 \
       --build-arg SOPS_VERSION=3.8.1 \
       --build-arg HELM_VERSION=3.13.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:452.0.1
docker push muehlemannpopp/gke-deploy-tools:452.0.1
docker push muehlemannpopp/gke-deploy-tools:latest
```


# Dependency versions

| dependency   | version        | last updated               | digest                                                                  |
|------------ |-------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 452.0.1-alpine | 2023-10-28T10:55:33.116666Z | sha256:ac675c1076b45a6b4ee7ea618c058d80ece02040e2f0a237816935ab724054b4 |
| kustomize    | 5.2.1 | 2023-10-19T20:22:10Z |                                                                         |
| sops         | 3.8.1          | 2023-10-11T15:25:32Z       |                                                                         |
| Helm         | 3.13.1         | 2023-10-12T14:10:22Z       |                                                                         |


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
