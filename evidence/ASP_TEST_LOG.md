# ASP.NET Practicals - Test Log (2026-10-15)

All tests ran on COPIES under scratchpad\asp_test. Source folders were only read.

## Environment
- Windows 11 Home 10.0.26300; .NET Framework 4.8.x (NDP Release 534296)
- aspnet_compiler / vbc: C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ (vbc supports VB up to 2012 only)
- IIS Express 10.0.26013.1000 at C:\Program Files\IIS Express\iisexpress.exe
- SQL Server LocalDB MSSQLLocalDB = SQL Server 2025 (17.0.4025.3). No SQL Server service (no .\SQLEXPRESS) installed.
- Visual Studio folder: C:\Program Files\Microsoft Visual Studio\18\Insiders
- ildasm IS available (not on PATH): C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8.1 Tools\ildasm.exe (also NETFX 4.8 Tools, x64 variants)
- Smart App Control state: On (VerifiedAndReputablePolicyState=1) - blocks freshly compiled unsigned .exe files.
- Port 8080 is already LISTENING on this laptop (MTAgentService, PID 5804); port 8090 also in use (PID 20196).
- IIS Express /path: mode writes its config/logs to %USERPROFILE%\Documents\IISExpress (outside scratchpad; unavoidable).

## 1. Compile (aspnet_compiler)
Command per site (driver: scratchpad\compile_all.py):
    aspnet_compiler.exe -v / -p <copy>\Program_XX -f <scratchpad>\asp_test\out\<name>
Result:
```
== A3 Program_01 exit=0 PASS
== A3 Program_02 exit=0 PASS
== A3 Program_03 exit=0 PASS
== A3 Program_05 exit=0 PASS
== A3 Program_06 exit=0 PASS
== A3 Program_07 exit=0 PASS
== A3 Program_08 exit=0 PASS
== A3 Program_09 exit=0 PASS
== A3 Program_10 exit=0 PASS
== A4 Program_01 exit=0 PASS
== A4 Program_02 exit=0 PASS
== A4 Program_03 exit=0 PASS
== A4 Program_04 exit=0 PASS
== A4 Program_05 exit=0 PASS
== A4 Program_06 exit=0 PASS
== A4 Program_07 exit=0 PASS
== A4 Program_08 exit=0 PASS
== A4 Program_09 exit=0 PASS
== A4 Program_10 exit=0 PASS
```
No errors and no warnings printed for any site (19/19 PASS).

## 1b. Foundation Program_04 (MSIL)
    vbc.exe /target:exe /out:Hello.exe Hello.vb      -> exit 0, Hello.exe 6656 bytes
    .\Hello.exe  -> "Program 'Hello.exe' failed to run: Operation did not complete successfully because the file
                    contains a virus or potentially unwanted software"  (file then removed from disk; happened twice)
    vbc.exe /nologo /target:library /out:HelloLib.dll Hello.vb   -> exit 0
    ildasm.exe /text HelloLib.dll /out=HelloLib.il               -> exit 0
    Main IL:
      IL_0000:  ldstr      "Hello from managed .NET code"
      IL_0005:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_000a:  ret
    Reflection invoke of Hello.Main from HelloLib.dll -> captured: "Hello from managed .NET code"
Build_And_Inspect.txt: commands are correct (vbc /target:exe /out:Hello.exe Hello.vb; ildasm.exe Hello.exe) and the
ldstr/call/ret claim is correct. Gaps: ildasm is not on PATH outside the Developer Command Prompt; "ildasm Hello.exe"
opens the GUI (use /text for console); the line "NOT runtime-verified" is now stale; no workaround for the exe block.
Improved copy: scratchpad\asp_fixed\Assignment_03_ASP_NET_Foundation_Practicals\Program_04\Build_And_Inspect.txt

## 2. Database
    sqllocaldb info MSSQLLocalDB  -> "The automatic instance "MSSQLLocalDB" is not created." (it auto-starts on connect)
    sqlcmd -S "(localdb)\MSSQLLocalDB" -b -i PracticalDB.sql  -> exit 0
      Changed database context to 'PracticalDB'. (4 rows affected) (3 rows affected) (2 rows affected) (2 rows affected)
    Row counts: Students 4, Employee 3, Customer 2, Medicine 2
PracticalDB did not exist before; it was created by this run and is left in LocalDB (needed for the practicals).

