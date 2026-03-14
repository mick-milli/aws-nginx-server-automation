#!/bin/bash

echo "Updating system packages..."
sudo apt update -y

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Starting Nginx service..."
sudo systemctl start nginx

echo "Enabling Nginx to start on boot..."
sudo systemctl enable nginx

echo "Creating custom website..."
sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Automated Deployment</title>
</head>
<body>
<h1>Automation Success 🚀</h1>
<p>This Nginx server was deployed using a Bash automation script.</p>
</body>
</html>
EOF'

echo "Deployment completed successfully!"

