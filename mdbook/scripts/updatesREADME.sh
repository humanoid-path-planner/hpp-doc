#!/bin/bash

set -e
REPOSITORIES=("hpp-core" "hpp-constraints" "hpp-manipulation" "hpp-exec" "hpp-python" "hpp-gepetto-viewer" "hpp-python" "hpp-tutorial" "hpp-plot" "hpp-pinocchio")

DEST="../src/reference"

mkdir -p "$DEST"


for repo in ${REPOSITORIES[*]}; do
    mkdir -p "$DEST/$repo"
    wget -O "$DEST/$repo/README.md" \
        "https://raw.githubusercontent.com/humanoid-path-planner/${repo}/devel/README.md"
done

echo "README files downloaded into $DEST"


