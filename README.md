# DevOps Project: RabbitMQ Communication Setup

Welcome to the DevOps project for setting up RabbitMQ communication between applications using Kubernetes and Helm charts!

## Project Overview

This project aims to automate the setup process for establishing communication between applications using RabbitMQ as a message broker. It includes applications developed in Go, Helm charts for deployment on Kubernetes, and scripts for environment setup.

## Directory Structure

- **apps**: Contains applications developed in Go for producing and consuming messages.
  - **consumer**: Application for consuming messages from RabbitMQ.
  - **producer**: Application for producing messages to RabbitMQ.
- **charts**: Contains Helm charts for deploying applications to Kubernetes.
  - **consumer-chart**: Helm chart for deploying the Consumer application.
  - **producer-chart**: Helm chart for deploying the Producer application.
- **rabbitmq**: Placeholder directory for RabbitMQ configurations (if any).
- **scripts**: Contains shell scripts for setting up the development environment and installing dependencies.
  - **setup-environment.sh**: Script for setting up the environment on an Ubuntu machine.
  - **setup-environment2.sh**: Alternate script for environment setup.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/DYagmur/DevOps.git
2. 
