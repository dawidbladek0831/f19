#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

# create objects
kubectl delete -f "$SCRIPT_DIR/namespace.yml" 