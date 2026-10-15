#!/usr/bin/env bash
read -r -p "Enter a non-negative integer: " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
original=$n; reverse=0; temp=$n
while ((temp > 0)); do
  reverse=$((reverse * 10 + temp % 10))
  temp=$((temp / 10))
done
if ((original == reverse)); then
  echo "$original is a palindrome"
else
  echo "$original is not a palindrome"
fi
