#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/mongo.configmap.yaml"
kubectl apply -f "$SCRIPT_DIR/mongo.headless.service.yaml"
kubectl apply -f "$SCRIPT_DIR/mongo.external.service.yaml"
kubectl apply -f "$SCRIPT_DIR/mongo.statefulset.workload.yaml"

