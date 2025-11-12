echo "##########################"
echo "Executing redis.sh script"
echo "##########################"

# Redis
sudo apt-get update -y
sudo apt-get -y install redis-server
sudo apt-get -y install php8.4-redis
