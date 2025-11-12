echo "#############################"
echo "Executing memcached.sh script"
echo "#############################"

# Memcached
sudo apt-get -y install memcached
sudo apt-get -y install php8.4-memcached

sudo service apache2 restart