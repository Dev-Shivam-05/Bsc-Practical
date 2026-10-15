#!/usr/bin/env bash
read -r -p "Enter two integers: " a b
if ! [[ $a =~ ^-?[0-9]+$ && $b =~ ^-?[0-9]+$ ]]; then
  echo "Please enter valid integers."; exit 1
fi
echo "Addition: $((a + b))"
echo "Subtraction: $((a - b))"
echo "Multiplication: $((a * b))"
if ((b == 0)); then
  echo "Division and modulus are undefined for zero divisor."
else
  echo "Division: $((a / b))"
  echo "Modulus: $((a % b))"
fi
