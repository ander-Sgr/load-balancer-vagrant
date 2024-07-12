#!/bin/bash

ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
echo "Host 192.168.100.*" >> /home/vagrant/.ssh/config
echo "    StrictHostKeyChecking no" >> /home/vagrant/.ssh/config
echo "    UserKnownHostsFile=/dev/null" >> /home/vagrant/.ssh/config