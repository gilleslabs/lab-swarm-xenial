#!/bin/sh

myuid=$(id -u vagrant)
mygid=$(id -g vagrant)
mygrp=$(id -gn vagrant)
# delete existing if any
sudo sed -i "/^vagrant/d" /etc/subuid
sudo sed -i "/^$mygrp/d" /etc/subgid
# inject new values
echo "vagrant:$myuid:$myuid" | sudo tee -a /etc/subuid
echo "$(id -gn vagrant):$mygid:$mygid" | sudo tee -a /etc/subgid