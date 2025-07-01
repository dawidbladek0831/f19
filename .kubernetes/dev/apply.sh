#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/namespace.yml" 

kubectl apply -f "$SCRIPT_DIR/auth-db.yml" 
kubectl apply -f "$SCRIPT_DIR/auth.yml" 

kubectl apply -f "$SCRIPT_DIR/kafka.yml" 
kubectl apply -f "$SCRIPT_DIR/kafka-ui.yml"

kubectl apply -f "$SCRIPT_DIR/mongo.yml"
# kubectl apply -f "$SCRIPT_DIR/mongo-ui.yml"

kubectl apply -f "$SCRIPT_DIR/route.yml" 