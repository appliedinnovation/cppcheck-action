#!/bin/bash

git fetch origin master 
git checkout master
git checkout $1
echo "Performing cppcheck"
COMMIT=$1
echo $COMMIT
FILES=`git --no-pager diff --name-only $COMMIT..master`
echo $FILES

if [ -n "$FILES" ]; then
    cppcheck -v --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" --error-exitcode=1 $FILES
else
    cppcheck -v --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" --error-exitcode=1 .
fi
