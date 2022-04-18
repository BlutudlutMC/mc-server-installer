#!/bin/bash
SERVER_RAM='1536M'
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_WHITE='\033[0m'
EULA=''
DIRECTORY='mcserver'
echo -e "${COLOR_WHITE}############################"
echo -e "${COLOR_WHITE}#         MCServer         #"
echo -e "${COLOR_WHITE}#      Install Script      #"
echo -e "${COLOR_WHITE}#                          #"
echo -e "${COLOR_WHITE}#       by Blutudlut       #"
echo -e "${COLOR_WHITE}#            V2            #"
echo -e "${COLOR_WHITE}#                          #"
echo -e "${COLOR_WHITE}#         MC: 1.18         #"
echo -e "${COLOR_WHITE}############################"
echo "* Continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo -e "${COLOR_WHITE}OK..."; break;;
        No ) echo -e "${COLOR_WHITE}OK... "; echo "Exiting..."; exit;;
    esac
done
clear
apt update -y
clear
apt install neofetch -y
sleep 1
clear
sleep 1
clear
neofetch
sleep 0.3
echo "* Do you met these Requirements?:"
sleep 1
sleep 0.1
echo -e "${COLOR_WHITE}############################"
sleep 0.1
echo -e "${COLOR_WHITE}#         1 GB RAM         #"
sleep 0.1
echo -e "${COLOR_WHITE}#        1 CPU CORE        #"
sleep 0.1
echo -e "${COLOR_WHITE}#         5 GB Disk        #"
sleep 0.1
echo -e "${COLOR_WHITE}############################"
sleep 0.1
echo "* Do you met these Requirements?:"
sleep 1
select yn in "Yes" "No"; do
    case $yn in
        Yes ) clear && sleep 1 && echo -e "${COLOR_WHITE}Installing... " && sleep 0.2; break;;
        No ) echo -e "${COLOR_WHITE}OK... "; echo "Exiting..."; exit;;
    esac
done
clear
sleep 1
echo "* Creating directories..."
echo "* DEBUG: mkdir -p /srv/temp/mcserver/serverfiles/"
mkdir -p /srv/temp/mcserver/serverfiles/
echo "* DEBUG: cd /srv/temp/mcserver/serverfiles/"
cd /srv/temp/mcserver/serverfiles/
echo "* Directories created..."
clear
echo "* Downloading Serverfiles..."
echo "* You selected Minecraft Server Version 1.17.1"
sleep 1
echo "* Fetching server.jar from Cloud..."
echo "* DEBUG: Fetch: cloud.blutudlut.xyz"
curl --silent -Lo server.jar https://cloud.blutudlut.xyz/index.php/s/3KZkykcP8HrH2rC/download
echo "* Fetching done..."
sleep 2
clear
echo "* Fetching server.properties from Cloud..."
echo "* DEBUG: Fetch: cloud.blutudlut.xyz"
curl --silent -Lo server.properties https://cloud.blutudlut.xyz/index.php/s/xHdAwj4xJBpbJrW/download
echo "* Fetching done..."
sleep 2
clear
echo "* Fetching eula.txt from Cloud..."
echo "* DEBUG: Fetch: cloud.blutudlut.xyz"
curl --silent -Lo eula.txt https://cloud.blutudlut.xyz/index.php/s/TtmDkSyXQgRjZAp/download
echo "* Fetching done..."
sleep 2
clear
clear
sleep 2
clear
echo "* Fetching start.sh from Cloud..."
echo "* DEBUG: Fetch: cloud.blutudlut.xyz"
curl --silent -Lo start.sh https://cloud.blutudlut.xyz/index.php/s/4N5mxESqAd8o6tg/download
echo "* Fetching done..."
sleep 2
clear
echo "* Updating System..."
sleep 2
apt update -y && apt upgrade -y
clear
echo "* Installing required Modules. (1/3)"
sleep 2
clear
echo "* 1. JAVA"
echo "* 1.1 Using Java 17"
sleep 1
apt update -y
apt install openjdk-17-jre-headless -y
clear
echo "* Java installed!"
sleep 2
clear
echo "* Installing required Modules. (2/3)"
sleep 2
echo "* 2. NANO & CURL"
sleep 1
apt update -y
apt install nano curl -y
clear
echo "* Nano & cURL installed!"
sleep 2
clear
echo "* Installing required Modules. (3/3)"
sleep 2
echo "* 3. WGET, SUDO, SCREEN"
sleep 1
apt update -y
apt install wget sudo screen -y
clear
echo "* WGet, Sudo, Screen installed!"
sleep 2
clear
echo "* Where is the directory for your MCServer Install Location? (Default mcserver/)"
echo "* Please do not enter home/youruser"
read DIRECTORY
sleep 1
echo "* ${HOME}/$DIRECTORY is now is now your install Location."
sleep 3
cd $HOME
mkdir $DIRECTORY
cp /srv/temp/mcserver/serverfiles/* $DIRECTORY
clear
sleep 1
echo "* Copied!"
echo "* Deleting TEMP Files."
sleep 1
rm -r /srv/temp/mcserver/serverfiles/
rm -r /srv/temp/mcserver/
clear
echo "* Deleted!"
sleep 1
clear
echo "Your Minecraft Server is now succesfully installed! To start the server type in ${HOME}/${DIRECTORY}/start.sh"
echo -e "${COLOR_GREEN}Thanks for using my Script! <3"
echo -e "${COLOR_WHITE}resetting color..."
