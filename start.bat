@echo off
:z
echo ====================================
echo = Welcome to Easy-Bash for Spigot! =
echo ====================================
echo Enter 1 to download and check BuildTools:
echo Enter 2 to download latest BuildTools:
echo Enter 3 to build latest spigot:
echo Enter 4 to start spigot server:
echo Enter 5 to start craftbukkit server:
echo Enter q to quit:
set /p ans=Enter Number:

if %ans%==1 goto 1
if %ans%==2 goto 2
if %ans%==3 goto 3
if %ans%==4 goto 4
if %ans%==5 goto 5
if %ans%==q goto q

:: If you have got here, you have selected an invalid option
echo Invalid selection!
timeout /t 5
cls
goto z

:1
cls
if exist %cd%\bt\BuildTools.jar (
  echo BuildTools is in place and ready to build!
  timeout /t 3 /nobreak
  cls
  ) else (
    echo BuildTools is missing and will download!
    timeout /t 3 /nobreak
    cls
    %cd%/bin/curl.exe -o %cd%\bt\BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  )
cls
goto z

:2
cls
%cd%/bin/curl.exe -o %cd%\bt\BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
pause
goto z

:3
cls
if exist %cd%\bt\BuildTools.jar (
  echo BuildTools is in place
  timeout /t 3
  ) else (
    echo BuildTools is missing and will download!
    timeout /t 3 /nobreak
    cls
    %cd%/bin/curl.exe -o %cd%\bt\BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    )
cls
cd %cd%\bt
java -jar BuildTools.jar
cd ..
move %cd%\bt\spigot*.jar %cd%\spigot\spigot.jar
move %cd%\bt\craftbukkit*.jar %cd%\bt\craftbukkit.jar
cls
pause
goto z

:4
cls
cd %cd%\spigot
if exist eula.txt (
  echo EULA text file exists and server should start!
  timeout /t 3 /nobreak
  ) else (
    echo setting EULA to TRUE!
    timeout /t 3 /nobreak
    echo eula=true>eula.txt
    )
cls
java -Xmx1G -jar spigot.jar
pause
cls
goto z

:5
cls
cd %cd%\craftbukkit
if exist eula.txt (
  echo EULA text file exists and server should start!
  timeout /t 3 /nobreak
  ) else (
    echo setting EULA to TRUE!
    timeout /t 3 /nobreak
    echo eula=true>eula.txt
    )
cls
java -Xmx1G -jar craftbukkit.jar
pause
cls
goto z

:q
cls
exit /b
