#!/bin/bash

echo "Performing cppcheck"
COMMIT=$1
echo $COMMIT
FILES=`git --no-pager diff --name-only master...$COMMIT`
echo $FILES
cppcheck -v --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" --error-exitcode=1 $FILES
