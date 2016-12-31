#!/bin/bash

echo $1 | sudo -S

apt-get update
apt-get upgrade -y


# ##Add SSH key to server
# ssh-keygen -t rsa -b 4096
# #save to /home/username/.ssh/bitbucket
# cat /home/username/.ssh/bitbucket.pub
# copy the public key and add it to bitbucket for ssh authentication.
# sudo nano /etc/ssh/ssh_config
# add the line IdentityFile /home/username/.ssh/bitbucket
# sudo service ssh restart or sudo systemctl ssh restart


apt-get install apt-transport-https ca-certificates
sudo apt-key adv \
--keyserver hkp://ha.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D

apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
apt-get update

apt-get install docker-engine
service docker start

curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


#docker run hello-world to test that docker works on the system