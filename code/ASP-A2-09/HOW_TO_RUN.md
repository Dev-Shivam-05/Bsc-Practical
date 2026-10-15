# ASP.NET Assignment 2 - Windows setup

1. Use **Visual Studio 2022 with ASP.NET and web development** plus **.NET Framework 4.7.2** targeting pack and SQL Server LocalDB.
2. Run `PracticalDB.sql` against `(LocalDB)\MSSQLLocalDB`.
3. Each `Program_XX` folder is an independent **ASP.NET Web Site**, not an ASP.NET Core app. Open the desired folder with Visual Studio **File > Open > Web Site**.
4. Review `Web.config` and adapt the connection string to your actual SQL Server. The sample uses Integrated Security.
5. Run with IIS Express; test CRUD, navigation, form validation, cookie/session and logout.
6. Programs 8 and 10 use hard-coded demo credentials `Prince` / `prince123`; these are teaching demonstrations, **not secure production authentication**.
7. The deliverable's .NET compilation, SQL Server connection, and HTTP behavior are **not runtime-verified** here because a Windows .NET Framework/SQL Server toolchain is unavailable.
