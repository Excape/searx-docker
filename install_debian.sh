#!/bin/bash
COMPOSE_VERSION=1.10.1

#docker engine
echo "installing docker"
apt-get -y install curl apt-transport-https ca-certificates software-properties-common

curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       debian-$(lsb_release -cs) \
       main"
       
apt-get update && apt-get -y install docker-engine
systemctl enable docker.service
systemctl start docker.service

# docker compose
echo "installing docker-compose"
curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# git setup
echo "setting up git"
git config --global user.name "searx-docker-srv"
git config --global user.email admin@cblog.ch

# searx setup
echo "setting up searx"
mkdir -p /var && cd /var
git clone https://github.com/Excape/searx-docker.git
cd searx-docker
cp systemd/* /lib/systemd/system/
systemctl enable searx.service
systemctl enable dehydrated.timer
systemctl start dehydrated.timer
echo "activated timers:"
systemctl list-timers

# start searx
echo "Searx Startup.."
systemctl start searx.service
echo "searx service status:"
systemctl status searx.service
