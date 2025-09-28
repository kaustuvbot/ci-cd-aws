#!/bin/bash
set -e

echo "Starting Node.js application..."

# Ensure pm2 is in PATH
export PATH=$PATH:/home/ec2-user/.nvm/versions/node/v20.19.5/bin

cd /var/www/nodejs-app
npm install --omit=dev

pm2 start app.js --name nodejs-app
pm2 save

echo "Application started"
