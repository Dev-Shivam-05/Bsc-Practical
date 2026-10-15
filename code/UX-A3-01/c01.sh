#!/usr/bin/env bash
for ((i=1; i<=20; i++)); do
  echo "This is line $i"
done > lines.txt
split -l 5 lines.txt part_
echo "Generated files:"
ls part_*
echo "All contents in order:"
cat part_*
