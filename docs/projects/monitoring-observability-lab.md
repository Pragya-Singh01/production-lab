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

---

## Session 2 - Application Availability Monitoring

### Objective

Extend monitoring beyond infrastructure metrics and implement application availability monitoring.

### Scenario

Simulate a website outage and determine whether the existing monitoring stack can detect it.

### Activities Performed

* Stopped the nginx service.
* Observed Grafana dashboard behavior.
* Verified service status using systemctl.
* Verified website accessibility using curl.
* Compared infrastructure health with application availability.

### Commands Used

```bash
sudo systemctl stop nginx

systemctl status nginx --no-pager

curl localhost

sudo systemctl start nginx
```

### Observations

* Prometheus remained healthy.
* Node Exporter remained healthy.
* CPU, Memory and Disk metrics remained healthy.
* Grafana dashboard showed minimal visible change.
* Website became unavailable.
* curl failed to connect to port 80.
* nginx service status changed to inactive (dead).

### Key Learning

A healthy server does not necessarily mean a healthy application.

Infrastructure Monitoring and Application Monitoring are different monitoring layers.

### Monitoring Gap Identified

Current monitoring stack:

```text
Node Exporter → Prometheus → Grafana
```

The stack could answer:

* Is CPU healthy?
* Is Memory healthy?
* Is Disk healthy?

The stack could not answer:

* Is the website reachable?
* Is HTTP responding?
* Can users access the application?

---

### Blackbox Exporter Integration

#### Objective

Add website availability monitoring to the monitoring stack.

#### Activities Performed

* Downloaded Blackbox Exporter.
* Created Blackbox Exporter systemd service.
* Started and enabled Blackbox Exporter.
* Added Blackbox Exporter target to Prometheus.
* Restarted Prometheus.
* Verified Blackbox target status.

#### Updated Architecture

```text
Website → Blackbox Exporter → Prometheus → Grafana
```

### Result

Prometheus successfully monitored website availability using HTTP probes.

Blackbox target status: UP

---

### Availability Monitoring

#### Query Used

```promql
probe_success
```

#### Results

Website Available:

```text
probe_success = 1
```

Website Unavailable:

```text
probe_success = 0
```

### Key Learning

Blackbox Exporter performs active endpoint checks and enables synthetic monitoring.

---

### Alert Rule Configuration

#### Alert Name

WebsiteDown

#### Alert Logic

```text
IF probe_success == 0
FOR 1 minute
THEN trigger alert
```

#### Activities Performed

* Created Prometheus alert rule.
* Added rule file to Prometheus configuration.
* Restarted Prometheus.
* Verified alert loading.

### Alert States Observed

#### Inactive

Website healthy.

```text
probe_success = 1
```

#### Firing

Website unavailable for more than one minute.

```text
probe_success = 0
```

### Result

Successfully triggered a WebsiteDown alert by stopping nginx.

---

### Outcome

Successfully implemented end-to-end application availability monitoring.

Final monitoring flow:

```text
Website
    ↓
Blackbox Exporter
    ↓
Prometheus
    ↓
Alert Rule
    ↓
Firing Alert
```

The monitoring stack can now detect website outages even when server CPU, Memory and Disk metrics remain healthy.

