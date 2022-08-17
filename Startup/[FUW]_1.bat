set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
net stop WaaSMedicSVC
net stop UsoSVC
net stop sysmain

taskkill /f /pid 13292
taskkill /f /pid 7164
taskkill /f /pid 7280
taskkill /f /pid 4852
taskkill /f /pid 3844
taskkill /f /pid 1368

Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\*.*"
rmdir %systemroot%\SoftwareDistribution /S /Q
rmdir %systemroot%\system32\catroot2 /S /Q