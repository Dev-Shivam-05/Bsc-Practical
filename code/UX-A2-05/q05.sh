#!/usr/bin/env bash
read -r -p "Enter a non-negative integer: " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid non-negative integer."; exit 1; }
result=1
for ((i = 2; i <= n; i++)); do ((result *= i)); done
printf '%d! = %d\n' "$n" "$result"
