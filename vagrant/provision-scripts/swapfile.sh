echo "############################"
echo "Executing swapfile.sh script"
echo "############################"

# Source:
# https://stackoverflow.com/questions/55069471/how-to-solve-this-error-on-live-server-for-laravel/55074773#55074773

# Creating 1GB memory swapfile
sudo fallocate -l 1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576

# Configuring file to swap
sudo chmod 600 /swapfile
sudo mkswap /swapfile

# Enable swap
sudo swapon /swapfile

#To check:
# sudo free -m