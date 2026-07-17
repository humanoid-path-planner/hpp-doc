#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path_repo_hpp-tutorial>"
    exit 1
fi

SRC_REPO="$1"
DEST="../src/reference/hpp-tutorial"

mkdir -p "$DEST"

for i in {1..9}; do
    SRC_DIR="${SRC_REPO}/tutorial_${i}"
    DST_DIR="${DEST}/tutorial_${i}"

    if [ ! -d "$SRC_DIR" ]; then
        echo "tutorial_${i} introuvable dans $SRC_REPO, ignoré"
        continue
    fi

    mkdir -p "$DST_DIR"

    # cp README
    if [ -f "$SRC_DIR/README.md" ]; then
        cp "$SRC_DIR/README.md" "$DST_DIR/README.md"
    fi

    # cp figures
    if [ -d "$SRC_DIR/figures" ]; then
        mkdir -p "$DST_DIR/figures"
        cp -r "$SRC_DIR/figures/." "$DST_DIR/figures/"
    fi
done

# Patch README.md → (bug mdBook #984) https://github.com/rust-lang/mdBook/issues/984
find "$DEST" -name "README.md" -exec sed -i -E 's|(\]\([^)]*/)README\.md(#[a-zA-Z0-9_-]*)?\)|\1\2)|g' {} +

echo "Tutorials copied from $SRC_REPO into $DEST"
