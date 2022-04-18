#!/bin/bash
ram='1024'
COLOR_GREEN='\033[0;32m'
apt update && apt upgrade -y
clear
sleep 1
echo "This is a Minecraft Server install script."
sleep 3
clear
echo "${Green}Installing required Modules..."
apt -qq install wget curl sudo -y 
apt -qq install zip tar gzip unzip -y
echo "${Green}Modules installed!"
sleep 1
echo "${Green}Creating directories and setting up."
mkdir -p /srv/temp/mcserver/
cd /srv/temp/mcserver/
echo "${Green}Directory created!"
echo "${Green}You selected Version 1.17.1!"
sleep 1
echo "${Green}Installing Java 17"
sleep 1
echo "${Green}Using SDKMan... Installing..."
curl -s "https://get.sdkman.io" | bash
echo "${Green}Script downloaded..."
echo "${Green}Setting Home Variable..."
sleep 1
source "$HOME/.sdkman/bin/sdkman-init.sh"
echo "${Green}Home Variable set..."
sleep 1
sdk version
echo "${Green}SDKMan Installed..."
apt install openjdk-17-jre-headless -y
echo "${Green}Downloading Server Files..."
cd /srv/temp/mcserver/
curl -Lo server.jar https://cloud.blutudlut.xyz/index.php/s/3qJ6ZG5kePWBZyk/download
mv server.jar server1.17.1.jar
cd
mkdir -p MCServer
while true; do
    read -p "Do you agree the Minecraft® EULA? (Required) (Y/N) " yn
    case $yn in
        [Yy]* ) echo "Minecraft® EULA successfully agreed."; break;;
        [Nn]* ) echo "To run the server you must agree the Minecraft® EULA. Exiting..."; exit;;
        * ) echo "Please answer yes!";;
    esac
done
cd MCServer
echo "eula=true" > eula.txt
cp /srv/temp/mcserver/server1.17.1.jar server.jar
echo "${Green}How much RAM do you want for your MCServer? Default: 1024 (Do not enter M or MB!)"
read ram
echo "$ram is now your MCServer RAM."
echo "java -Xmx$ram M -jar server.jar nogui"
echo "java -Xmx${ram}M -jar server.jar nogui" > start.sh
echo "Your Minecraft Server is now installed successfully!"
echo "You can start your server by typing in: cd $HOME/MCServer/ && bash start.sh"
echo "THANKS FOR USING THIS SCRIPT! <3"
echo "Changelog:"
echo "1.01 Hotfix"
echo "Fixed start.sh Script"
echo "Updated Java Installation"
echo "Updated Install Information"
echo "For more infos visit our Github"
