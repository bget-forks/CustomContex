<# : chooser.bat
:: launches a File... Open sort of file chooser and outputs choice(s) to the console
:: https://stackoverflow.com/a/15885133/1683264

@echo off
setlocal
pushd "C:\Users\%username%"
for /f "delims=" %%I in ('powershell -noprofile "iex (${%~f0} | out-string)"') do (
    echo %%~I
)
popd
goto :EOF

: end Batch portion / begin PowerShell hybrid chimera #>

Add-Type -AssemblyName System.Windows.Forms
$f = new-object Windows.Forms.OpenFileDialog
$f.InitialDirectory = pwd
$f.Filter = "Icon or Exe Files (*.ico *.exe)|*.ico;*.exe|Text Files (*.txt)|*.txt"
$f.ShowHelp = $true
$f.Multiselect = $False
[void]$f.ShowDialog()
if ($f.Multiselect) { $f.FileNames } else { $f.FileName }