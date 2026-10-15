# Changelog / failure log

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
