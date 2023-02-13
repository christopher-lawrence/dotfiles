#!/bin/bash
#

git fetch -p
git branch -vv --no-color | grep ': gone]' | awk '{print $1}' | xargs -I {} git branch -D {}
