#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/keycloak.deployment.workload.yaml" 
kubectl apply -f "$SCRIPT_DIR/keycloak.external.service.yaml" 
kubectl apply -f "$SCRIPT_DIR/keycloak-db.deployment.workload.yaml" 
kubectl apply -f "$SCRIPT_DIR/keycloak-db.external.service.yaml" 