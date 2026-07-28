#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHECKER_DIR="${RECIPES_CHECKER_DIR:-$ROOT_DIR/../recipes-checker}"
OUTPUT_DIR="$ROOT_DIR/build/flex"

cd "$ROOT_DIR"

if [[ ! -x "$CHECKER_DIR/run" ]]; then
    echo "recipes-checker introuvable : $CHECKER_DIR/run" >&2
    exit 1
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

git ls-tree HEAD */*/* \
    | "$CHECKER_DIR/run" generate:flex-endpoint \
        Cbruyere/chrisdev_recipes \
        main \
        flex/main \
        "$OUTPUT_DIR"



echo
echo "Endpoint Flex généré dans : $OUTPUT_DIR"
find "$OUTPUT_DIR" -maxdepth 2 -type f -print