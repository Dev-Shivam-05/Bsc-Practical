#!/usr/bin/env bash
# Practical 7 (Unit 2): File permissions. Run: bash file_permissions.sh
# NOTE: on Windows/Git Bash chmod has little effect; use a Linux terminal for real results.
touch perm.txt
echo "--- default ---";                     ls -l perm.txt
chmod u+x perm.txt;  echo "--- chmod u+x (symbolic) ---";  ls -l perm.txt
chmod go-r perm.txt; echo "--- chmod go-r (symbolic) ---"; ls -l perm.txt
chmod 755 perm.txt;  echo "--- chmod 755 (numeric) ---";   ls -l perm.txt
chmod 644 perm.txt;  echo "--- chmod 644 (numeric) ---";   ls -l perm.txt
echo "Read: r=4, w=2, x=1. 755 = rwx r-x r-x (owner, group, others). 644 = rw- r-- r--"
