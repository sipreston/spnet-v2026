echo "######################################"
echo "Executing enable-application.sh script"
echo "######################################"

# Create symbolic links for SSL keys
## To generate new keys do the following:
  # cd /var/www/spnet/vagrant/apache/keys/
  # sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout site.key -out site.crt
  ## Leave all fields empty apart from "Common Name (e.g. server FQDN or YOUR name) []:" and set it to "spnet.in" (no quotes)
sudo ln -s /var/www/spnet/vagrant/apache/keys/site.crt /etc/ssl/certs/site.crt
sudo ln -s /var/www/spnet/vagrant/apache/keys/site.key /etc/ssl/certs/site.key

# Create a symbolic link for a new server block
sudo ln -s /var/www/spnet/vagrant/apache/sites-available/spnet.conf /etc/apache2/sites-available/spnet.conf
sudo ln -s /var/www/spnet/vagrant/apache/sites-available/mailpit.conf /etc/apache2/sites-available/mailpit.conf


# Enabling site configuration
sudo a2ensite spnet.conf
sudo a2ensite mailpit.conf

# Reloading Apache
sudo systemctl reload apache2
