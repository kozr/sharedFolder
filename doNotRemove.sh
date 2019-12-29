#!/bin/bash
echo "Type your github username"
read usernameGit
echo "Type your github email"
read emailGit
git config --local credential.helper store
git config --local user.name $usernameGit
git config --local user.email  $emailGit
git add -A
git commit -m "commit"
git push
git status > git-status.txt
while true
do
git pull
git status > git-changes.txt
cmp -s git-status.txt git-changes.txt && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push && rm git-changes.txt )
sleep 10
done
