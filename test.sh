number=3
lines=`wc -l < contributor.txt`

if [ "$lines" -eq "$number" ]
then
  echo true
else
  echo false
fi
