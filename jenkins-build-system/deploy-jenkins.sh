#!/bin/sh

echo "Deploying Jenkins"
echo "----------------------------------------"
kubectl apply -f jenkins-Namespace.yaml
kubectl apply -f jenkins-ServiceAccount.yaml
kubectl apply -f jenkins-admin-RoleBinding.yaml
kubectl apply -f jenkins-PersistentVolume.yaml
kubectl apply -f jenkins-PersistentVolumeClaim.yaml
kubectl apply -f jenkins-Deployment.yaml
kubectl apply -f jenkins-Service.yaml
echo "----------------------------------------\n"
echo "Access Kubernetes Dashboard in:\n\n  - http://localhost:8001/api/v1/namespaces/jenkins/services/jenkins-service/proxy/#/\n"

echo "----------------------------------------"

