# End-to-End CI/CD Pipeline on AWS EC2 with Docker, Terraform & GitHub Actions

A comprehensive DevOps project demonstrating automated infrastructure provisioning, containerized application deployment, and CI/CD workflows using industry-standard tools and practices.

---

### Table of Contents

* [About the Project](#about-the-project)
* [Tech Stack](#tech-stack)
* [Architecture](#architecture)
* [Setup Guide](#setup-guide)
* [CI/CD Pipeline Flow](#cicd-pipeline-flow)
* [Future Improvements](#future-improvements)
* [Screenshots](#screenshots)

---

### About the Project

This project automates the deployment of a containerized Flask web application on an AWS EC2 instance. Infrastructure is provisioned using Terraform, and application deployment is fully automated via a CI/CD pipeline powered by GitHub Actions.

### Key Highlights

* Infrastructure as Code (IaC) with Terraform for reproducible AWS deployments.
* Secure and automated deployments using GitHub Actions CI/CD workflows.
* Containerized Python Flask application with Docker.
* End-to-end deployment on AWS EC2 with publicly accessible web application.
* Simplified architecture following DevOps best practices.

---

### Tech Stack

| Category            | Tools / Services Used               |
| ------------------- | ----------------------------------- |
| Cloud Provider      | AWS EC2, Security Groups            |
| Infra as Code (IaC) | Terraform                           |
| CI/CD Pipeline      | GitHub Actions, appleboy/ssh-action |
| App Framework       | Python Flask, HTML, CSS             |
| Containerization    | Docker                              |
| Deployment OS       | Ubuntu Linux                        |
| Version Control     | Git & GitHub                        |

---

### Architecture

```
Developer --> GitHub --> GitHub Actions --> AWS EC2
       |                         |
    Flask App                SSH & Docker
```

### Workflow:

1. Code pushed to the `main` branch triggers GitHub Actions.
2. GitHub Actions workflow connects securely to the EC2 instance.
3. Pulls the latest source code and rebuilds the Docker container.
4. Deploys the Flask application accessible on EC2's public IP at port 5000.

---

### Setup Guide

#### 1. Provision EC2 with Terraform

```bash
cd infra/
terraform init
terraform plan
terraform apply
```

* Note the EC2 Public IP from the Terraform output.

#### 2. Build & Run Flask App with Docker

```bash
cd app/
docker build -t myflaskapp .
docker run -d -p 5000:5000 myflaskapp
```

#### 3. Configure GitHub Secrets

In your repository settings (**Settings → Secrets → Actions**), add:

| Secret Name   | Description                        |
| ------------- | ---------------------------------- |
| EC2\_HOST     | Public IP of your EC2 instance     |
| EC2\_SSH\_KEY | Private key content for SSH access |

#### 4. GitHub Actions Workflow

* Located at `.github/workflows/deploy.yml`
* Automatically deploys on every push to the `main` branch.

---

### CI/CD Pipeline Flow

```
Git Push to main
       ↓
GitHub Actions Workflow
       ↓
SSH into EC2 instance
       ↓
git pull + Docker build + Docker run
       ↓
Access Flask App at http://<EC2-Public-IP>:5000
```

---

###  Future Improvements

* Integrate CloudWatch for centralized logging and monitoring.
* Use Docker Compose for scalable multi-container setups.
* Deploy behind an Nginx reverse proxy for better security.
* Configure HTTPS using Let's Encrypt and Route 53 domain.
* Explore ECS or EKS for container orchestration and scaling.

---

### Screenshots

<details>
<summary>Click here to view screenshots</summary>

<br>

<p align="left">
  <img src="https://github.com/user-attachments/assets/2a7ee46c-2268-4020-abda-a9023cd677cb" width="350"/>
  <img src="https://github.com/user-attachments/assets/5152b297-58cc-4a2a-8572-11420614b2b4" width="350"/>
</p>

<p align="left">
  <img src="https://github.com/user-attachments/assets/44372b48-bd86-4812-b34d-62f2d762d090" width="350"/>
  <img src="https://github.com/user-attachments/assets/4621cb66-f04a-4d9a-809f-bf7cf276c50c" width="350"/>
</p>

</details>

---

###  Author

**Benny** — Cloud & DevOps Enthusiast

GitHub: [github.com/Benny-17](https://github.com/Benny-17)  |  LinkedIn: [linkedin.com/in/benny17](https://linkedin.com/in/benny17)
