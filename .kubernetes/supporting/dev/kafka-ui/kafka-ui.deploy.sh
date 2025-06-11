#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

kubectl apply -f "$SCRIPT_DIR/kafka-ui.deployment.workload.yaml"
kubectl apply -f "$SCRIPT_DIR/kafka-ui.external.service.yaml"