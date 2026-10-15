#!/usr/bin/env bash
# Practical 1 (Unit 2): Basic UNIX commands. Run: bash basic_commands.sh
# In the exam you may also type each command by hand and write its output.
clear
echo "--- pwd ---";        pwd
echo "--- date ---";       date
echo "--- whoami ---";     whoami
echo "--- tty ---";        tty || echo "(no terminal attached)"
echo "--- uname -a ---";   uname -a
echo "--- ls ---";         ls
echo "--- ls -a ---";      ls -a
echo "--- ls -i ---";      ls -i
mkdir -p foldername
cd foldername || exit 1
touch filename.txt
# 'cat > filename.txt' normally waits for typing + Ctrl+D; here a heredoc supplies the text.
cat > filename.txt <<'TXT'
Hello UNIX
This is my first file
TXT
echo "--- cat filename.txt ---";    cat filename.txt
echo "--- cat -n filename.txt ---"; cat -n filename.txt
cp filename.txt copy.txt
echo "--- wc filename.txt ---";     wc filename.txt
echo "--- diff filename.txt copy.txt (no output = same) ---"
diff filename.txt copy.txt && echo "Files are identical"
cd ..
# rmdir works only on an EMPTY directory, so empty it first.
rm -f foldername/filename.txt foldername/copy.txt
rmdir foldername && echo "foldername removed"
