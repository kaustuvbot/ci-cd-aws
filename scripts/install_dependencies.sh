#!/bin/bash
yum update -y
mkdir -p /var/www/nodejs-app
chown ec2-user:ec2-user /var/www/nodejs-app
echo "Dependencies installation completed"
