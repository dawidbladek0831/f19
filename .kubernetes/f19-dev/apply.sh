#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl apply -f "$SCRIPT_DIR/namespace.yml" 

kubectl apply -f "$SCRIPT_DIR/file-storage.yml" 
kubectl apply -f "$SCRIPT_DIR/synthesizer.yml" 
kubectl apply -f "$SCRIPT_DIR/front.yml" 

kubectl apply -f "$SCRIPT_DIR/route.yml" 