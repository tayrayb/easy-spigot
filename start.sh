#!/bin/sh
trap '' 2
while true
do
clear
echo "===================================="
echo "= Welcome to Easy-Bash for Spigot! ="
echo "===================================="
echo "Enter 1 to download and check BuildTools: "
echo "Enter 2 to download latest BuildTools: "
echo "Enter 3 to build latest spigot: "
echo "Enter 4 to start spigot server: "
echo "Enter 5 to start craftbukkit server: "
echo "Enter q to quit: "
echo -e "\n"
echo -e "Please select an option: \c"
read answer
  case "$answer" in
    1) if [ -f $(pwd)/bt/BuildTools.jar ]
    then
      clear
      echo -e "\n"
      echo -e "\c"
      echo "BuildTools is in place and ready to build!"
    else
      clear
      echo "BuildTools is missing!" ; sleep 2 ;
      curl -o $(pwd)/bt/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    fi ;;
    2) curl -o $(pwd)/bt/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar ;;
    3) cd $(pwd)/bt
    java -jar BuildTools.jar
    cd ..
    mv $(pwd)/bt/spigot*.jar $(pwd)/spigot/spigot.jar
    mv $(pwd)/bt/craftbukkit*.jar $(pwd)/craftbukkit/craftbukkit.jar ;;
    4) cd spigot ;
    if [ -f eula.txt ]
    then
      echo "EULA text file exists and server should start!" ; sleep 2
    else
      echo "Setting EULA to TRUE!" ; sleep 2
      echo "eula=true" >> ./eula.txt
    fi ;
    java -Xmx1G -jar spigot.jar ;;
    5) cd craftbukkit ;
    if [ -f eula.txt ]
    then
      echo "EULA text file exists and server should start!" ; sleep 2
    else
      echo "Setting EULA to TRUE!" ; sleep 2
      echo "eula=true" >> ./eula.txt
    fi ;
    java -Xmx1G -jar craftbukkit.jar ;;
    q) exit ;;
    *) echo -e "\n"
    echo -e "You selected an invalid option! \c" ;;
  esac
    echo -e "\n"
    echo -e "Press enter to continue: \c"
    read input
done
