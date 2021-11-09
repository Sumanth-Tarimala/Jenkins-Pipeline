#!/bin/bash

git log -m --name-only -1 --oneline --pretty=format:"" > /C/Users/Sentinel/Sentinel-Policies/git_log.txt
#commit=$(git log -n 1 --pretty=format:"%h")
#StoragePath=/c/Users
#cd $StoragePath
#mkdir $commit
#OutputPath=$StoragePath/$commit
#while read -r LINE
#do
#	echo $i
#	a="$LINE
git archive --format=zip --output=/C/Users/Sentinel/Sentinel-Policies/`date +"%d%m%Y_H%"`_Sentinel_$(git log -n 1 --pretty=format:"%h").zip $(git log -n 1 --pretty=format:"%h")

