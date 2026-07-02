#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path_repo_hpp-tutorial>"
    exit 1
fi

./updatesREADME.sh
./updatesTutorialsFigures.sh "$1"
./updateTutorialsREADME.sh