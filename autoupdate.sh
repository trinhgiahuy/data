#!/usr/bin/env bash

DATADIR="/home/pi/data"
cd $DATADIR

if [[ -n $(git status -s) ]]; then
    if [[ -n $(git status --porcelain|grep '2021') ]]; then
	echo "Files change: Correct year. Pushing changes..."
	git add 2021* && git commit -m "$1: Update files" && git push origin main
    else
	echo "Discard file with wrong years"
	find . -not -path '*/\.*' -type f -name "2025*" -delete
	find . -not -path '*/\.*' -type f -name "2024*" -delete
	find . -not -path '*/\.*' -type f -name "2023*" -delete
	find . -not -path '*/\.*' -type f -name "2022*" -delete
    fi
else
    echo "No changes found. Skip pushing."
fi
