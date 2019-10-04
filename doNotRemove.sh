#!/bin/bash
git pull
git status > changes.txt
cmp --silent doNotRemove.txt changes.txt && echo '### No updates ###' || (echo '### Updating ###' && rm changes.txt && git add -A && git commit -m "updating" && git push)
