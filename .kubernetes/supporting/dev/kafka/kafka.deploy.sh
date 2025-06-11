#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/kafka.headless.service.yaml"
kubectl apply -f "$SCRIPT_DIR/kafka.external.service.yaml"
kubectl apply -f "$SCRIPT_DIR/kafka.statefulset.workload.yaml"

