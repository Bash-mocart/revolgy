#! /bin/bash


kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl create namespace prometheus
kubectl create namespace grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade -i prometheus prometheus-community/prometheus \
  --namespace prometheus \
  --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"
helm repo add grafana https://grafana.github.io/helm-charts
helm update
helm upgrade -i grafana grafana/grafana --namespace grafana