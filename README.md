# Setting up RabbitMQ Communication in a KinD Cluster

Welcome to our DevOps project focused on establishing RabbitMQ communication between applications using Kubernetes in Docker (KinD) and Helm charts!

## Project Overview

This project aims to automate the setup process for establishing communication between applications using RabbitMQ as a message broker. It includes applications developed in Go, Helm charts for deployment on Kubernetes, and scripts for environment setup.

## Tasks
Set up a local Kubernetes cluster using KinD.
Deploy RabbitMQ to the Kubernetes cluster using Helm charts.
Develop and deploy a producer application that publishes messages to RabbitMQ.
Develop and deploy a consumer application that consumes messages from RabbitMQ.
Ensure that all deployments are done securely without exposing any sensitive information.
## Technologies Used
Kubernetes
Docker
KinD (Kubernetes in Docker)
Helm
RabbitMQ
Go, Shell

## Directory Structure

- **apps**: Contains applications developed in Go for producing and consuming messages.
  - **consumer**: Application for consuming messages from RabbitMQ.
  - **producer**: Application for producing messages to RabbitMQ.
- **charts**: Contains Helm charts for deploying applications to Kubernetes.
  - **consumer-chart**: Helm chart for deploying the Consumer application.
  - **producer-chart**: Helm chart for deploying the Producer application.
- **scripts**: Contains shell scripts for setting up the development environment and installing dependencies.
  - **setup-environment.sh**: Script for setting up the environment on an Ubuntu machine.
  - **setup-environment2.sh**: Alternate script for environment setup.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/DYagmur/DevOps.git

2. Navigate the script directory and Run the setup-environment.sh and setup-environment2.sh


3. Once Kind is installed, we can proceed to create a Kubernetes cluster named rabbitmq.

    ```bash
    sudo kind create cluster — name rabbitmq

    sudo docker ps

    Note that Kind will automatically set context to the created cluster and add a prefix `kind` in front of our cluster name. Hence, our cluster name will be kind-rabbitmq.

3. Check your context with this command:


    ```bash
    kubectl config get-contexts

4. Deploying rabbit mq with helm charts.


5.  Add RabbitMQ Helm repository
    helm repo add bitnami https://charts.bitnami.com/bitnami

     ```bash
      helm repo update

6.  Install RabbitMQ Chart
    Bitnami package for RabbitMQ
     ```bash
    helm install my-release oci://registry-1.docker.io/bitnamicharts/rabbitmq

7.  Check this out repo.
    https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq  

8. Please check the pods health
    ```bash
    kubectl get pods

9. Open 2 different terminal and run the first terminal producer.go and run the second terminal consumer.go 
    you will see the output which is communicated between each other.
   
11. Please use the this command to access RabbitMQ Management UI. 
    ```bash
    kubectl port-forward --namespace default svc/my-release-rabbitmq 15672:15672
    
12. You can access the user and password below command if you don't add custom value.yaml file.

    ```bash
    echo "Username      : user"
    echo "Password      : $(kubectl get secret --namespace default my-rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d)"
    echo "ErLang Cookie : $(kubectl get secret --namespace default my-rabbitmq -o jsonpath="{.data.rabbitmq-erlang-cookie}" | base64 -d)"
    

