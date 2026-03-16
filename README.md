# 🎯 AWS Nginx Server Automation

## 📌 Project Overview

This project automates the deployment of a web server on AWS EC2 using a Bash script.

Instead of manually installing and configuring services, the script automatically provisions and configures the Nginx web server.

## 🔧 Technologies Used

- AWS EC2
- Ubuntu
- Bash
- Nginx
- Linux CLI

## 🚀 Deployment Steps

### 1️⃣ Launch an EC2 Instance

- Create an Ubuntu EC2 instance
- Allow ports **22 (SSH)** and **80 (HTTP)** in the security group

---

### 2️⃣ Connect to the Server

```bash
ssh -i key.pem ubuntu@<public-ip>
```

---

### 3️⃣ Install Git

```bash
sudo apt update
sudo apt install git -y
```

---

### 4️⃣ Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/aws-nginx-server-automation.git
```

---

### 5️⃣ Navigate into the Project Folder

```bash
cd aws-nginx-server-automation
```

---

### 6️⃣ Make the Script Executable

```bash
chmod +x deploy.sh
```

---

### 7️⃣ Run the Automation Script

```bash
./deploy.sh
```

The script will automatically install and configure the **Nginx web server** and deploy a custom HTML webpage.

## What the Script Does

1. Updates system packages
2. Installs Nginx
3. Starts the web server
4. Enables Nginx at boot
5. Deploys a custom HTML page

## Idempotency Demonstration

This deployment script was designed to be **idempotent**, meaning it can be run multiple times without causing errors or duplicating installations.

The script checks whether Nginx is already installed before attempting installation.

### Example check in the script

```bash
if dpkg -l | grep -q nginx; then
    echo "Nginx is already installed."
else
    sudo apt install nginx -y
fi
```

## ✨ Features

- Automated Nginx installation
- Automatic service startup
- Custom website deployment
- Deployment logging
- Safe re-run capability (idempotent script)

## Screenshots

(script screenshots here)

