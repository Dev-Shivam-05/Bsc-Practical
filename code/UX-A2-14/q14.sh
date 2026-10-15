#!/usr/bin/env bash
read -r -p "Enter path: " path
if [[ ! -e $path ]]; then echo "Path does not exist"; exit 0; fi
echo "Path exists"
if [[ -f $path ]]; then echo "Regular file";
elif [[ -d $path ]]; then echo "Directory";
else echo "Other file type"; fi
for mode in read write execute; do
  case "$mode" in
    read)    testflag=-r ;; write) testflag=-w ;;
    execute) testflag=-x ;;
  esac
  if test "$testflag" "$path"; then
    echo "$mode permission: yes"
  else
    echo "$mode permission: no"
  fi
done
