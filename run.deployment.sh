# 1. Apply the manifest file to create the deployment and service
kubectl apply -f njinx-deployment.yaml

# 2. Monitor the pod creation process until the STATUS changes to 'Running'
kubectl get pods -w

# 3. Verify the service is active and mapping ports correctly
kubectl get svc second-app-service
