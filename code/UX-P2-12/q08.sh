#!/usr/bin/env bash
read -r -p "How many terms? " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid term count."; exit 1; }
a=0; b=1
for ((i = 0; i < n; i++)); do
  printf '%d ' "$a"
  next=$((a + b)); a=$b; b=$next
done
printf '\n'
