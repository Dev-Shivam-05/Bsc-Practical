#!/usr/bin/env bash
# Practical 4 (Unit 2): File viewing commands. Run: bash file_viewing.sh
for i in $(seq 1 15); do echo "Line number $i"; done > view.txt
echo "--- cat ---";          cat view.txt
echo "--- head (first 5) ---"; head -n 5 view.txt
echo "--- tail (last 5) ---";  tail -n 5 view.txt
echo "--- nl ---";           nl view.txt
# more and less are interactive pagers: press SPACE for next page, q to quit.
echo "--- more ---";         more view.txt
echo "--- less (press q to quit) ---"
less view.txt
