#!/usr/bin/env bash
for ((n = 2; n <= 100; n++)); do
  prime=1
  for ((i = 2; i * i <= n; i++)); do
    if ((n % i == 0)); then prime=0; break; fi
  done
  if ((prime)); then printf '%d ' "$n"; fi
done
printf '\n'
