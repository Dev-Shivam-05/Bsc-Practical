# Changelog / failure log

## v1.2 — 2026-10-15
- The 19 UNIX theory questions now have written answers (UX-T1-01..09, UX-T2-01..10). They are searchable in START_HERE.html.
- ASP-B-05: the page now shows the CLR version and memory use, the exception type the CLR raised, and a Finally block.
- ASP-B-10: added a RequiredFieldValidator for Age.
- ASP-A2-06: the Master Page menu is now an `<asp:Menu>` control (the question says "Menu").
- ASP-A2-04/07: Salary and Price are now shown back in invariant format, so Update works on any PC culture.
- All of these were re-tested: compile, targeted checks 10/10, and CRUD 22/22.

## v1.1 — 2026-10-15
- Added a per-program "Download all (.zip)" and a "Download file" button, a one-click full-package ZIP link, and a list grouped by subject with colour tags.

## v1.0 — 2026-10-15
- First package: 66 questions (41 UNIX, 20 ASP.NET, 5 WFS) plus 19 UNIX theory questions listed in the catalog.
- 11 new UNIX scripts were written for official-sheet questions that Shivam's folder did not cover: UX-P1-01..07, UX-P2-01, 02, 07, 11.
- ASP-B-04: Build_And_Inspect.txt was replaced with tested, more complete instructions. The code is unchanged.
- run_site.bat was added. It runs any ASP.NET folder with IIS Express without Visual Studio.

### Failures found while testing (and what was done)
- `sh script.sh` fails on Debian/Ubuntu because sh is dash there. Documented: use `bash`.
- A script with CRLF line endings fails on Linux bash. Documented: fix with the `sed` one-liner.
- Hello.exe was blocked by Windows Smart App Control. Documented the DLL + ildasm fallback.
- Port 8080 was busy on the test laptop. run_site.bat now moves on to the next free port.
- The first clipboard test failed only because the Windows clipboard turns line endings into CRLF. The copied content was identical, so this is not a bug.
