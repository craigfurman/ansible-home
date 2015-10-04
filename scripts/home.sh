#!/bin/bash -e

cd ~
git init
git remote add origin https://github.com/craigfurman/home.git
git fetch
git reset --hard origin/master
git branch --set-upstream-to origin/master
