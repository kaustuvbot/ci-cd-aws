#!/bin/bash
echo "Stopping Node.js application..."
pm2 stop nodejs-app 2>/dev/null || echo "App not running"
pm2 delete nodejs-app 2>/dev/null || echo "No existing app to delete"
echo "Application stopped"
