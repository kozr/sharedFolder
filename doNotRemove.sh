#! /bin/bash
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
numberLines=`wc -l < contributor.txt`
    echo "num of lines: "
    echo $numberLines
    echo "num of contributors: "
    echo $contributorNumber
while [ "$numberLines" -ne "$contributorNumber" ]; do
    git pull
    numberLines=`wc -l < contributor.txt`
    sleep 10
done
rm contributor.txt
mv doNotRemove.sh .git
git status > .git/git-status.txt
while true; do
    git pull
    git status > .git/git-changes.txt
    cmp -s .git/git-status.txt .git/git-changes.txt && echo '### No updates ###' || ( echo '### Updating ###' && git add -A && git commit -m "updating" && git push && rm .git/git-changes.txt )
    sleep 10
done
fi
