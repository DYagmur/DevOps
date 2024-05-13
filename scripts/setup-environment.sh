#!/bin/bash

# Function to update and upgrade packages
update_and_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

# Update and upgrade packages initially
update_and_upgrade

# -----------------------------------
# Install curl
# ---------------------------------

# Update and upgrade packages
update_and_upgrade

# Install curl

sudo apt install curl

# -----------------------------------
# Install Git
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Install Git
sudo apt install -y git
git --version

# -----------------------------------
# Install Vim
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Install Vim
sudo apt install -y vim
vim --version

# -----------------------------------
# Install Python and Pika for RabbitMQ
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Install Python and Pika
sudo apt install -y python3-pip
sudo apt install -y python3-pika
python3 --version

# -----------------------------------
# Install kubectl
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Install kubectl dependencies
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Check kubectl version
kubectl version --client --output=yaml

# -----------------------------------
# Install minikube
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Install minikube dependencies
sudo apt install -y apt-transport-https virtualbox virtualbox-ext-pack

# Download and install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Start minikube
minikube version
sudo minikube start --driver=virtualbox

# -----------------------------------
# Install helm
# -----------------------------------

# Update and upgrade packages
update_and_upgrade

# Download and install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh

echo "Dependencies installed successfully."

