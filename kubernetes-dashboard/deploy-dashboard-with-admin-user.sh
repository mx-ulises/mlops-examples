#!/bin/sh

echo "Deploying Kubernetes Dashboard"
echo "----------------------------------------"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
echo "----------------------------------------\n"

echo "Creating admin-user Service Account and Cluster Role Binding"
echo "----------------------------------------"
kubectl apply -f kubernetes-dashboard-admin-ServiceAccount.yaml
kubectl apply -f kubernetes-dashboard-admin-ClusterRoleBinding.yaml
echo "----------------------------------------\n"

echo "Printing admin-user Service Account Token"
echo "----------------------------------------"
kubectl -n kubernetes-dashboard create token admin-user
echo "----------------------------------------\n"
echo "Access Kubernetes Dashboard in:\n\n  - http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/\n"
echo "----------------------------------------"

