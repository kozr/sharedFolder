#!/bin/bash
git pull
cmp -s git-status.txt $(git status) && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push )
