echo "############################"
echo "Executing clean-up.sh script"
echo "############################"

# Disabling and removing default site configuration
sudo a2dissite 000-default.conf

# To keep the installation clean, autoremove anything that can get removed
sudo apt-get autoremove -y
# Clean-up extra files
sudo apt-get clean
# Remove files from the temporary directories
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Remove default /var/www/html folder
sudo rm -rf /var/www/html