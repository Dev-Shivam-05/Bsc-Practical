#!/usr/bin/env bash
# Practical 1 (Unit 3): Environment variables. Run: bash env_variables.sh
echo "--- some environment variables ---"
echo "HOME=$HOME"; echo "USER=${USER:-$(whoami)}"; echo "SHELL=$SHELL"; echo "PATH=$PATH"
echo "--- full list (first 10 lines of env) ---"
env | head -n 10
myname="Shivam"                # create user-defined variable
echo "myname = $myname"        # display it
unset myname                   # remove it
echo "after unset: myname = '${myname}'"
