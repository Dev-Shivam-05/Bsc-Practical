#!/usr/bin/env bash
printf 'Apple\nBanana\n' > fruits1.txt
printf 'Cherry\nDate\n' > fruits2.txt
cat fruits1.txt fruits2.txt > merged_fruits.txt
echo "Merged file:"
cat merged_fruits.txt
