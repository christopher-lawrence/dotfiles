#!/bin/bash

git fetch -p
git branch --merged | grep -Ev "(^\*|master|main|development|release-candidate)" | xargs git branch -d
