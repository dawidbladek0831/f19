#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# export environment variable
export $(cat .kubernetes/.env | xargs)

# create secreate
kubectl delete secret cloudflare-api-token \
  --namespace=cert-manager

kubectl create secret generic cloudflare-api-token \
  --from-literal=api-token=$CF_API_TOKEN \
  --namespace=cert-manager


# create objects
kubectl apply -f "$SCRIPT_DIR/shared.namespace.yaml" 
kubectl apply -f "$SCRIPT_DIR/dev.namespace.yaml" 
kubectl apply -f "$SCRIPT_DIR/prod.namespace.yaml" 
kubectl apply -f "$SCRIPT_DIR/gateway.yaml" 