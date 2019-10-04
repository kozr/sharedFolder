#!/bin/bash
git pull
git status > git-changes.txt
cmp -s git-status.txt git-changes.txt && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push && rm git-changes.txt )
