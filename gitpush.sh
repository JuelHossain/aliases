#! /usr/bin/bash

git add .
message=$1

if [[ $message == "" ]]; then
    echo 'message is missing'
else
    git commit -m "$message"
    git push
fi
