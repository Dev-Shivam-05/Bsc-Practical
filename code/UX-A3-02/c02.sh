#!/usr/bin/env bash
cat > file1.txt <<'EOF'
Apple
Banana
Cherry
EOF
cat > file2.txt <<'EOF'
Apple
Blueberry
Cherry
Date
EOF
echo "First difference (cmp):"
cmp file1.txt file2.txt || true
echo "Changed lines (diff):"
diff file1.txt file2.txt || true
