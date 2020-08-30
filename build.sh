#!/usr/bin/env bash
set -e

: "${npm_package_version?Script must be ran using npm}"

for dir in ./images/*; do
    docker build \
        -f "$dir/Dockerfile" \
        --build-arg VERSION="$npm_package_version" \
        -t "o1y/statamic:latest" \
        -t "o1y/statamic:latest-php${dir##*/}" \
        -t "o1y/statamic:$npm_package_version-php${dir##*/}" \
        .
done

echo "
Successfully built images with the following tags:"

docker images o1y/statamic --format "{{.Tag}}" | sort -r