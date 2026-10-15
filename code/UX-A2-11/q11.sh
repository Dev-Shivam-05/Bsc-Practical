#!/usr/bin/env bash
read -r -p "Enter a non-negative integer: " n
[[ $n =~ ^[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
sum=0
while ((n > 0)); do
  sum=$((sum + n % 10))
  n=$((n / 10))
done
echo "Sum of digits: $sum"
