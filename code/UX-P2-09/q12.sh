#!/usr/bin/env bash
while true; do
  printf '\n1. Add  2. Subtract  3. Multiply  4. Divide\n'
  printf '5. Modulus  6. Exit\n'
  read -r -p "Choose 1-6: " choice
  case "$choice" in
    6) echo "Goodbye"; break ;;
    1|2|3|4|5) ;;
    *) echo "Invalid choice"; continue ;;
  esac
  read -r -p "Enter two integers: " a b
  if ! [[ $a =~ ^-?[0-9]+$ && $b =~ ^-?[0-9]+$ ]]; then
    echo "Invalid integer input"; continue
  fi
  if [[ $choice == 4 || $choice == 5 ]] && ((b == 0)); then
    echo "Cannot use zero as divisor"; continue
  fi
  case "$choice" in
    1) answer=$((a+b)) ;; 2) answer=$((a-b)) ;;
    3) answer=$((a*b)) ;; 4) answer=$((a/b)) ;;
    5) answer=$((a%b)) ;;
  esac
  echo "Result: $answer"
done
