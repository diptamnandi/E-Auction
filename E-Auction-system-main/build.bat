@echo off
setlocal
cd /d "%~dp0"
echo ========================================================
echo Building E-Auction System...
echo ========================================================

if not exist "web\WEB-INF\classes" mkdir "web\WEB-INF\classes"
if not exist "out\production\E-Auction-system-main" mkdir "out\production\E-Auction-system-main"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$sources = (Get-ChildItem -Recurse -Filter '*.java' src\java).FullName; javac -encoding UTF-8 -d 'web\WEB-INF\classes' -cp 'C:\Program Files\Apache Software Foundation\Tomcat 10.1_Tomcat10_1\lib\servlet-api.jar;web\WEB-INF\lib\ojdbc8.jar' $sources; Copy-Item -Recurse -Force 'src\java\config' 'web\WEB-INF\classes\config'; Copy-Item -Recurse -Force 'web\WEB-INF\classes\*' 'out\production\E-Auction-system-main\'; Write-Host 'Build completed successfully!'"

pause
