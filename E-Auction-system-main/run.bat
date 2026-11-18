@echo off
setlocal
cd /d "%~dp0"
echo ========================================================
echo Starting E-Auction System...
echo ========================================================

:: 1. Ensure classes and config are synced
if not exist "web\WEB-INF\classes" mkdir "web\WEB-INF\classes"
if not exist "out\production\E-Auction-system-main" mkdir "out\production\E-Auction-system-main"

echo [1/3] Compiling and syncing classes...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$sources = (Get-ChildItem -Recurse -Filter '*.java' src\java).FullName; javac -encoding UTF-8 -d 'web\WEB-INF\classes' -cp 'C:\Program Files\Apache Software Foundation\Tomcat 10.1_Tomcat10_1\lib\servlet-api.jar;web\WEB-INF\lib\ojdbc8.jar' $sources; Copy-Item -Recurse -Force 'src\java\config' 'web\WEB-INF\classes\config'; Copy-Item -Recurse -Force 'web\WEB-INF\classes\*' 'out\production\E-Auction-system-main\'"

:: 2. Set environment variables for Tomcat
set "CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 10.1_Tomcat10_1"
set "CATALINA_BASE=%USERPROFILE%\.SmartTomcat\E-Auction-system-main\E-Auction-system-main"
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot"

echo [2/3] Starting Apache Tomcat on port 8081...
start "" "%CATALINA_HOME%\bin\catalina.bat" run

:: 3. Launch browser
echo [3/3] Opening browser at http://localhost:8081/ ...
timeout /t 3 /nobreak >nul
start http://localhost:8081/

echo ========================================================
echo E-Auction System is now running!
echo Access the application at: http://localhost:8081/
echo ========================================================
pause
