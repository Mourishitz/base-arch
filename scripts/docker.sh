echo " - Adding docker group"
sudo groupadd docker > /dev/null 2>&1

echo " - Adding $USER to docker"
sudo usermod -aG docker $USER
