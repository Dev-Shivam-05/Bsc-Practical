#!/usr/bin/env bash
read -r -p "Enter an integer: " n
[[ $n =~ ^-?[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
for ((i = 1; i <= 10; i++)); do
  printf '%d x %d = %d\n' "$n" "$i" "$((n * i))"
done
