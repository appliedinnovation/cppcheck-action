#!/bin/bash

echo "Performing cppcheck"
cppcheck --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" $1
