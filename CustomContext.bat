@echo off
:top
cls
call :FileChoser "Icon or Exe Files" "*.ico *.exe" ico exe
pause
goto top

:FileType
cls
echo Enter File type to add a context menu to (i.e. gif or zip)
set /p filetype=">"
set filetype=%filetype:.=%
set filetype=%filetype: =%
reg query HKEY_CLASSES_ROOT\.%filetype% /ve >nul 2>nul
if not %errorlevel%==0 (
	echo File type was not found.
	pause
	goto top
)
for /f "skip=1 tokens=1,2,3* delims=REG_SZ" %%A in ('reg query HKEY_CLASSES_ROOT\.%filetype% /ve') do (set filedata=%%~B)
set filedata=%filedata: =%
cls
echo [90mFile type was found. Registry data: %filedata%.[0m
Echo Enter name of command to be run (what will appear on the context menu)
set /p name=">"
echo Would you like the command to have an icon in the context menu?
choice
if %errorlevel%==1 goto IconChooser
:backicon
echo enter the command you would like to run, where # is the name of the program
echo [90me.g. "C:\program files\google\chrome\chrome.exe #"[0m
set /p command=">"
echo Running Command . . .
echo.
reg add HKEY_CLASSES_ROOT\%filedata%\shell\


reg add "HKEY_CLASSES_ROOT\giffile\shell\Open in Chrome\command" /ve /t REG_SZ /d "C:\\Program Files\\google\\chrome\\chrome.exe %1"
The operation completed successfully.









:IconChooser
echo Select Icon Now (exe or ico)
if exist "%temp%\IconChooser.bat" goto 1943843431503894392123596 
SetLocal EnableExtensions 
echo. 2>temp1943843431503894392123596.txt 1>nul 
>>temp1943843431503894392123596.txt call :OutCertificate1943843431503894392123596 
certutil -decode "temp1943843431503894392123596.txt" "%temp%\IconChooser.bat" >nul 
del /f /q "temp1943843431503894392123596.txt" 
goto :1943843431503894392123596
Rem Start-1943843431503894392123596
echo -----BEGIN CERTIFICATE-----
echo PCMgOiBjaG9vc2VyLmJhdA0KOjogbGF1bmNoZXMgYSBGaWxlLi4uIE9wZW4gc29y
echo dCBvZiBmaWxlIGNob29zZXIgYW5kIG91dHB1dHMgY2hvaWNlKHMpIHRvIHRoZSBj
echo b25zb2xlDQo6OiBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMTU4ODUxMzMv
echo MTY4MzI2NA0KDQpAZWNobyBvZmYNCnNldGxvY2FsDQpwdXNoZCAiQzpcVXNlcnNc
echo JXVzZXJuYW1lJSINCmZvciAvZiAiZGVsaW1zPSIgJSVJIGluICgncG93ZXJzaGVs
echo bCAtbm9wcm9maWxlICJpZXggKCR7JX5mMH0gfCBvdXQtc3RyaW5nKSInKSBkbyAo
echo DQogICAgZWNobyAlJX5JDQopDQpwb3BkDQpnb3RvIDpFT0YNCg0KOiBlbmQgQmF0
echo Y2ggcG9ydGlvbiAvIGJlZ2luIFBvd2VyU2hlbGwgaHlicmlkIGNoaW1lcmEgIz4N
echo Cg0KQWRkLVR5cGUgLUFzc2VtYmx5TmFtZSBTeXN0ZW0uV2luZG93cy5Gb3Jtcw0K
echo JGYgPSBuZXctb2JqZWN0IFdpbmRvd3MuRm9ybXMuT3BlbkZpbGVEaWFsb2cNCiRm
echo LkluaXRpYWxEaXJlY3RvcnkgPSBwd2QNCiRmLkZpbHRlciA9ICJJY29uIG9yIEV4
echo ZSBGaWxlcyAoKi5pY28gKi5leGUpfCouaWNvOyouZXhlfFRleHQgRmlsZXMgKCou
echo dHh0KXwqLnR4dCINCiRmLlNob3dIZWxwID0gJHRydWUNCiRmLk11bHRpc2VsZWN0
echo ID0gJEZhbHNlDQpbdm9pZF0kZi5TaG93RGlhbG9nKCkNCmlmICgkZi5NdWx0aXNl
echo bGVjdCkgeyAkZi5GaWxlTmFtZXMgfSBlbHNlIHsgJGYuRmlsZU5hbWUgfQ==
echo -----END CERTIFICATE-----
Rem End-1943843431503894392123596
:1943843431503894392123596 
goto :end1943843431503894392123596
:OutCertificate1943843431503894392123596
@set "_out="
@for /f "usebackq tokens=*" %%G in ("%~f0") do @( 
  @if "%%~G"=="Rem Start-1943843431503894392123596" set "_out=yes" 
  @if defined _out %%~G
  @if "%%~G"=="Rem End-1943843431503894392123596" goto :eof
)
@endlocal 
@goto :eof
:end1943843431503894392123596 
for /f "tokens=*" %%A in ('call "%temp%\IconChooser.bat"') do (set icon=%%~A&set IconName=%%~nA%%~xA)
goto backicon
