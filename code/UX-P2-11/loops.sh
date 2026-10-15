#!/usr/bin/env bash
# Practical 11 (Unit 3): Loops. Run: bash loops.sh
echo "Numbers 1 to 10:"
for i in 1 2 3 4 5 6 7 8 9 10; do echo -n "$i "; done
echo
read -p "Enter a number for its table: " n
i=1
while [ $i -le 10 ]; do
    echo "$n x $i = $((n * i))"
    i=$((i + 1))
done
read -p "Enter N to find sum of first N numbers: " N
sum=0
for ((k = 1; k <= N; k++)); do sum=$((sum + k)); done
echo "Sum of first $N numbers = $sum"
