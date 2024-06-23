#!/usr/bin/bash
set -eo pipefail
if [[ -z ${project_root} ]]; then
    project_root=$(git rev-parse --show-toplevel)
fi 
if [[ -z ${git_branch} ]]; then
    git_branch=$(git branch --show-current)
fi

# Get Inputs
image=$1
target=$2
version=$3

# Set image/target/version based on inputs
# shellcheck disable=SC2154,SC1091
. "${project_root}/scripts/get-defaults.sh"

# Get info
container_mgr=$(just _container_mgr)
base_image=$(just _base_image "${image}")
tag=$(just _tag "${image}" "${target}")

# Build Command
command=( build -f Containerfile )
if [[ ${container_mgr} == "docker" && ${TERM} == "dumb" ]]; then
    command+=(--progress=plain)
fi
command+=( --build-arg="AKMODS_FLAVOR=main" )
command+=( --build-arg="BASE_IMAGE_NAME=${base_image}" )
command+=( --build-arg="SOURCE_IMAGE=${base_image}-main" )
command+=( --build-arg="FEDORA_MAJOR_VERSION=${version}" )
command+=( --build-arg="IMAGE_NAME=${tag}" )
command+=( --build-arg="IMAGE_FLAVOR=main" )
command+=( --build-arg="IMAGE_VENDOR=localhost" )
command+=( --tag localhost/"${tag}:${version}-${git_branch}" )
command+=( --target "${target}" )
command+=( "${project_root}" )

# Build Image
$container_mgr ${command[@]}
