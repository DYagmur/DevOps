#!/bin/bash

-----------------------------------
# Install Git

sudo apt update

sudo apt install git -y

git --version

-----------------------------------

# Install Vim 



sudo apt update
sudo apt install vim


-----------------------------------

# Install Python and Pika for RabbitMQ

sudo apt-get update
sudo apt-get upgrade 
python --version 
sudo apt install python3-pip
sudo apt install python3-pika


-----------------------------------



# Install kubectl 

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client --output=yaml


-----------------------------------


# Install minikube

sudo apt-get update
sudo apt-get upgrade 
sudo apt-get install apt-transport-https
sudo apt-get install virtualbox virtualbox-ext-pack

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

minikube version 

minikube start --driver=virtualbox


-----------------------------------
# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

-----------------------------------



echo "Dependencies installed successfully."
