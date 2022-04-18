### before ###
#!/bin/bash

##### install docker #####
sudo yum install -y docker ### only the users mentioned in /etc/sudoers file will be allowed to make changes to the docker.
sudo systemctl enable docker
sudo systemctl restart docker

### install docker-compose ####
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

#### docker-compose up ####
cd /home/ec2-user/dockernodejs
#sudo docker-compose down
#sudo docker rmi -f docker-nodejs
#sudo docker-compose up -d
#sudo docker pull kalyankalapala/cloudavengers:latest
#sudo docker run -it -d -p 80:8080 kalyankalapala/cloudavengers:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 850769113977.dkr.ecr.us-east-1.amazonaws.com
docker-compose down
docker-compose build --no-cache
docker-compose up -d
#docker pull 850769113977.dkr.ecr.us-east-1.amazonaws.com/cloudavengersecr:latest
#docker run -it -d -p 8080:8080 --name cloudavengers 850769113977.dkr.ecr.us-east-1.amazonaws.com/cloudavengersecr:latest
### ghost ###
#sudo docker run -d -p 3001:2368 ghost
#systemctl restart nginx
