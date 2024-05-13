#!/bin/bash

# Add RabbitMQ Helm repository
#helm repo add bitnami https://charts.bitnami.com/bitnami

# Update Helm repositories
#helm repo update

# Install RabbitMQ Chart
#helm install my-rabbitmq bitnami/rabbitmq

#sudo apt install docker.io
#

# Update the package index
sudo apt update

# Install dependencies
sudo apt install software-properties-common apt-transport-https wget -y

# Import the Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

# Add the VS Code repository
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update the package index again
sudo apt update

# Install Visual Studio Code
sudo apt install code
