echo "############################"
echo "Executing upgrade.sh script"
echo "############################"

# Updating Currently Installed Packages

sudo apt-get update -y
sudo apt-get install -y gnupg tzdata
sudo echo "UTC" > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get upgrade --force-yes
sudo apt-get dist-upgrade -y

sudo apt-get install -y build-essential
sudo apt-get install -y tcl

sudo apt-get install -y ca-certificates
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common
#sudo apt-get install -y supervisor
sudo apt-get install -y wget curl zip unzip git vim
sudo apt-get install -y iputils-ping

sudo apt-get install -y ufw

# Weird Vagrant issue fix
sudo apt-get install -y ifupdown