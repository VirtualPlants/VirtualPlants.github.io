#!/bin/bash

git submodule update

cd openalea
git checkout master
git pull origin master
cd -

cd openalea-components
git checkout master
git pull origin master
cd -

git add openalea openalea-components
git commit -m "Automatic Update: update submodules to most recent commit"
