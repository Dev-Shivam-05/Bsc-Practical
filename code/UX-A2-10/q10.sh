#!/usr/bin/env bash
read -r -p "Enter a non-negative integer: " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
reverse=0
while ((n > 0)); do
  reverse=$((reverse * 10 + n % 10))
  n=$((n / 10))
done
echo "Reversed number: $reverse"
