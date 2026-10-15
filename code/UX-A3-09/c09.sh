#!/usr/bin/env bash
cat > marks.txt <<'EOF'
Name|English|Maths|Computer
Aman|80|90|95
Riya|75|82|88
Neha|65|70|72
EOF
awk -F'|' 'NR==1 {print "Name	Total	Average"; next}
{total=$2+$3+$4; printf "%s	%d	%.2f\n", $1,total,total/3}' marks.txt
