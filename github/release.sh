#!/bin/env bash
set -eo pipefail

# check for gh cli
if ! command -v gh > /dev/null; then
    echo "Please install the GitHub CLI"
    exit 1
fi

# check gh cli auth
if ! gh auth status > /dev/null 2>&1; then
    echo "Please login to the GitHub CLI"
    exit 1
fi

# Ensure working directory is clean
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Error: Working directory has uncommitted changes. Commit or stash them first."
  exit 1
fi

git fetch --tags

currTag=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "Current version: $currTag"

newTag=""
read -rp "Enter new version (e.g., v1.2.3): " newTag
if [[ ! "$newTag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: Version must match 'vX.Y.Z' format."
  exit 1
fi

# Generate changelog from commits since last tag
changelog=$(mktemp)
if [[ "$currTag" = "v0.0.0" ]]; then
  echo "Initial release $newTag" > "$changelog"
  git log --pretty=format:"- %h %s" >> "$changelog"
else
  {
    echo "## Changes since $currTag"
    git log --pretty=format:"- %h %s" "$currTag..HEAD"
  } > "$changelog"
fi

git tag -a "$newTag" -m "Release $newTag"
git push origin "$newTag"

echo "Creating release $newTag..."
gh release create "$newTag" \
    --title "$newTag" \
    --notes-file "$changelog"

rm "$changelog"

echo "Successfully published $newTag to GitHub"
