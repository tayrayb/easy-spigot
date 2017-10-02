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
set /p ans="Enter Number:"

if %ans%==1 (
  goto a
  )
if %ans%==2 (
  goto b
  )
if %ans%==3 (
  goto c
  )
if %ans%==4 (
  goto d
  )
if %ans%==5 (
  goto e
  )

:a
cls
pause
goto z

:b
cls
pause
goto z

:c
cls
pause
goto z

:d
cls
pause
goto z

:e
cls
pause
goto z

pause
