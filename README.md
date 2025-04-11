Sure! Here's the updated README in English:

---

# TerraCloud

## Description
**TerraCloud** is a project that sets up both **IaaS** (Infrastructure as a Service) and **PaaS** (Platform as a Service) on an **Azure Dev Test Lab**. The goal is to compare both services in terms of **scalability**, **performance**, and **cost**. It uses **Semaphore UI** for automating the deployment process, which integrates **Terraform** for infrastructure provisioning and **Ansible** for application deployment.

## Features
- **IaaS**: VM provisioning using **Terraform**.
- **PaaS**: Application deployment with **Ansible**.
- **Automated Deployment**: Fully managed through **Semaphore UI**.
- **Comparison Metrics**: Scalability, Performance, Cost.

## Requirements
- **Azure Subscription** with a **Dev Test Lab**.
- A **VM** with **Semaphore UI** installed.
- **Semaphore UI** (includes **Terraform** and **Ansible**).
- Two ressources groups was created by default for this project.

![**t-clo-901-rns-1**](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/7493913d-cf57-448c-8098-eb0475b4c188/Screenshot_2024-11-22_at_10.24.48.png)
**t-clo-901-rns-1**

![**t-clo-901-rns-1-items**](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/2c63bd6f-5ac1-4722-a232-ed1c6736c4d1/Screenshot_2024-11-22_at_10.25.14.png)
**t-clo-901-rns-1-items**


## Semaphore UI Setup

### 1. Prerequisites
Before starting, ensure **Docker** and **Docker Compose** are installed on your machine.

### 2. Deploy Semaphore UI with Docker Compose
To deploy **Semaphore UI**, create a `docker-compose.yml` file with the following configuration:

```yaml
services:
  postgres:
    restart: unless-stopped
    ports:
      - 5432:5432
    image: postgres:14
    hostname: postgres
    volumes:
      - semaphore-postgres:/var/lib/postgresql/data
    env_file: .env

  semaphore:
    restart: unless-stopped
    ports:
      - 3000:3000
    image: semaphoreui/semaphore:latest
    depends_on:
      - postgres
    env_file: .env

volumes:
  semaphore-postgres:
```

### 3. Create the `.env` File
Create an `.env` file with the following content:

```yaml
# PostgreSQL
POSTGRES_USER=semaphore
POSTGRES_PASSWORD=semaphore
POSTGRES_DB=semaphore

# Semaphore
SEMAPHORE_DB_USER=semaphore
SEMAPHORE_DB_PASS=semaphore
SEMAPHORE_DB_HOST=postgres
SEMAPHORE_DB_PORT=5432
SEMAPHORE_DB_DIALECT=postgres
SEMAPHORE_DB=semaphore
SEMAPHORE_PLAYBOOK_PATH=/tmp/semaphore/
SEMAPHORE_ADMIN_PASSWORD=admin
SEMAPHORE_ADMIN_NAME=admin
SEMAPHORE_ADMIN_EMAIL=admin@localhost
SEMAPHORE_ADMIN=admin
SEMAPHORE_ACCESS_KEY_ENCRYPTION="QFAQQ83I02tP1PJxK7aN2vbKqQJyuwVc3Xm0EzqIuBc="
```

### 4. Launch the Deployment
Run the following command to start the services:

```bash
sudo docker compose up -d
```

### 5. Verify Status
To verify that **Semaphore UI** is running, use:

```bash
sudo docker ps
```

You should see both **Postgres** and **Semaphore UI** containers running.

## Using Semaphore UI

### 1. Configure Infrastructure with Terraform
From **Semaphore UI**, create a key store and a project and configure the variables for using **Terraform** to provision resources on Azure (VM, networks, etc.). Run Terraform tasks directly from the **Semaphore UI** interface.
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/08fa3eb3-2eb7-40b3-998d-54513ccf43f7/image.png)
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/b01439a8-6a4b-40aa-a026-5e489bb596c1/image.png)
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/25b601f4-a85b-4a77-96b0-4cfb908b0384/image.png)

### 2. Deploy the Application with Ansible
Once the VM is provisioned, use **Ansible** to deploy the application. **Semaphore UI** allows you to configure Ansible playbooks and run them through its interface.
![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/b83cc3d0-d754-4f2b-a765-156960ed3456/image.png)
![Screenshot 2025-01-10 at 11.00.54.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/a5a52637-0fd2-4f96-9b7d-18a127d13533/Screenshot_2025-01-10_at_11.00.54.png)
![Screenshot 2025-01-10 at 11.01.19.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/34c726d1-2ac9-404e-b072-3ae3d901d767/ace2775b-af15-4e4e-870a-661aa87b0802/Screenshot_2025-01-10_at_11.01.19.png)


## Evaluation Categories

### 1. **Scalability**
   - **IaaS**: Test the ability to scale the VM and infrastructure based on load.
   - **PaaS**: Evaluate how **Semaphore UI** handles resource scaling.

### 2. **Performance**
   - **IaaS**: Measure latency and response time under different workloads.
   - **PaaS**: Test application performance via **Semaphore UI**.

### 3. **Cost**
   - Compare the cost of both IaaS and PaaS over time, including infrastructure maintenance and service management.

## Conclusion
This project enables you to explore and compare **IaaS** and **PaaS** solutions using **Azure Dev Test Lab** with **Semaphore UI**. It automates infrastructure management and application deployment while evaluating key factors like scalability, performance, and cost.
