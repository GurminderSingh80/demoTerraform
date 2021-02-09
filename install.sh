#!/bin/bash
sudo yum update -y
sudo yum install -y docker git maven
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
git clone https://github.com/meacod/spring-boot-monitoring-sample.git
cd spring-boot-monitoring-sample
sudo mvn clean package
sudo docker-compose up
