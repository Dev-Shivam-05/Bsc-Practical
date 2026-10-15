#!/usr/bin/env bash
cat > records.txt <<'EOF'
Roll|Name|Marks
101|Riya|78
102|Aman|92
103|Neha|65
104|Karan|85
EOF
echo "Sorted by name:"
{ head -n 1 records.txt; tail -n +2 records.txt | sort -t'|' -k2,2; }
echo "Sorted by marks:"
{ head -n 1 records.txt; tail -n +2 records.txt | sort -t'|' -k3,3n; }
