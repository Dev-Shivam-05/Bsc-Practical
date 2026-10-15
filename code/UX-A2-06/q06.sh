#!/usr/bin/env bash
read -r -p "Enter an integer: " n
[[ $n =~ ^-?[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
if ((n < 2)); then echo "$n is not prime"; exit 0; fi
for ((i = 2; i * i <= n; i++)); do
  if ((n % i == 0)); then echo "$n is not prime"; exit 0; fi
done
echo "$n is prime"
