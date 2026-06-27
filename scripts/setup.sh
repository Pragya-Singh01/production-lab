#!/bin/bash

echo "=================================="
echo " Production Lab Bootstrap"
echo "=================================="

echo "Running installation scripts..."

./scripts/install/install-nginx.sh
./scripts/install/install-prometheus.sh
./scripts/install/install-node-exporter.sh
./scripts/install/install-blackbox.sh
./scripts/install/install-alertmanager.sh
./scripts/install/install-grafana.sh

echo
echo "Bootstrap completed."
