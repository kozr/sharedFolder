#!/bin/bash
git add -A
git commit -m "commit"
git push
git status > git-status.txt
while true
do
git pull
git status > git-changes.txt
cmp -s git-status.txt git-changes.txt && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push && rm git-changes.txt )
sleep 60
done
