#!/usr/bin/env bash
cat > messages.txt <<'EOF'
The red rose is beautiful.
The blue sky is clear.
The red car is fast.
The green tree is tall.
EOF
echo "Lines 2-3:"
sed -n '2,3p' messages.txt
echo "Replace red with yellow:"
sed 's/red/yellow/g' messages.txt
echo "Delete line 2:"
sed '2d' messages.txt
echo "Lines containing tree:"
sed -n '/tree/p' messages.txt
