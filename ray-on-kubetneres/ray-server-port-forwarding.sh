echo "Use the following address to connect to the Ray cluster:"
echo "Submit jobs using SDK: ray://localhost:10001"
echo "Connect to the dashboard: http://localhost:8265"
echo "Press Ctrl-C to exit"

kubectl port-forward --address 0.0.0.0 service/raycluster-kuberay-head-svc 10001:10001 8265:8265
