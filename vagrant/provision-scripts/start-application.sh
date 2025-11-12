echo "#####################################"
echo "Executing start-application.sh script"
echo "#####################################"

# If the database is not imported, or the application is does not connect to an external database (remote server)
#   the `composer` and `php artisan` commands here will fail.
## Verify the connection parameters in ./vagrant/application/.env.local

## Copy the local .env configuration in the application root directory.
#sudo cp /var/www/spnet/vagrant/application/.env.local /var/www/spnet/application/.env

## Update directory and file permissions
chmod -R 775 /var/www/spnet/application/

#### Composer ####
# Ensure ~/.composer exists and is writable
if [ ! -d ~/.composer ]; then
    echo "Creating ~/.composer directory";
    mkdir ~/.composer
fi

chmod -R ugo+rw ~/.composer

sudo ln -s /var/www/spnet/application /home/vagrant/application

# Make sure to run the following manually AFTER importing the database:

#if [ -f composer.json ];  then
#    echo "Detected application file /var/www/spnet/application/composer.json";
#
#    echo "Run composer install"
#    composer install
#    echo "Run composer self-update"
#    composer self-update
#    echo "composer dump-autoload"
#    composer dump-autoload
#else
#    echo "Unable to locate application file /var/www/amiga-dev/application/composer.json file";
#fi
#
#chmod +x /var/www/spnet/application/vendor/autoload.php
