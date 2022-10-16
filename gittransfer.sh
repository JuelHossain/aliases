#! /usr/bin/bash

name=$1

gh repo create $name --public

git push --mirror https://github.com/juelhossain/$name.git

git remote set-url origin https://github.com/juelhossain/$name.git
