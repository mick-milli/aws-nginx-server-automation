#!/bin/bash

LOG_FILE="deployment.log"

echo "Starting deployment..." | tee -a $LOG_FILE

echo "Updating system packages..." | tee -a $LOG_FILE
sudo apt update -y | tee -a $LOG_FILE

echo "Checking if Nginx is installed..." | tee -a $LOG_FILE

if dpkg -l | grep -q nginx; then
    echo "Nginx is already installed." | tee -a $LOG_FILE
else
    echo "Installing Nginx..." | tee -a $LOG_FILE
    sudo apt install nginx -y | tee -a $LOG_FILE
fi

echo "Starting Nginx service..." | tee -a $LOG_FILE
sudo systemctl start nginx | tee -a $LOG_FILE

echo "Enabling Nginx on boot..." | tee -a $LOG_FILE
sudo systemctl enable nginx | tee -a $LOG_FILE

echo "Deploying custom HTML page..." | tee -a $LOG_FILE

sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Automation Project</title>
</head>
<body>
<h1>Automation Successful</h1>
<h3>This server was deployed using a Bash script.</h3>
</body>
</html>
EOF'

echo "Deployment complete!" | tee -a $LOG_FILE

