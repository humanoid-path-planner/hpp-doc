#!/bin/bash
set -e
DEST="../src/reference/hpp-tutorial"
HPP_REPO="https://raw.githubusercontent.com/humanoid-path-planner/hpp-tutorial/devel/"

mkdir -p "$DEST"
for name in tutorial_{1..9} exercise_10; do
    mkdir -p "$DEST/${name}"

    # DL THE README
    wget -O "$DEST/${name}/README.md" \
        "${HPP_REPO}${name}/README.md"

done

# Patch  README.md →  (bug mdBook #984) https://github.com/rust-lang/mdBook/issues/984
find "$DEST" -name "README.md" -exec sed -i -E 's|(\]\([^)]*/)README\.md(#[a-zA-Z0-9_-]*)?\)|\1\2)|g' {} +

echo "Tutorials downloaded into $DEST"
