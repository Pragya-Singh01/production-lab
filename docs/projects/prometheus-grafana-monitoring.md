# 🚀 Production Monitoring Stack with Prometheus, Node Exporter & Grafana

## 📌 Project Overview

Designed and implemented an end-to-end infrastructure monitoring and observability stack on AWS EC2 using Prometheus, Node Exporter, and Grafana.

The objective was to gain hands-on experience with real-world monitoring, metrics collection, dashboarding, alert investigation, and troubleshooting workflows commonly used by SRE and DevOps teams.

---

## 🏗️ Architecture

EC2 Instance

↓

Node Exporter (Metrics Collection)

↓

Prometheus (Metrics Storage & Query Engine)

↓

Grafana (Visualization & Dashboards)

---

## 🛠️ Technologies Used

* AWS EC2
* Linux (Amazon Linux 2023)
* Prometheus
* Node Exporter
* Grafana
* Git & GitHub
* Bash
* Networking & Security Groups

---

## ⚙️ Key Activities Performed

### Node Exporter Setup

* Downloaded and configured Node Exporter
* Exposed infrastructure metrics on port 9100
* Verified metrics using `/metrics` endpoint
* Validated CPU, memory, disk, and filesystem metrics

### Prometheus Setup

* Installed Prometheus
* Configured scrape targets
* Connected Prometheus to Node Exporter
* Verified successful metric scraping
* Explored Prometheus queries and targets

### Grafana Setup

* Installed Grafana
* Configured Prometheus as Data Source
* Opened required Security Group ports
* Imported Node Exporter dashboard
* Built a complete monitoring visualization stack

---

## 🔍 Monitoring & Troubleshooting Exercises

### Memory Utilization Simulation

Generated artificial memory pressure using Linux stress testing tools and observed:

* Memory usage increase in Grafana
* Prometheus metric collection in real time
* Recovery after workload completion

### CPU Utilization Simulation

Generated CPU load and monitored:

* CPU Busy %
* Load Average
* Resource utilization trends

Used Linux troubleshooting commands to identify resource-intensive processes:

```bash
top -o %CPU
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu
```

Validated correlation between:

* System activity
* Prometheus metrics
* Grafana dashboards

---

## 🧠 Key Concepts Learned

### Monitoring Flow

Application / Server

↓

Node Exporter

↓

Prometheus

↓

Grafana

### Push vs Pull Monitoring

CloudWatch:

Server → CloudWatch

(Push Model)

Prometheus:

Prometheus → Target

(Pull Model)

### Troubleshooting Workflow

Observe

↓

Gather Evidence

↓

Identify Root Cause

↓

Validate Findings

↓

Resolve Issue

↓

Document RCA

---

## 📈 Skills Demonstrated

* Linux Administration
* AWS EC2
* Monitoring & Observability
* Prometheus
* Grafana
* Node Exporter
* Incident Investigation
* Performance Analysis
* Root Cause Analysis (RCA)
* System Troubleshooting
* Networking Fundamentals

---

## 🎯 Outcome

Successfully built and operated a production-style monitoring stack capable of collecting, storing, visualizing, and troubleshooting infrastructure metrics.

Performed hands-on failure simulations and validated monitoring workflows commonly used in real-world SRE, DevOps, and Operations environments.

