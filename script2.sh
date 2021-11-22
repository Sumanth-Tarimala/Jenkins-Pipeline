#!/bin/sh
git log -m --name-only -1 --oneline --pretty=format:"" > /C/Users/Sentinel/Sentinel-Policies/git_log.txt
commitid=$(git log -n 1 --pretty=format:"%h")
StoragePath=/C/Users/Sentinel/Sentinel-Policies
cd $StoragePath
mkdir $commitid
OutputPath=$StoragePath/$commitid
while read -r LINE
do
        echo $i
        a="$LINE"
        cd /C/Users/Jenkins-Pipeline
		#moving to GIT workspace path
        pwd
       cp "$a" $OutputPath
        
        i=$[$i+1]
done < "/C/Users/Sentinel/Sentinel-Policies/git_log.txt"
