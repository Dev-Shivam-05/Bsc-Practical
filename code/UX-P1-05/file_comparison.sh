#!/usr/bin/env bash
# Practical 5 (Unit 2): cmp, diff, comm. Run: bash file_comparison.sh
# comm needs SORTED input files, so both lists are alphabetical.
printf 'apple\nbanana\ncherry\nmango\n' > f1.txt
printf 'apple\nbanana\ngrapes\nmango\n' > f2.txt
echo "--- cmp (first differing byte) ---"
cmp f1.txt f2.txt
echo "--- diff (line changes) ---"
diff f1.txt f2.txt
echo "--- comm (col1: only f1, col2: only f2, col3: common) ---"
comm f1.txt f2.txt
echo "Observation: cmp shows first difference, diff shows how to change f1 into f2, comm shows unique and common lines."
