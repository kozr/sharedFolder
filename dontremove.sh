#!/bin/bash
echo "Type your github username"
read usernameGit
echo "Type your github email"
read emailGit
echo "How many contributors"
read contributorNumber
git config --local credential.helper store
git config --local user.name $usernameGit
git config --local user.email  $emailGit
git pull
echo $usernameGit >> contributor.txt
git add -A
git commit -m "commit"
git push
numberLines= wc -l contributor.txt
while [ "$numberLines" != "$contributorNumber" ]; do
    git pull
    sleep 10
done
mv contributor.txt .git
mv dontremove.sh .git
git status > .git/git-status.txt
while true; do
    git pull
    git status > .git/git-changes.txt
    cmp -s .git/git-status.txt .git/git-changes.txt && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push && rm .git/git-changes.txt )
    sleep 10
done
fi
