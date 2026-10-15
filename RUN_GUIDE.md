# Exam-Day Guide (Roman Hindi)

Version: v1.0 (2026-10-15)

## 0. Situation samjho (kyun ye steps)

- Kal tum **naye computer** par ho, **pen drive nahi** hai.
- Isliye package sirf **GitHub** se aa sakta hai → exam computer par **kam se kam shuru me internet chahiye**.
- Ek baar ZIP download + extract ho gaya, uske baad **sab kuch offline chalega** (internet chala jaye to bhi).
- Agar exam computer par **internet bilkul nahi** hai aur USB bhi allowed nahi → koi software files nahi la sakta. Tab sirf **printed PDF** (Shivam ke 3 PDF) ya jo reference institution allow kare, wahi kaam aayega. **Aaj hi teacher se poochh lo** ki open-book me kya allowed hai (printout? GitHub? browser?).

## 1. Aaj raat (abhi) kya karna hai

1. Phone/laptop par GitHub repo kholo aur check karo ki khul raha hai (link final message me hai).
2. Repo ka **naam yaad karo** ya likh lo: `Dev-Shivam-05/Bsc-Practical`.
3. Agar printout allowed hai → `original_pdfs/` ke 3 PDF print kar lo (backup, bina computer ke kaam aayega).
4. Teacher/CR se confirm karo: exam me internet / GitHub open kar sakte hain ya nahi. Ye rule tum control nahi kar sakte.

## 2. Exam computer par: package lana (5 minute)

1. Browser kholo → `github.com/Dev-Shivam-05/Bsc-Practical`
2. Green button **Code** → **Download ZIP**.
3. Downloads folder me ZIP par right-click → **Extract All** → Extract. (Linux: `unzip Bsc-Practical-main.zip`)
4. Extracted folder (`Bsc-Practical-main` jaisa naam) kholo → **START_HERE.html** double-click.
5. **ZIP download na ho** to: GitHub website par hi folder `code/<ID>/` kholo → file kholo → upar **Copy raw file** button (ya **Raw** → Ctrl+A, Ctrl+C).
6. **Sabse fast (bina ZIP):** browser me seedha kholo → `https://dev-shivam-05.github.io/Bsc-Practical/START_HERE.html` (internet chahiye jab tak page khula hai; code copy wahin se).
7. Agar repo **private** hai to GitHub par login karna padega (password + 2FA). Isliye public rakhna ya login details yaad rakhna zaroori hai.

## 3. Question kaise dhundhna hai

- START_HERE.html me search box me likho:
  - question ka word: `factorial`, `palindrome`, `cookie`, `gridview`, `crud employee`, `ajax mobile`
  - number: `a2 5` (UNIX assignment 2 ka Q5), `q05`, `c07`, `asp 4`, `wfs 3`
  - ID: `UX-A3-07`
- ↑ ↓ arrow se result badlo, Enter se kholo. `/` dabao to search box par aa jaoge.
- Upar filter buttons: **UNIX / ASP.NET / WFS**.
- Exam ka question thoda alag words me ho → main word try karo (jaise "greatest" = largest, "fibo" = fibonacci).
- Question me **chhota change** maanga ho (jaise table 1-20 ki jagah 1-10) → code copy karke sirf wo number/line badlo.

## 4. Code copy karna

- **Copy code** button dabao → "Copied ✓" dikhega → editor me Ctrl+V.
- Copy block ho jaye → automatically ek box khulega jisme code select hoga → **Ctrl+C**.
- Ya **Select all** button → Ctrl+C.
- Program me **kai files** hain (tabs dikhenge) → **har tab** ki file alag banao, **same naam** se. `App_Code/...` wali files `App_Code` folder ke andar hi.

## 5. Run karna

### UNIX (shell script)
```
nano q05.sh          # code paste: Ctrl+Shift+V ; save: Ctrl+O, Enter ; exit: Ctrl+X
bash q05.sh          # HAMESHA bash se. "sh q05.sh" mat likhna
```
- Error `$'\r': command not found` ya `unexpected end of file` → `sed -i 's/\r$//' q05.sh` phir dobara `bash q05.sh`.
- Windows lab me Linux nahi hai → **Git Bash** kholo (agar installed ho). Notepad me save karte waqt "Save as type: All Files" aur naam `q05.sh`.
- Git Bash me `chmod` ka asar nahi hota (UX-P1-07 Linux par hi sahi dikhega).
- Script number maangti hai par prompt nahi dikha → bas number type karke Enter dabao.

### ASP.NET (Visual Studio)
1. Database wale programs (ASP-A2-01, 04, 05, 06, 07): **pehle** `PracticalDB.sql` chalao — SSMS me open → Execute, ya cmd:
   `sqlcmd -S "(localdb)\MSSQLLocalDB" -i PracticalDB.sql`
2. Visual Studio → **File → Open → Web Site** → program ka folder choose karo.
3. Main page (jaise `Prog4.aspx`) par right-click → **Set As Start Page** → **Ctrl+F5**.
4. Lab me LocalDB nahi, SQL Express hai → `Web.config` me `Data Source=(LocalDB)\MSSQLLocalDB` ko `Data Source=.\SQLEXPRESS` karo.
5. Naya project banana pade: File → New → Web Site → **ASP.NET Empty Web Site (Visual Basic)** → files add karke code paste.
6. Login programs (ASP-A2-08, 10) ka demo login: **Prince / prince123**.
7. Visual Studio na ho / jaldi chalana ho: program folder ko package ke **run_site.bat** par drag-and-drop karo (IIS Express hona chahiye). Ya: `"C:\Program Files\IIS Express\iisexpress.exe" /path:"<folder>" /port:8081` -> `http://localhost:8081/Prog4.aspx`
8. Database program me error "Cannot open database" = PracticalDB.sql nahi chala. Pehle wo chalao.

### WFS (PHP + MySQL, XAMPP)
1. XAMPP Control Panel → **Apache Start**, **MySQL Start**.
2. Program ka **poora folder** copy karo → `C:\xampp\htdocs\WFS-04\`
3. `http://localhost/phpmyadmin` → koi database select mat karo → **Import** → `schema.sql` → Go.
4. Browser: `http://localhost/WFS-04/index.php`
5. `db.php` default = user `root`, password khali → XAMPP default, kuch badalna nahi. MySQL password ho to `db.php` line 9 me daalo.

## 6. Kuch fail ho to (fallback order)

| Problem | Kya karo |
|---|---|
| START_HERE.html blank / nahi khula | `QUESTION_INDEX.txt` ya `ALL_CODE.txt` Notepad me kholo, Ctrl+F |
| ZIP extract nahi hua | GitHub website par seedha file kholo → Copy raw file |
| Internet nahi | Printed PDF (Shivam ke 3 PDF). Software kuch nahi kar sakta |
| `bash` nahi mila | Git Bash / WSL try karo; invigilator se Linux terminal poochho |
| Visual Studio nahi | `iisexpress.exe /path:"<folder>" /port:8080` (agar IIS Express hai) |
| SQL Server nahi | Non-DB ASP programs chalao; DB wale ka code + explanation dikhao |
| XAMPP nahi | PHP code dikha kar explain karo; run nahi hoga |
| Code paste adhoora | File ka last part check karo (`End Class`, `fi`, `done`, `?>`), tab dobara copy karo |

## 7. Exam me har question ke liye 4 step

1. Search → sahi ID kholo → **Question box padho** (match ho raha hai ya nahi).
2. Saari files copy karo (tabs).
3. "Kaise run kare" steps follow karo.
4. Output ko "Tested output" se milao. Checklist me "Run ho gaya" tick karo.
