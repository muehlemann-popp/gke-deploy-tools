const github_releases = {
  helm: {
    repo: 'helm/helm'
    filter_regex: '^Helm'
    transform_regex: '^Helm v?(?<version>[0-9\.]+)$'
  }
  kustomize: {
    repo: 'kubernetes-sigs/kustomize'
    filter_regex: '^kustomize'
    transform_regex: '^kustomize/v(?<version>.*)'
  }
  sops: {
    repo: 'getsops/sops'
    filter_regex: '^v[0-9]+\.[0-9]+\.[0-9]+'
    transform_regex: '^v(?<version>.*)'
  }
}

def release-names () {
  $github_releases | columns
}

def "github-release" (release_name: string@release-names) {
  let release = $github_releases | get $release_name
  let latest_release = ^gh api $'repos/($release.repo)/releases' | from json | where name =~ ($release.filter_regex) | get 0
  {
    version: ($latest_release.name | parse --regex $release.transform_regex | get version?.0? )
    published_at: $latest_release.published_at
  }
}

def "cloud-sdk-release" () {
  let latest_release = http get 'https://registry.hub.docker.com/v2/namespaces/google/repositories/cloud-sdk/tags?page_size=30' | get results | where name =~ '.*-alpine$' | get 0
  {
    image_tag: $latest_release.name
    published_at: $latest_release.tag_last_pushed
    version: ($latest_release.name | parse --regex '^(?<version>[0-9\.]+)-alpine$' | get version?.0?)
    digest: $latest_release.digest
  }
}

def "collect-versions" () {
  release-names | reduce --fold {} { |it, acc| $acc | upsert $it (github-release $it)} | upsert 'cloud-sdk' (cloud-sdk-release)
}

def "version-update-needed?" (new_version) {
  let old_version = open 'versions.nuon'
  # release-names | append "cloud-sdk" | any { |rel_name|
  #   ($new_version | get $rel_name | get version) != ($old_version | get $rel_name | get version)
  # }
  $new_version.cloud-sdk.version != $old_version.cloud-sdk.version
}

def "update-version" () {
  let new_version = collect-versions
  let update_needed = version-update-needed? $new_version
  if $update_needed {
    print 'Updating version'
    $new_version | save -f 'versions.nuon'
  } else {
    print 'No version update is needed'
  }
  $update_needed
}

export def "update-readme" () {
  let versions = open 'versions.nuon'
  let envs = {
    CLOUD_SDK_BASE_IMAGE: $versions.cloud-sdk.image_tag
    CLOUD_SDK_BASE_IMAGE_HASH: $versions.cloud-sdk.digest
    CLOUD_SDK_BASE_IMAGE_DATE: $versions.cloud-sdk.published_at
    TOOL_VER: $versions.cloud-sdk.version
    KUSTOMIZE_VER: $versions.kustomize.version
    KUSTOMIZE_DATE: $versions.kustomize.published_at
    SOPS_VER: $versions.sops.version
    SOPS_DATE: $versions.sops.published_at
    HELM_VER: $versions.helm.version
    HELM_DATE: $versions.helm.published_at
  }
  let env_list = $envs | columns | each { |e| '${' + $e + '}' } | str join ' '
  with-env $envs {
    open templates/README.md | ^envsubst $env_list | save -f README.md
  }
}

def "update-dockerfile" () {
  let versions = open 'versions.nuon'
  let envs = {
    CLOUD_SDK_BASE_IMAGE: $versions.cloud-sdk.image_tag
    CLOUD_SDK_BASE_IMAGE_HASH: $versions.cloud-sdk.digest
    KUSTOMIZE_VER: $versions.kustomize.version
    SOPS_VER: $versions.sops.version
    HELM_VER: $versions.helm.version
  }
  let env_list = $envs | columns | each { |e| '${' + $e + '}' } | str join ' '
  with-env $envs {
    open templates/Dockerfile | ^envsubst $env_list | save -f Dockerfile
  }
}

export def "update-dependencies" () {
  if (update-version) {
    update-readme
    update-dockerfile
  }
}
