#!/bin/bash
set -e

echo "Starting Node.js application..."

export PATH=$PATH:/home/ec2-user/.nvm/versions/node/v20.19.5/bin

cd /var/www/nodejs-app
npm install --omit=dev

if pm2 list | grep -q "nodejs-app"; then
  echo "PM2 process already running, restarting..."
  pm2 restart nodejs-app
else
  echo "PM2 process not running, starting..."
  pm2 start app.js --name nodejs-app
fi

pm2 save
echo "Application started"
