#! /bin/sh

echo "Fetching repo $1"

baseDir=$(dirname $0)
outputDir=$baseDir/../webapp/

repoName=`echo $1 | sed 's/^.*\/\(.*\)\.git/\1/'`

if [ ! -d "$outputDir/$repoName" ]; then
  echo "Repo doesn't exist. Cloning into $outputDir"
  cd $outputDir
  git clone $1
  cd -
else
  echo "Repo exists $outputDir/$repoName. Updating."
  cd $outputDir/$repoName
  git pull --rebase
  cd -
fi
