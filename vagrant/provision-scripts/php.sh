echo "############################"
echo "Executing php-8-3.sh script"
echo "############################"

# Install PHP 8.4

sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y
sudo apt-get install -y php8.4

# PHP module for the Apache webserver
sudo apt-get install -y libapache2-mod-php8.4

# Add index.php to readable file types
MAKE_PHP_PRIORITY='<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>'
echo "$MAKE_PHP_PRIORITY" | sudo tee /etc/apache2/mods-enabled/dir.conf
sudo service apache2 restart

# PHP Modules
sudo apt-get -y install php8.4-common
sudo apt-get -y install php8.4-dev

# MySQL
sudo apt-get -y install php8.4-mysql

sudo apt-get install -y \
     php8.4-fpm \
     php8.4-cli \
     php8.4-pgsql \
     php8.4-sqlite3 \
     php8.4-gd \
     php8.4-memcached \
     php8.4-mcrypt \
     php8.4-imap \
     php8.4-mbstring \
     php8.4-xml \
     php8.4-zip \
     php8.4-bcmath \
     php8.4-soap \
     php8.4-intl \
     php8.4-readline \
     php8.4-cgi \
     php8.4-bz2 \
     php8.4-xmlrpc \
     php8.4-odbc \
     php8.4-pspell \
     php8.4-tidy \
     php8.4-pgsql \
     php8.4-xdebug \
     php8.4-gmp \
     php-pear \
     php-msgpack \
     php-igbinary

# Contains a mod_fcgid that starts a number of CGI program instances to handle concurrent requests
sudo apt-get -y install libapache2-mod-fcgid

# Enchant
sudo apt-get -y install libenchant-dev
sudo apt-get -y install php8.4-enchant

# LDAP
sudo apt-get -y install ldap-utils
sudo apt-get -y install php8.4-ldap

# CURL
sudo apt-get -y install curl
sudo apt-get -y install php8.4-curl

# IMAGE MAGIC
sudo apt-get -y install imagemagick
sudo apt-get -y install php8.4-imagick

# Xdebug
sudo cp /var/www/spnet/vagrant/php/mods-available/xdebug.ini /etc/php/8.4/mods-available/xdebug.ini
# Configure xdebug.ini
#sudo sed -i "s/xdebug\.remote_host\=.*/xdebug\.remote_host\=$XDEBUG_HOST/g" /etc/php/8.4/mods-available/xdebug.ini

#    default: NOTICE: Not enabling PHP FPM by default.
#    default: NOTICE: To enable PHP FPM in Apache2 do:
#    default: NOTICE: a2enmod proxy_fcgi setenvif
#    default: NOTICE: a2enconf php8.4-fpm

# Start the php8.4-fpm service:
sudo systemctl start php8.4-fpm

# User Settings
sudo cp /var/www/spnet/vagrant/php/mods-available/user.ini /var/www/spnet/application/.user.ini
# Handled by the file /var/www/spnet/vagrant/php/mods-available/user.ini
#PHP_USER_INI_PATH=/etc/php/8.4/apache2/conf.d/user.ini
#echo 'display_startup_errors = On' | sudo tee -a $PHP_USER_INI_PATH
#echo 'display_errors = On' | sudo tee -a $PHP_USER_INI_PATH
#echo 'error_reporting = E_ALL' | sudo tee -a $PHP_USER_INI_PATH
#echo 'short_open_tag = On' | sudo tee -a $PHP_USER_INI_PATH
#sudo service apache2 restart
# Disable PHP Zend OPcache
#echo 'opache.enable = 0' | sudo tee -a $PHP_USER_INI_PATH

# Absolutely Force Zend OPcache off...
sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/8.4/apache2/php.ini

# Change to have PHP 8.4 as the default version of the environment
sudo update-alternatives --set php /usr/bin/php8.4