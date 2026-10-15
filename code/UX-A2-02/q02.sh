#!/usr/bin/env bash
read -r -p "Enter three integers: " a b c
for n in "$a" "$b" "$c"; do
  [[ $n =~ ^-?[0-9]+$ ]] || { echo "Invalid integer."; exit 1; }
done
if ((a >= b && a >= c)); then
  largest=$a
elif ((b >= a && b >= c)); then
  largest=$b
else
  largest=$c
fi
echo "Largest: $largest"