## 3. Runtime tests (IIS Express + python urllib, real postbacks with __VIEWSTATE/__EVENTVALIDATION)
Driver: scratchpad\webtest.py. Each site: iisexpress.exe /path:<copy> /port:81xx /systray:false, tests, then process killed.
Run 1 = python default User-Agent; Run 2 = Chrome User-Agent (BROWSER_UA=1). Both: 65 pass, 0 fail.
Note: with the python UA, ASP.NET treats the client as downlevel and omits client-side validator JS; with a Chrome UA the
page includes Page_Validators and WebResource.axd (WebUIValidation.js) returns 200. Server-side validation (Page.IsValid)
was what the POST tests exercised in both runs.
```
=== A3/Program_01 on port 8101 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_01)
  PASS A3P1 GET
=== A3/Program_02 on port 8102 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_02)
  PASS A3P2 GET code-behind label :: Hello from the VB code-behind file.
=== A3/Program_03 on port 8103 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_03)
  PASS A3P3 GET inline label :: Inline server-side code executed.
=== A3/Program_05 on port 8104 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_05)
  PASS A3P5 GET
  PASS A3P5 POST 12 :: Square = 144
  PASS A3P5 POST abc :: Please enter a valid integer.
  PASS A3P5 POST 99999999999 :: Number is outside the allowed range.
=== A3/Program_06 on port 8105 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_06)
  PASS A3P6 GET :: Roll 101 : Aman
=== A3/Program_07 on port 8106 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_07)
  PASS A3P7 GET :: Student: Riya / BSc.IT
=== A3/Program_08 on port 8107 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_08)
  PASS A3P8 GET :: Two numbers: 5; three numbers: 9
  PASS A3P8 postback :: Two numbers: 5; three numbers: 9
=== A3/Program_09 on port 8108 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_09)
  PASS A3P9 GET (label empty) :: ''
  PASS A3P9 POST click :: Button clicked successfully.
=== A3/Program_10 on port 8109 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A3\Program_10)
  PASS A3P10 GET
  PASS A3P10 POST valid :: Student: Prince | Roll: 101 | Age: 19 | Course: BCA
  PASS A3P10 POST invalid (blank name, age 200) server-side validators :: lbl=''
=== A4/Program_01 on port 8110 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_01)
  PASS A4P1 GridView :: rows=[['101', 'Prince', '19', 'Male', 'BCA'], ['102', 'Karan', '20', 'Male', 'BCA'], ['103', 'Harshit', '21', 'Male', 'BBA'], ['104', 'Jeel', '18', 'Male', 'BA']]
=== A4/Program_02 on port 8111 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_02)
  PASS A4P2 GET :: client-side validation script present
  PASS A4P2 blank submit -> required msgs :: lbl=''
  PASS A4P2 mismatched -> 'Passwords do not match' :: lbl=''
  PASS A4P2 matching -> success :: lbl='Validation successful for Prince.'
=== A4/Program_03 on port 8112 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_03)
  PASS A4P3 master+content :: name=Prince roll=101 course=TY BCA
=== A4/Program_04 on port 8113 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_04)
  PASS Prog4.aspx GET 200 :: rows=3
  PASS Prog4.aspx INSERT :: msg='Record inserted.' rows 3->4 row=['Select', '6', 'ZZTestEmp', 'QA', '12345.50', '9000000001']
  PASS Prog4.aspx SELECT row fills form :: form={'txtEmployeeName': 'ZZTestEmp', 'txtDepartment': 'QA', 'txtSalary': '12345.50', 'txtContactNo': '9000000001'}
  PASS Prog4.aspx UPDATE :: msg='Record updated.' key=6 row=['Select', '6', 'ZZTestEmpUpd', 'QA', '22222.00', '9000000001']
  PASS Prog4.aspx DELETE :: msg='Record deleted.' rows now 3 (before 3)
  PASS Prog4.aspx UPDATE without selection guarded :: msg='Select a record first.'
  PASS Prog4.aspx INSERT with blank name rejected :: msg='Insert failed: check all field values.'
=== A4/Program_05 on port 8114 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_05)
  PASS Prog5.aspx GET 200 :: rows=2
  PASS Prog5.aspx INSERT :: msg='Record inserted.' rows 2->3 row=['Select', '5', 'ZZTestCust', 'zz@example.com', '9000000002', 'Surat']
  PASS Prog5.aspx SELECT row fills form :: form={'txtCustomerName': 'ZZTestCust', 'txtEmail': 'zz@example.com', 'txtPhone': '9000000002', 'txtAddress': 'Surat'}
  PASS Prog5.aspx UPDATE :: msg='Record updated.' key=5 row=['Select', '5', 'ZZTestCustUpd', 'zz@example.com', '9000000002', 'Anita']
  PASS Prog5.aspx DELETE :: msg='Record deleted.' rows now 2 (before 2)
  PASS Prog5.aspx UPDATE without selection guarded :: msg='Select a record first.'
  PASS Prog5.aspx INSERT with blank name rejected :: msg='Insert failed: check all field values.'
=== A4/Program_06 on port 8115 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_06)
  PASS A4P6 master header/menu/footer
  PASS Prog6.aspx GET 200 :: rows=4
  PASS Prog6.aspx INSERT :: msg='Record inserted.' rows 4->5 row=['Select', '990', 'ZZTestStu', '20', 'Female', 'BCA']
  PASS Prog6.aspx SELECT row fills form :: form={'txtRollNo': '990', 'txtName': 'ZZTestStu', 'txtAge': '20', 'txtGender': 'Female', 'txtCourse': 'BCA'}
  PASS Prog6.aspx UPDATE :: msg='Record updated.' key=990 row=['Select', '990', 'ZZTestStuUpd', '21', 'Female', 'BCA']
  PASS Prog6.aspx DELETE :: msg='Record deleted.' rows now 4 (before 4)
  PASS Prog6.aspx UPDATE without selection guarded :: msg='Select a record first.'
  PASS Prog6.aspx INSERT with blank name rejected :: msg='Insert failed: check all field values.'
=== A4/Program_07 on port 8116 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_07)
  PASS Prog7.aspx GET 200 :: rows=2
  PASS Prog7.aspx INSERT :: msg='Record inserted.' rows 2->3 row=['Select', '5', 'ZZTestMed', 'Tablet', '10.25', '5', '2028-01-31']
  PASS Prog7.aspx SELECT row fills form :: form={'txtMedicineName': 'ZZTestMed', 'txtCategory': 'Tablet', 'txtPrice': '10.25', 'txtQuantity': '5', 'txtExpiryDate': '2028-01-31'}
  PASS Prog7.aspx UPDATE :: msg='Record updated.' key=5 row=['Select', '5', 'ZZTestMedUpd', 'Tablet', '10.25', '7', '2028-01-31']
  PASS Prog7.aspx DELETE :: msg='Record deleted.' rows now 2 (before 2)
  PASS Prog7.aspx UPDATE without selection guarded :: msg='Select a record first.'
  PASS Prog7.aspx INSERT with blank name rejected :: msg='Insert failed: check all field values.'
=== A4/Program_08 on port 8117 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_08)
  PASS A4P8 Welcome without login -> 302 Login :: 302 /Login.aspx
  PASS A4P8 GET Login
  PASS A4P8 wrong creds msg :: Invalid username or password.
  PASS A4P8 correct creds -> 302 Welcome.aspx :: 302 /Welcome.aspx
  PASS A4P8 Welcome shows user :: Welcome, Prince!
=== A4/Program_09 on port 8118 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_09)
  PASS A4P9 Get before set :: No cookie found.
  PASS A4P9 Set cookie :: cookies={'UserName': 'Prince+Patel'}
  PASS A4P9 Get after set :: Hello, Prince Patel
=== A4/Program_10 on port 8119 (C:\Users\shiva\AppData\Local\Temp\claude\c--Users-shiva-OneDrive-Desktop-SEM-05-Practical-s\42b06c1d-83dd-422f-9bc9-63efcfaceaf8\scratchpad\asp_test\A4\Program_10)
  PASS A4P10 Welcome without login -> 302 :: 302 /LoginSession.aspx
  PASS A4P10 wrong creds :: Invalid username or password.
  PASS A4P10 login -> 302 WelcomeSession + cookie :: 302 /WelcomeSession.aspx cookies=['user', 'ASP.NET_SessionId']
  PASS A4P10 welcome shows session+cookie :: s=Prince c=Prince
  PASS A4P10 logout -> 302 login, cookie removed :: 302 /LoginSession.aspx cookies=['ASP.NET_SessionId']
  PASS A4P10 welcome after logout -> 302 :: 302 /LoginSession.aspx

SUMMARY: 65 pass, 0 fail
```
Test rows (ZZTest*) were inserted, updated and deleted by the tests; verified 0 ZZTest rows remain and counts back to
4/3/2/2. IDENTITY counters were advanced by the tests (three full runs) and were reset:
    DBCC CHECKIDENT('Employee', RESEED, 3); DBCC CHECKIDENT('Customer', RESEED, 2); DBCC CHECKIDENT('Medicine', RESEED, 2);

