#!/bin/bash

echo "Performing cppcheck"
cppcheck -v --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" --error-exitcode=1 .
