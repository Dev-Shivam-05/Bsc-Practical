# Test report — v1.0 (2026-10-15)

All tests ran on the preparation laptop (Windows 11, plus WSL Debian). **None ran on the exam computer.**
Original folders were only read. All tests used copies.

## Summary

| Area | Items | Result | Evidence |
|---|---:|---|---|
| UNIX Assignment 2 + 3 (Shivam) | 25 scripts | 25/25 pass `bash -n` and run with normal and edge inputs, 43 runs in total. Debian bash 5.2.37 and Git Bash 5.2 give identical output (except cmp's wording "char"/"byte") | `evidence/unix_A2_A3_*.txt` |
| UNIX official sheets, new scripts | 11 scripts | 11/11 pass on Debian, 19 runs. grade.sh tested with 85, 60, 59, 35, 10, 101, abc | `evidence/unix_P1_P2_new_*.txt` |
| UNIX run as `sh` (dash) | q01, q04 | **FAIL as expected** (`[[: not found`). The guide says always use `bash` | this report |
| UNIX with CRLF line endings | q01 | Fails on Debian (`unexpected end of file`). `sed -i 's/\r$//'` fixes it (tested). Git Bash tolerates CRLF | this report |
| ASP.NET basics (10) + Assignment 2 (10) | 19 web sites + 1 console program | aspnet_compiler: 19/19 PASS, 0 warnings. IIS Express runtime: 65/65 checks PASS in 2 runs. vbc + ildasm verified for MSIL | `evidence/ASP_TEST_LOG.md` |
| ASP.NET database | PracticalDB.sql | sqlcmd on LocalDB (SQL Server 2025) exit 0. Seed rows: 4/3/2/2. Test rows removed | `evidence/ASP_TEST_LOG.md` |
| WFS PHP + MySQL | 5 projects | php -l clean. Insert/display/update/delete pass in all 5; search passes in 3–5, sort in 4–5. Run 1 on port 3307, Run 2 on port 3306 with db.php unchanged. 102/102 checks per run. Headless Edge confirms AJAX live search | `evidence/PHP_TEST_LOG.md`, `evidence/screens/WFS-0*.png` |
| START_HERE.html | — | 64/64 checks pass in Edge + Chrome. Network blocked: 0 requests besides file:// | below |

## START_HERE.html checks (Playwright, offline context, all non-file requests aborted)
- Opens from `file://` with all 66 questions listed. No JS errors in Edge or Chrome.
- 21 search cases pass in both browsers:
  - by number: `a2 5`, `q05`, `c07`, `asp 4`
  - by ID: `UX-P2-07`
  - by word: `factorial`, `cookie`, `grade`, `msil`, `overloading`, `chmod`, `comm`
  - synonym: `greatest` finds largest
  - partial word: `palindrom`
  - multi-word: `session logout`, `master page`, `awk average`, `ajax customer`, `mobile price`, `environment variable`, `employee crud`
  - nonsense text shows the "Kuch nahi mila" (nothing found) message
- All 199 embedded code files are byte-identical to the files in `code/`.
- Multi-file programs show every file as a tab, and switching tabs shows the exact file.
- The Copy button copies the exact code. The Windows clipboard turns line endings into CRLF.
- If the clipboard is blocked, a pre-selected textarea with the full code appears for Ctrl+C.
- Arrow-key navigation, Enter to open, and the checklist all work.
- With JavaScript disabled, the page shows a message pointing to QUESTION_INDEX.txt and ALL_CODE.txt.
- At 390 px width (phone) in dark mode there is no horizontal scroll.

## Not tested
- The exam computer itself: its OS, browser, IDE versions, SQL Server edition, and XAMPP version.
- PHP on real XAMPP. Testing used portable PHP 8.2 + MariaDB 11.8 with the same defaults.
- Firefox, Safari, and browsers on Linux.
- Download of the GitHub ZIP on the exam computer.
- UX-P1-04: `more` and `less` ran non-interactively, not in a real terminal.
