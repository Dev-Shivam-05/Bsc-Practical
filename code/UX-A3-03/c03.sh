#!/usr/bin/env bash
cat > students.txt <<'EOF'
Name|Marks
Riya|78
Aman|92
Neha|65
Karan|85
EOF
echo "Names A-Z:"
{ head -n 1 students.txt; tail -n +2 students.txt | sort -t'|' -k1,1; }
echo "Marks low-high:"
{ head -n 1 students.txt; tail -n +2 students.txt | sort -t'|' -k2,2n; }
echo "Marks high-low:"
{ head -n 1 students.txt; tail -n +2 students.txt | sort -t'|' -k2,2nr; }
