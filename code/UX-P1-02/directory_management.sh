#!/usr/bin/env bash
# Practical 2 (Unit 2): Directory management. Run: bash directory_management.sh
mkdir -p UNIX_LAB/Programs UNIX_LAB/Data
cd UNIX_LAB/Programs || exit 1
echo "Now inside:"; pwd
echo "Hello from Programs directory" > hello.txt
ls -l
cd ..
echo "Back in:"; pwd
rmdir Data && echo "Empty directory Data removed"
ls
