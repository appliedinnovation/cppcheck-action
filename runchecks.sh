#!/bin/bash

# Checkout master and the PR commit
git fetch origin master 
git checkout master
git fetch origin $1
git checkout $1

echo "Performing cppcheck"
COMMIT=$1
echo $COMMIT

# Get list of changed .cpp files
git --no-pager diff --name-only $COMMIT..master > changes.txt
FILES=`cat changes.txt | grep *.cpp`
echo $FILES

if [ -n "$FILES" ]; then
    cppcheck -v --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" --error-exitcode=1 $FILES
fi
