#!/bin/bash

set -e
REPOSITORIES=("hpp-core" "hpp-constraints" "hpp-manipulation" "hpp-exec" "hpp-python" "hpp-gepetto-viewer" "hpp-tutorial" "hpp-plot" "hpp-pinocchio")

DEST="../src/reference"

mkdir -p "$DEST"


for repo in ${REPOSITORIES[*]}; do
    mkdir -p "$DEST/$repo"
    wget -O "$DEST/$repo/README.md" \
        "https://raw.githubusercontent.com/humanoid-path-planner/${repo}/devel/README.md"
    # Remove CI badges
    sed -i '/^\[!\[/d' "$DEST/$repo/README.md"
    # Links to files of the repository (LICENSE, ...) point to GitHub
    if [ "$repo" != "hpp-tutorial" ]; then
        sed -i -E "s#\]\(([^):/\#.][^):]*)\)#](https://github.com/humanoid-path-planner/${repo}/blob/devel/\1)#g" "$DEST/$repo/README.md"
    fi
done

echo "README files downloaded into $DEST"
