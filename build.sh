#!/bin/bash
set -e

SRC="src"
DIST="dist"

mkdir -p "$DIST"

# Copy assets
cp -r assets/images "$DIST/assets/"

HEADER="$SRC/partials/header.html"
FOOTER="$SRC/partials/footer.html"

for page in "$SRC/pages"/*.html; do
  filename=$(basename "$page")
  echo "Building $filename..."
  cat "$HEADER" "$page" "$FOOTER" > "$DIST/$filename"
done

echo "Build complete → dist/"
