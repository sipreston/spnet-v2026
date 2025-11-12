echo "############################"
echo "Executing phpunit.sh script"
echo "############################"

# PHP Unit
sudo wget https://phar.phpunit.de/phpunit-12.2.5.phar
sudo chmod +x phpunit-12.2.5.phar
sudo mv phpunit-12.2.5.phar /usr/local/bin/phpunit