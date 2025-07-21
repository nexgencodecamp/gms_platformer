#!/bin/bash

# === CONFIG ===
REPO_URL="https://github.com/nexgencodecamp/gms_platformer.git"
CLONE_DIR="gamemaker_repo"
OUTPUT_DIR="archives"

# === PREP ===
echo "Cloning repo (if needed)..."
if [ ! -d "$CLONE_DIR" ]; then
  git clone "$REPO_URL" "$CLONE_DIR"
else
  echo "Repo already cloned. Pulling latest..."
  cd "$CLONE_DIR"
  git pull
  cd ..
fi

mkdir -p "$OUTPUT_DIR"

cd "$CLONE_DIR"

# === FETCH TAGS ===
echo "Fetching all tags..."
git fetch --tags

TAGS=$(git tag)

# === ARCHIVE EACH TAG ===
for TAG in $TAGS; do
  echo "Archiving tag: $TAG"
  git checkout -f "$TAG"

  ZIP_NAME="../$OUTPUT_DIR/${TAG}.zip"
  git archive --format=zip --output="$ZIP_NAME" "$TAG"

  echo "Created $ZIP_NAME"
done

# Return to main branch
git checkout main >/dev/null 2>&1 || git checkout master

echo "✅ All tags archived to ./$OUTPUT_DIR/"