## 4. Missing-database behaviour (copy at asp_test\nodb\Program_01)
- Data Source=.\SQLEXPRESS (not installed here) -> HTTP 500 "A network-related or instance-specific error ... (provider: SQL
  Network Interfaces, error: 26 - Error Locating Server/Instance Specified)"
- LocalDB present but database not created -> HTTP 500 "Cannot open database "PracticalDB_NotCreated" requested by the
  login. The login failed. Login failed for user 'LAPPY\shiva'."
Pages without DB (A2 P2, P3, P8, P9, P10 and all of Assignment 1) do not depend on the connection string.

## 5. run_site.bat (scratchpad\asp_fixed\run_site.bat)
Tested via scratchpad\bat_test.py with NOBROWSER=1 (browser auto-open was NOT tested, to avoid opening windows):
- Path with spaces + apostrophe + trailing backslash, default port: "Port 8080 is busy, trying next port..." -> served
  http://localhost:8081/Prog4.aspx 200 with GridView data (Karan).
- First attempt failed with "Invalid physical path." when the path had a trailing backslash -> fixed by trimming all
  trailing backslashes; retest PASS.
- Explicit port 8090 (busy) -> fell back to 8091, http://localhost:8091/ served Default.aspx 200.
Earlier plain attempt on 8080 showed IIS Express error: Failed to register URL "http://localhost:8080/" ... (0x80070020).

