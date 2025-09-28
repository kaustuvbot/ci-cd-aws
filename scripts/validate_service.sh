#!/bin/bash
echo "Validating service..."
sleep 10
curl -f http://localhost:3000/health || exit 1
echo "Service validation completed successfully"
.eslintrc.json