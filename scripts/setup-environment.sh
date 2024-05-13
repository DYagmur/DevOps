#!/bin/bash

# Function to update and upgrade packages
update_and_upgrade() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

# Function to install curl
install_curl() {
    echo "Installing curl..."
    sudo apt install -y curl
    echo "curl installation completed."
}

# Function to install Git
install_git() {
    echo "Installing Git..."
    sudo apt install -y git
    git --version
    echo "Git installation completed."
}

# Function to install Vim
install_vim() {
    echo "Installing Vim..."
    sudo apt install -y vim
    vim --version
    echo "Vim installation completed."
}

# Function to install Go
install_go() {
    echo "Installing Go..."
    wget -q https://golang.org/dl/go1.17.6.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
    echo "Go installation completed."
}

# Function to install RabbitMQ library for Go
install_rabbitmq_library() {
    echo "Installing RabbitMQ library for Go..."
    go get -u github.com/streadway/amqp
    echo "RabbitMQ library installation completed."
}

# Function to install Python and Pika
install_python_pika() {
    echo "Installing Python and Pika..."
    sudo apt install -y python3-pip python3-pika
    python3 --version
    echo "Python and Pika installation completed."
}


# Function to install kind
install_kind() {
    echo "Installing kind..."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
    echo "kind installation completed."
}

# Function to install helm
install_helm() {
    echo "Installing Helm..."
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    sudo ./get_helm.sh
    echo "Helm installation completed."
}

# Perform initial update and upgrade
update_and_upgrade

# Install required packages and tools
install_curl
install_git
install_vim
install_go
install_rabbitmq_library
install_python_pika
install_kind
install_helm

echo "Setup is not complete. Please run setup-environment2.sh."
