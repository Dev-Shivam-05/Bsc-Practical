#!/usr/bin/env bash
# Practical 6 (Unit 2): wc, sort, uniq, cut, paste, tr. Run: bash file_processing.sh
printf 'Riya,BCA\nAman,BSCIT\nNeha,BCA\nAman,BSCIT\nKaran,BCOM\n' > data.txt
printf '78\n92\n65\n92\n85\n' > marks.txt
echo "--- wc ---";            wc data.txt
echo "--- sort ---";          sort data.txt
echo "--- sort | uniq ---";   sort data.txt | uniq
echo "--- cut (names) ---";   cut -d',' -f1 data.txt
echo "--- paste ---";         paste -d',' data.txt marks.txt
echo "--- tr (uppercase) ---"; tr 'a-z' 'A-Z' < data.txt
