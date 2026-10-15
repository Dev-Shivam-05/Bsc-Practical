# PHP + MySQL Practicals (Assignment 05, Program_01..05) - Test Log

Date: 2026-10-15. Source folder was READ-ONLY; all tests ran on copies in `php_test\copies\`.
`diff -r source copies` = identical (verified after the run; the temporary AJAX probe file was removed).

## Environment
| Item | Value |
|---|---|
| PHP | 8.2.34 NTS x64 VS16 (downloads.php.net/~windows), sha256 03249b5c...aff4f matches official sha256sum.txt |
| php.ini | copy of php.ini-development; enabled `extension=pdo_mysql`, `extension=mbstring`; `extension_dir` = absolute path to tools\php\ext |
| DB | MariaDB 11.8.9 winx64 zip (archive.mariadb.org), sha256 830c4672...63f5 matches official sha256sums.txt |
| DB init | `mariadb-install-db.exe --datadir=...\mdata_parent\data --port=3307` -> root@localhost/127.0.0.1 with EMPTY password (same as XAMPP) |
| Browser | Edge headless (for AJAX probe + screenshots) |
| No installs | no service, no registry change; all processes killed at end (0 remaining) |

## Run 1 - MariaDB on 3307, code unmodified, port injected through the env var db.php already reads
`DB_HOST='127.0.0.1;port=3307' php -S 127.0.0.1:810N` (db.php builds `mysql:host=$host;...`, so the env value adds the port; no file edited).
Results: `results_original.txt`. P1 16/16, P2 17/17, P3 20/20, P4 25/25, P5 24/24 PASS.

## Run 2 - MariaDB on 3306 (XAMPP default), db.php UNMODIFIED, NO env vars
Databases dropped, every schema.sql re-imported, `php -S 127.0.0.1:820N`.
Results: `results_default_3306.txt`. P1 16/16, P2 17/17, P3 20/20, P4 25/25, P5 24/24 PASS.
This proves the db.php defaults (127.0.0.1, port 3306, root, empty password) work unchanged.

## What each test does (scripts\crud_test.py, cookie jar keeps PHP session)
1. GET index.php -> 200, no "Database connection failed", CSRF token (64 hex) present in the form.
2. POST insert with csrf=bad -> 403 "Invalid CSRF token."
3. POST with first field empty -> 200 + alert "<Label> is required."
4. POST valid records with real token -> 302 Location: index.php each.
5. GET index.php -> all rows shown (parsed from `<tbody id="data-body">`).
6. P4/P5: display order checked (P4 by name ASC; P5 by price ASC numerically).
7. Search: P3 `index.php?q=`; P4/P5 AJAX endpoint `search.php?q=` returns `<tr>` fragment. Empty q returns all; `' OR '1'='1` returns "No matching records." (prepared statements, no injection).
8. GET edit.php?id=X -> 200; POST update -> 302; values persisted; edit.php?id=999999 -> 404; id=abc -> 400. P2 also: `<b>` in description is HTML-escaped on display.
9. GET delete.php -> 405; POST bad csrf -> 403; POST valid -> 302; row gone.

### Sample observed responses (Run 1)
- P3 `GET /index.php?q=Electronics` -> 200, rows: Laptop/Electronics, Mouse/Electronics; `q=note` -> Notebook only; `q=zzz` -> "No matching records."
- P4 display order: Amit Desai, Meera Joshi, Zara Khan (inserted Zara, Amit, Meera). `search.php?q=Surat` -> Meera Joshi, Zara Khan; `q=Vado` -> Amit Desai (city match); `q=amit` -> Amit Desai (name match).
- P5 display order by price: 9999.00, 15999.00, 69999.00, 79999.00. `search.php?q=Samsung` -> Galaxy A15 (9999), Galaxy S24 (79999), sorted by price.

### Real browser AJAX probe (Edge headless, Run 2 data)
An iframe loaded index.php, set `#live-search` value, fired `input`, read `#data-body` after 1.5 s:
- P4: `before=2 query=Meera after=1 :: ["3 Meera Joshi ... Surat Edit Delete"]`
- P5: `before=3 query=Samsung after=1 :: ["1 Samsung Galaxy S24 79999.00 5 Edit Delete"]`
So the JS fetch() -> search.php -> tbody replacement works in a browser.
Screenshots: `screens\program_01.png` .. `program_05.png` (index page after tests).

## Lint
`php -l` on all 37 .php files: 37 x "No syntax errors detected". No PHP-8-only syntax found (arrow functions need PHP >= 7.4).

## Review vs question statements (WFS index2.pdf)
| # | Question asks | Implementation | Verdict |
|---|---|---|---|
| 1 | Employee ID, Name, Email, Department, Designation, and [cut off in PDF] | id (AUTO_INCREMENT, column header "ID"), name, email, department, designation, salary | OK. 6th field unreadable in PDF; Salary is the reasonable guess. Employee ID is auto-generated, not typed in - be ready to explain. |
| 2 | Course ID, Course Name, Duration, Fees, Course Description; CRUD | course_id (auto), course_name, duration, fees, course_description; CRUD | OK, exact match |
| 3 | create db+table, insert, display all, search with WHERE | schema.sql; insert; display; `WHERE product_name LIKE ? OR category LIKE ?` via GET form | OK (also has edit/delete - extra, harmless) |
| 4 | AJAX search from PHP backend, search by name or city WHERE, sort by name ORDER BY, update, delete | live search fetch() -> search.php; `WHERE name LIKE ? OR city LIKE ?`; `ORDER BY name ASC` always; edit/delete | OK. Sort is fixed (always by name), no sort button. |
| 5 | AJAX search, search by brand WHERE, sort by price ORDER BY, update, delete | search.php; `WHERE brand LIKE ? OR model LIKE ?`; `ORDER BY price ASC` always; edit/delete | OK. Search also matches model (superset of "by brand"). Sort fixed ascending. |

Minor, not bugs: SQL lives in shared common.php (fetch_rows) driven by model.php, so the WHERE / ORDER BY are generated, not literally written per program - examiner may ask to see the query; point at common.php `fetch_rows()`. AJAX uses `fetch()` not `XMLHttpRequest`. RUN_ME.md line "passed PHP syntax checks, not database-backed runtime tests" is now outdated.

## Fixes
None needed - nothing broken; no `php_fixed` folder created.

## XAMPP exam-day steps
1. Start Apache + MySQL in XAMPP Control Panel.
2. Copy e.g. `Program_04` to `C:\xampp\htdocs\Program_04` (or rename to `customer`).
3. phpMyAdmin http://localhost/phpmyadmin -> do NOT select a database -> Import tab -> choose that program's `schema.sql` -> Go/Import (file creates the DB itself with CREATE DATABASE + USE).
4. Open http://localhost/Program_04/index.php
5. db.php defaults: host 127.0.0.1, port 3306 (implicit), user root, password '' = XAMPP defaults; no edit needed.
   - If the lab's MySQL is on another port (e.g. 3307), edit db.php line 7:
     `$host = getenv('DB_HOST') ?: '127.0.0.1';` -> `$host = getenv('DB_HOST') ?: '127.0.0.1;port=3307';` (this exact string was tested in Run 1).
   - If root has a password, edit line 9: `$pass = getenv('DB_PASSWORD') ?: '';` -> put the password in the quotes.
