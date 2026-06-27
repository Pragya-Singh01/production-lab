#!/bin/bash

echo "=================================="
echo " Production Lab Bootstrap"
echo "=================================="

echo "Running installation scripts..."

./scripts/bootstrap/install-nginx.sh
./scripts/bootstrap/install-prometheus.sh
./scripts/bootstrap/install-node-exporter.sh
./scripts/bootstrap/install-blackbox.sh
./scripts/bootstrap/install-alertmanager.sh
./scripts/bootstrap/install-grafana.sh

echo
echo "Bootstrap completed."
