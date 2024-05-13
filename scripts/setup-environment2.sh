#!/bin/bash

# Function to update and upgrade packages
update_and_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

# Function to install Docker and enable Docker service
install_docker() {
    # Install Docker dependencies
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common 

    # Add Docker GPG key and repository
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Install Docker
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Add current user to the docker group
    sudo usermod -aG docker $USER
}

# Function to install dependencies
install_dependencies() {
    sudo apt-get install -y software-properties-common apt-transport-https wget
}

# Function to install Visual Studio Code
install_vscode() {
    # Install VS Code dependencies
    sudo apt-get install -y wget gpg

    # Add Microsoft GPG key and repository
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

    # Install Visual Studio Code
    sudo apt-get update
    sudo apt-get install -y code

    # Cleanup
    rm -f packages.microsoft.gpg
}

# Function to install RabbitMQ using Helm
install_rabbitmq() {
    echo "Adding RabbitMQ Helm repository..."
    helm repo add bitnami https://charts.bitnami.com/bitnami

    echo "Updating Helm repositories..."
    helm repo update

    echo "Installing RabbitMQ Chart..."
    # Bitnami package for RabbitMQ
    helm install my-release oci://registry-1.docker.io/bitnamicharts/rabbitmq
}

# Perform initial update and upgrade
update_and_upgrade

# Install Docker
install_docker

# Install dependencies
install_dependencies

# Install Visual Studio Code
install_vscode

# Install RabbitMQ using Helm
install_rabbitmq

# Install Krew
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

# Add Krew to PATH
echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Check Krew installation
kubectl krew

echo "Setup completed."
