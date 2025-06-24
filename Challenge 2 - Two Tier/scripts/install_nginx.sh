#!/bin/bash
# Install NGINX on Amazon Linux 2

# Update packages
yum update -y

# Install NGINX
amazon-linux-extras install nginx1 -y

# Enable and start NGINX
systemctl enable nginx
systemctl start nginx

# Optional: Replace default index.html with a custom message
echo "<h1>Welcome to NGINX on Amazon Linux 2</h1>" > /usr/share/nginx/html/index.html
