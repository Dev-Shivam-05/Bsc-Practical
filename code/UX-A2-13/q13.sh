#!/usr/bin/env bash
read -r -p "Enter a string: " first
read -r -p "Enter a second string: " second
printf 'Length: %d\n' "${#first}"
if [[ $first == "$second" ]]; then
  echo "Strings are equal"
else
  echo "Strings are different"
fi
if [[ -z $first ]]; then echo "First string is empty";
else echo "First string is not empty"; fi
reverse=''
for ((i=${#first}-1; i>=0; i--)); do
  reverse+=${first:i:1}
done
printf 'Reverse: %s\n' "$reverse"
