#!/usr/bin/env bash
# Practical 3 (Unit 2): File management. Run: bash file_management.sh
# Directory names follow the question: ty, ty/programm, ty/lab
mkdir -p ty/programm
cd ty || exit 1
touch a.txt b.txt c.txt
echo "This is the content of a.txt" > a.txt
cp a.txt programm/            # copy a.txt into programm dir
cp a.txt a_copy.txt           # copy in the same (ty) directory using cp
mkdir -p lab
cp a.txt lab/                 # copy a.txt into ty/lab
mv programm/a.txt programm/z.txt   # rename a.txt to z.txt inside programm
rm c.txt                      # delete one file
echo "--- ls ---";    ls
echo "--- ls -l ---"; ls -l
echo "--- ls -a ---"; ls -a
echo "--- ls -R ---"; ls -R
