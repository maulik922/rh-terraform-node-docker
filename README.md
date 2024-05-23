# Project Overview 

## Architecture Diagram
![Architecture Diagram](./architecture.png)


### Prerequisites
- AWS CLI installed on your local machine
- Terraform installed on your local machine
- Docker installed on your local machine
- GitHub account

# ECR Login
Before the infrastructure deployment, we will build images for these applications and push them to separate ECR (Amazon Elastic Container Registry) repositories. 
For this, make sure you have AWS CLI installed and configured locally. We also need Docker to be running.

# AWS CLI Installation Guide

## Introduction

This guide provides step-by-step instructions for installing or updating the AWS Command Line Interface (CLI) on a Linux system.

## Prerequisites

- A Linux-based operating system
- `curl` installed on your system
- `unzip` installed on your system
- `sudo` privileges

## Installation Steps

1. **Download the AWS CLI Installer:**

   Use `curl` to download the AWS CLI v2 installer.

   ```sh
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

2. **Unzip the Installer:**

    Unzip the downloaded installer package.

    ```sh
    unzip awscliv2.zip

3. Run the Installer:

    Use sudo to install the AWS CLI. The --bin-dir and --install-dir options specify the  installation directories.

    ```sh
    sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
 
4. Verify the Installation:
    
    Check the version of the AWS CLI to ensure it has been installed or updated correctly.

    ```sh
    aws --version
