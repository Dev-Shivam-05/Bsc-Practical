#!/usr/bin/env bash
cat > student_info.txt <<'EOF'
Aman studies Computer Science
Riya studies Information Technology
Neha studies Computer Science
Karan studies Mathematics
EOF
echo "Name Riya:"
grep 'Riya' student_info.txt
echo "Containing Computer:"
grep 'Computer' student_info.txt
echo "Count containing Computer:"
grep -c 'Computer' student_info.txt
echo "Case-insensitive riya:"
grep -i 'riya' student_info.txt
