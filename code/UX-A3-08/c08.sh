#!/usr/bin/env bash
cat > student_details.txt <<'EOF'
Roll|Name|Course|Marks
101|Aman|BCA|92
102|Riya|BScIT|78
103|Neha|BCA|65
EOF
awk -F'|' 'NR==1 {print "Name	Course"; next}
{print $2 "	" $3}' student_details.txt