## 6. Code review vs question statements (ASP.NET_INDEX.pdf)
Assignment 1 (Foundation):
- P01 simple page: matches. P02 code-behind: matches. P03 inline <script runat="server">: matches.
- P04 MSIL: console Hello.vb + instructions (see 1b). style.css in this folder is unused.
- P05 CLR + exception: Try/Catch FormatException + OverflowException works; the "CLR" part is only implied (nothing on
  the page shows CLR info such as Environment.Version). Be ready to explain verbally.
- P06 encapsulation (private _name + validating property), P07 inheritance (+Overrides), P08 overloading (Add x2/x3),
  P09 button click: match.
- P10 student form: Name/Roll/Age/Course with RequiredField + RangeValidator. Blank Age is accepted (RangeValidator does
  not fire on empty input; there is no RequiredFieldValidator for Age) -> output shows "Age: " empty. Minor.
- No Assignment 1 folder has a Web.config; runs fine under IIS Express (tested).
Assignment 2:
- P01 GridView bound from SQL: matches. P02: RFV for Username+Password (+Confirm), CompareValidator Confirm vs Password,
  messages: matches. P03: header/nav/footer/ContentPlaceHolder + content page with student info (hard-coded): matches;
  nav links all point to Prog3.aspx.
- P04 Employee CRUD, P05 Customer CRUD (ADO.NET lives in App_Code\Db.vb: SqlConnection/SqlCommand/SqlDataAdapter,
  parameterised), P07 Medicine CRUD: all fields present, all operations verified.
- P06: question says "Header, Menu, Footer" - the master uses a plain <nav> with <a> links, not an <asp:Menu> control.
  If the examiner wants the Menu control this is a gap. CRUD has all 5 fields; RollNo column header reads "ID";
  the Gender DropDownList is named txtGender (naming only).
- P08: Login.aspx -> Response.Redirect("Welcome.aspx"); Welcome guards with Session. Matches.
- P09: SetCookie.aspx stores "UserName" cookie; GetCookie.aspx reads it. Matches.
- P10: Session("user") + cookie "user", Response.Redirect, shows both, Logout clears+abandons session and expires
  cookie. Matches all bullets.
- Low risk: Salary/Price are re-displayed with row(..).ToString() (current culture) and parsed with InvariantCulture;
  on a PC whose decimal separator is a comma, Update after Select would fail. en-IN / en-US are fine.
- HOW_TO_RUN.md line 7 ("not runtime-verified ... toolchain unavailable") is stale after this run.
