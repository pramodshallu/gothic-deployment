#!/bin/bash
echo "🔄 Syncing latest code from GitHub..."
git pull origin main

echo "🛑 Removing old container instance..."
podman stop gothic-site 2>/dev/null || true
podman rm gothic-site 2>/dev/null || true

echo "🔨 Building Podman image..."
podman build -t test-nginx:v2 .
podman save test-nginx:v2 | minikube image load -
#echo "🚀 Starting Nginx server..."
#podman run -d --name gothic-site -p 8082:80 test-nginx:v1

#echo "✅ Success! Open http://localhost:8082 in your browser."


# 1. Apply the manifest file to create the deployment and service
kubectl apply -f njinx-deployment.yaml

# 2. Monitor the pod creation process until the STATUS changes to 'Running'
kubectl get pods -w

# 3. Verify the service is active and mapping ports correctly
kubectl get svc second-app-service
