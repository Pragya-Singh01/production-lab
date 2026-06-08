# Monitoring & Observability Lab

## Objective

Build an end-to-end monitoring and observability stack using:

* Node Exporter
* Prometheus
* Grafana
* CloudWatch
* SNS

Goals:

* Metrics collection
* Dashboarding
* Alerting
* Incident detection
* Troubleshooting
* Runbook creation

---

## Environment

EC2 Instance: production-lab

Monitoring Components:

* Node Exporter
* Prometheus
* Grafana

---

## Session 1 - Environment Validation

### Activities Performed

* Reorganized monitoring directory structure.
* Created dedicated Prometheus and Node Exporter directories.
* Removed duplicate Prometheus configuration file.
* Created systemd service for Node Exporter.
* Created systemd service for Prometheus.
* Verified Node Exporter metrics endpoint.
* Verified Prometheus health endpoint.
* Confirmed Prometheus target scraping status.
* Verified Grafana service status.
* Confirmed Prometheus datasource connectivity.

### Result

Monitoring stack operational.

Node Exporter → Prometheus → Grafana

Status: Healthy

