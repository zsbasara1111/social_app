#!/bin/bash
# Manual sync script for GitHub

echo "Syncing to GitHub..."
cd "$(dirname "$0")"
git add .
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin master
echo "Done!"
