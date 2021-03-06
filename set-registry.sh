#!/bin/sh
sudo mkdir -p /etc/docker/certs.d/registry.infra.local:5000
sudo cp /vagrant/demo/registry/certs/ca.crt /etc/docker/certs.d/registry.infra.local:5000/ca.crt
ip=$(ifconfig enp0s9 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
sudo echo DOCKER_OPTS=\"-D --tls=false --experimental -H unix:///var/run/docker.sock -H tcp://$ip:2375 --registry-mirror=https://registry.infra.local:5000  --log-driver gelf --log-opt gelf-address=udp://10.100.193.10:12201\" > /etc/default/docker
sudo systemctl daemon-reload
sudo systemctl restart docker.service