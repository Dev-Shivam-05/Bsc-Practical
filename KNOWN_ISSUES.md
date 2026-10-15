# Known issues and limits (v1.0, 2026-10-15)

## Exam environment (cannot be controlled from here)
- The exam computer is unknown. Nothing here was tested on it.
- No pen drive, so the package must be downloaded from GitHub. This needs internet at least once on the exam computer. With no internet and no USB, no software package can be brought in. Only printed pages (if allowed) will help.
- Whether GitHub, a browser or printouts are allowed in the "open-book" exam is a rule only the teacher/invigilator can confirm.

## UNIX
- All scripts use Bash features (`[[ ]]`, `(( ))`, `read -p`). Running them as `sh file.sh` on Ubuntu/Debian FAILS (tested: `[[: not found`). Always use `bash file.sh`.
- If code copied on Windows is saved and run on Linux, CRLF line endings break it (tested: `unexpected end of file`). Fix (tested): `sed -i 's/\r$//' file.sh`.
- `read -p` prompts are not shown in the "Tested output" because the input was piped. On a real terminal the prompt appears.
- `cmp` prints `char 8` in Git Bash and `byte 8` on Debian. Same meaning.
- Git Bash on Windows ignores `chmod` (UX-P1-07). Use a Linux terminal for that practical.
- UX-P2-07 (grade): the question gives no mark limits. Assumed A>=80, B>=60, C>=50, D>=35, else Fail.
- UX-P1-03: the question wording is unclear in places ("Copy in the same directory a.txt in the ty directory"). It was read as `cp a.txt a_copy.txt` inside `ty`.
- Shivam's scripts check input with regex. That is correct but more advanced than typical class code. Be ready to explain `[[ $n =~ ^[0-9]+$ ]]` (it checks that n is a number).
- Questions in the official sheets that are the same as Shivam's programs (UX-P2-03/04/05/09/12) reuse his scripts. Those scripts print a little extra, such as modulus or positive/negative. This is harmless.
- UNIX theory questions (Assignment 1 & 2, 19 questions) are listed in QUESTION_CATALOG.csv as `not-a-program`. They have no code and no answers in this package.

## WFS (PHP + MySQL)
- Runtime-tested on PHP 8.2.34 + MariaDB 11.8.9 (portable), not on XAMPP itself. db.php defaults match XAMPP defaults: root, empty password, 127.0.0.1:3306.
- The code is more advanced than the friend's mysqli version: PDO, CSRF token, shared `common.php`. The WHERE / ORDER BY SQL is built in `fetch_rows()` in `common.php` from settings in `model.php`. If the examiner asks "where is the SQL?", show that function.
- WFS-01: Employee ID is AUTO_INCREMENT, so it is not typed in. The index PDF cuts off after "Designation, and"; Salary was confirmed from the friend's copy.
- WFS-04/05: sorting is always on (ORDER BY name / ORDER BY price ASC). There is no sort button. WFS-05 search also matches model, not only brand (extra).
- The AJAX uses `fetch()`, not `XMLHttpRequest`. Both count as AJAX.
- Each program's `RUN_ME.md` says it was "not database-backed runtime tested". That was true for the original author. It is now out of date: see TEST_REPORT.md.

## ASP.NET
(see TEST_REPORT.md section "ASP.NET" for exact results)

## Companion page
- Tested only in Edge and Chrome (desktop, Windows, file://, offline). Not tested in Firefox, Safari or on Linux browsers.
- On Windows the clipboard turns line endings into CRLF. This is normal for Windows editors. On Linux, see the `sed` fix above.
- The checklist is saved in browser localStorage if allowed. If not, it is lost when the page closes (by design).
