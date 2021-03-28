#!/usr/bin/env bash
set -e

: "${npm_package_version?Script must be ran using npm}"

for dir in ./images/*; do
    docker build \
        -f "$dir/Dockerfile" \
        --build-arg VERSION="$npm_package_version" \
        -t "ghcr.io/o1y/statamic-starter:latest" \
        -t "ghcr.io/o1y/statamic-starter:latest-php${dir##*/}" \
        -t "ghcr.io/o1y/statamic-starter:$npm_package_version-php${dir##*/}" \
        .
done

echo "
Successfully built images with the following tags:"

docker images ghcr.io/o1y/statamic-starter --format "{{.Tag}}" | sort -r