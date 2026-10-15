#!/usr/bin/env bash
factorial() {
  local n=$1 result=1 i
  if ! [[ $n =~ ^[0-9]+$ ]]; then
    echo "Factorial requires a non-negative integer"; return 1
  fi
  for ((i=2; i<=n; i++)); do ((result *= i)); done
  printf 'Factorial of %d = %d\n' "$n" "$result"
}
read -r -p "Enter a non-negative integer: " value
factorial "$value"
