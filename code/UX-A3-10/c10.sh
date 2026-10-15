#!/usr/bin/env bash
cat > employees.txt <<'EOF'
ID|Name|Department|Salary
E103|Neha|Sales|45000
E101|Aman|IT|60000
E104|Karan|Sales|52000
E102|Riya|HR|48000
EOF
echo "Sorted by salary:"
{ head -n 1 employees.txt; tail -n +2 employees.txt | sort -t'|' -k4,4n; }
echo "Department Sales:"
grep '|Sales|' employees.txt
echo "Sales renamed to Marketing in displayed text:"
sed 's/|Sales|/|Marketing|/g' employees.txt
echo "Salary above 50000:"
awk -F'|' 'NR==1 || $4>50000' employees.txt
