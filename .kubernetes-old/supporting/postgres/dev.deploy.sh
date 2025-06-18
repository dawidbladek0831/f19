#!/bin/bash
kubectl apply -f ffs.service/dev/postgres/configmap.yaml
kubectl apply -f ffs.service/dev/postgres/headless.service.yaml
kubectl apply -f ffs.service/dev/postgres/external.service.yaml
kubectl apply -f ffs.service/dev/postgres/statefulset.workload.yaml

