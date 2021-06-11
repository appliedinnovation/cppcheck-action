#!/bin/bash

echo "Performing checkup:"
cppcheck $2 --enable=all --language=c++ --template="::{severity} file={file},line={line},col={column}::{message}" $1
