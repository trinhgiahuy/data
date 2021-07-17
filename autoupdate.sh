#!/usr/bin/env bash

DATADIR="/home/pi/data"
cd $DATADIR

if [[ -n $(git status -s) ]]; then
    echo "Changed found. Pushing changes..."
    git add -A && git commit -m "$1: Update files" && git push origin main
else
    echo "No changes found. Skip pushing."
fi
