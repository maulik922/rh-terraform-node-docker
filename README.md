# Project Overview 

## Architecture Diagram
![Architecture Diagram](./architecture.png)

We will follow the three-tier architecture design. Three-tier architecture organizes applications into three logical and physical computing tiers: the presentation tier (webserver), the application tier (app server), and the data tier, where the data is stored and managed.

- Our application
- Our application consists of two tiers that will be deployed to EC2 instances as Docker containers:

- presentation tier (webserver) — this is where the user interacts with the website
- application tier (app server) — this is where we have our business logics.

In other words, the presentation tier forwards requests from the user to the app server, that in turn runs queries on the rds instance to fetch the lesson recordings. Our database will be a relational database with a MySQL engine just like how YouTube stores videos. Further infrastructure details will be discussed in a bit.

### Prerequisites
- AWS CLI installed
- Terraform installed
- Docker installed
- GitHub account

- Before the infrastructure deployment, we will build images for these applications and push them to separate ECR (Amazon Elastic Container Registry) repositories. For this, make sure you have AWS CLI installed and configured locally. We also need Docker to be running.

- First we need a aws cli configure
   
- Login to ECR: replace region and AWS account ID. If you don’t know where to find your account ID, please refer to this page.
