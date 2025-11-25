# Docker on Azure VM with Terraform & Ansible

Automated deployment of a containerized NGINX web application on an Azure Virtual Machine using Terraform for infrastructure provisioning and Ansible for configuration management. Demonstrates IaC, idempotence, and modern DevOps best practices.

## Features

- **Terraform**: Provisions Azure resources including Resource Group, VNet, Subnet, NSG, Public IP, NIC, and Linux VM.
- **Ansible**: Installs Docker, required Python dependencies, and deploys the NGINX container.
- **Idempotence**: Re-running the playbook makes no unnecessary changes.
- **Security**: Only SSH (22) and HTTP (80) ports open.
- **Stretch Goal**: Custom HTML page mounted into the NGINX container via Ansible.

## Architecture

1. **Control Node**: Authenticate with Azure, run Terraform to provision the VM.
2. **Azure Linux VM**: SSH in, install Ansible, and run the playbook to deploy Docker and NGINX.
3. **Docker Container**: Runs NGINX serving the web application (default or custom HTML page).

## Prerequisites

- Terraform 1.13.5
- Azure CLI with proper credentials
- SSH key pair for VM access
- Ansible installed on the VM (manual step)

## Setup

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd <repo-directory>

2. Terraform (On Control Node):
   
   a. Log into your Azure account
   ```bash 
   terraform init
   terraform validate
   terraform plan
   terraform apply

4. Ansible (Inside deployed VM):
   
   a. SSH into the Linux VM and install Ansible.
   
   b. Run the playbook:
   ```bash 
   ansible-playbook playbook.yml
   ```
   c. Verify deployment via curl http://<localhost:8080>

## Project Outcomes:
- Fully automated, reproducible Azure environment
- Containerized NGINX web application deployed and running
- Stretch goal: custom HTML page served from the container
- Idempotent playbooks for consistent configuration

References:
- Architecture Diagram: https://docs.google.com/drawings/d/14oQbJ6M5saOSqNurk33mgnU3YnSl6wU0uL4t9WpQSSg/edit
- Proposal: https://docs.google.com/document/d/1qzPlCKuDZRuMJKuOMnheaMsIeYi-jeF5eQtzdBj__mc/edit?usp=sharing
- Report: https://docs.google.com/document/d/1i_r1BH4HosA1xlPNU0PawpuDcMYG_MIjcKbhq7oLI0A/edit?usp=sharing
