
# Build image

You can manually build the Docker image with the following command:

```bash
docker buildx build . -t muehlemannpopp/gke-deploy-tools:latest \
       --build-arg KUSTOMIZE_VERSION=4.5.7 \
       --build-arg SOPS_VERSION=3.7.3      \
       --build-arg HELM_VERSION=3.10.1
```

# Push image

```bash
docker tag muehlemannpopp/gke-deploy-tools:latest \
       muehlemannpopp/gke-deploy-tools:408.0.0
docker push muehlemannpopp/gke-deploy-tools:408.0.0
docker push muehlemannpopp/gke-deploy-tools:latest
```

# Dependency versions

| dependency   | version          | last updated               | digest                                                                  |
|------------ |---------------- |-------------------------- |----------------------------------------------------------------------- |
| google-cloud | 408.0.0-alpine   | 2022-11-01T20:02:11.72889Z | sha256:f64c0f8f9a58c0821391dbb987cf567278c907c828dddc056d7f369c57177c82 |
| kustomize    | kustomize/v4.5.7 | 2022-08-02T16:39:10Z       |                                                                         |
| sops         | v3.7.3           | 2022-05-09T17:37:50Z       |                                                                         |
| Helm         | Helm 3.10.1      | 2022-10-12T20:51:20Z       |                                                                         |

## Google Cloud SDK

The latest base image version can be checked here:

<https://hub.docker.com/r/google/cloud-sdk/tags>

```restclient
GET https://registry.hub.docker.com/v2/repositories/google/cloud-sdk/tags
```

```elisp
;; supported fields: name, last_updated, digest
(let ((tag-data (seq-find (lambda (tag-data)
                            (string-suffix-p "-alpine" (alist-get 'name tag-data)))
                          (alist-get 'results (json-read-from-string tags)))))
  (alist-get field tag-data))
```

## Kustomize

The latest `kustomize` version can be checked here:

<https://github.com/kubernetes-sigs/kustomize/releases>

```restclient
GET https://api.github.com/repos/:repo/releases
Accept: application/vnd.github+json
User-Agent: emacs-org-mode
```

```elisp
;; supported fields: name, published_at
(let ((tag-data (seq-find (lambda (release-data)
                            (string-prefix-p "kustomize" (alist-get 'name release-data)))
                          (json-read-from-string releases))))
  (alist-get field tag-data))
```

## Sops

The latest `sops` version can be checked here:

<https://github.com/mozilla/sops/releases>

```elisp
;; supported fields: name, published_at
(let ((tag-data (seq-find (lambda (release-data)
                            (string-prefix-p "v" (alist-get 'name release-data)))
                          (json-read-from-string releases))))
  (alist-get field tag-data))
```

## Helm

The latest `Helm` version can be checked here:

<https://github.com/helm/helm/releases>

```elisp
;; supported fields: name, published_at
(let ((tag-data (seq-find (lambda (release-data)
                            (string-prefix-p "Helm" (alist-get 'name release-data)))
                          (json-read-from-string releases))))
  (alist-get field tag-data))
```
