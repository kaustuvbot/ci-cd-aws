#!/bin/bash
echo "Starting Node.js application..."
cd /var/www/nodejs-app
npm install --omit=dev
pm2 start app.js --name nodejs-app
pm2 save
echo "Application started"
