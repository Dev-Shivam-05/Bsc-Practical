#!/usr/bin/env bash
read -r -p "Enter an integer: " n
[[ $n =~ ^-?[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
if ((n % 2 == 0)); then echo "Even"; else echo "Odd"; fi
if ((n > 0)); then
  echo "Positive"
elif ((n < 0)); then
  echo "Negative"
else
  echo "Zero"
fi
