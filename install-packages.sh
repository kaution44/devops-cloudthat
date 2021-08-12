
#!/bin/bash

#Installing jenkins

sudo apt update -y
sudo apt install openjdk-8-jdk wget -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# ansible 

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y

# install jenkins

sudo apt install jenkins -y
sudo ufw allow 8080


#Installing Docker


sudo apt install curl -y
sudo curl -SSL https://get.docker.com/ | sh


#Adding jenkins user to docker group

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins


#Installing awscli


sudo apt install python3-pip -y
sudo pip3 install awscli



#Installing Terraform


sudo apt install unzip -y
wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
unzip terraform_1.0.0_linux_amd64.zip
sudo mv terraform /usr/local/bin


#Installing ansible

sudo pip3 install ansible


#Installing kubectl

sudo apt-get install -y kubectl

#Adding jenkins user to sudoers group

echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/90-cloud-init-users

#Check whether the packages are running or not

systemctl status jenkins
aws --version 
terraform -v
ansible --version
docker --version





