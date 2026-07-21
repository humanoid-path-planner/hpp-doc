#!/bin/bash
set -e
DEST="../src/reference/hpp-tutorial"
HPP_REPO="https://raw.githubusercontent.com/humanoid-path-planner/hpp-tutorial/devel/"

mkdir -p "$DEST"
for i in {1..9}; do
    mkdir -p "$DEST/tutorial_${i}"

    # DL THE README
    wget -O "$DEST/tutorial_${i}/README.md" \
        "${HPP_REPO}tutorial_${i}/README.md"

done

# Patch  README.md →  (bug mdBook #984) https://github.com/rust-lang/mdBook/issues/984
find "$DEST" -name "README.md" -exec sed -i -E 's|(\]\([^)]*/)README\.md(#[a-zA-Z0-9_-]*)?\)|\1\2)|g' {} +

echo "Tutorials downloaded into $DEST"
