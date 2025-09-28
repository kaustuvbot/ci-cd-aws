#!/bin/bash
echo "Validating service..."
sleep 15  # Give more time for app to start

# Check if PM2 process is running
if pm2 describe nodejs-app > /dev/null; then
    echo "PM2 process is running"
else
    echo "PM2 process not found!"
    pm2 status
    exit 1
fi

# Test health endpoint with more verbose output
echo "Testing health endpoint..."
curl -f -v http://localhost:3000/health
if [ $? -eq 0 ]; then
    echo "Health check passed!"
else
    echo "Health check failed!"
    echo "App logs:"
    pm2 logs nodejs-app --lines 10
    exit 1
fi