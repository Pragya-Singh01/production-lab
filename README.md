# Production Lab

A personal hands-on DevOps/SRE lab built on AWS EC2 to practice real-world production troubleshooting.

## Stack

* AWS EC2
* Linux
* Nginx
* Git & GitHub Actions
* Python
* Prometheus
* Node Exporter
* Blackbox Exporter
* Alertmanager
* Grafana

## Project Structure

* `app/` – Sample applications
* `monitoring/` – Monitoring stack and configuration
* `docs/projects/` – End-to-end project documentation
* `docs/incidents/` – Individual incident notes
* `scripts/` – Automation scripts

## Labs Completed

* Nginx Troubleshooting
* Monitoring & Observability
* Prometheus + Grafana
* Alertmanager Email Alerts
* Reverse Proxy & Networking

## Current Focus

Building production-style troubleshooting skills for DevOps, SRE, and Release Engineering roles.

## Quick Start

### 1. Launch an EC2 Instance

* Amazon Linux 2023
* Allow SSH (22)
* Allow HTTP (80)
* Allow required monitoring ports (9090, 3000, etc.) if needed

### 2. Install Git

```bash
sudo dnf install git -y
```

### 3. Clone the Repository

```bash
git clone https://github.com/Pragya-Singh01/production-lab.git

cd production-lab
```

### 4. Make Scripts Executable

```bash
chmod +x scripts/setup.sh
chmod +x scripts/install/*.sh
```

### 5. Run Bootstrap

```bash
./scripts/setup.sh
```

> **Note:** Installer scripts are currently placeholders and will be populated as the lab evolves.

## Future Goal

The long-term goal is to make this repository capable of rebuilding the complete Production Lab on a fresh EC2 instance using the installation scripts under `scripts/install/`.

## Future Improvements

- [ ] Complete all installer scripts under `scripts/install/`
- [ ] Add systemd service files for all monitoring components
- [ ] Automate complete lab setup using `scripts/setup.sh`
- [ ] Add maintenance scripts (backup, cleanup, log rotation)
- [ ] Add troubleshooting scripts (health checks, diagnostics)
- [ ] Configure Nginx as a multi-service reverse proxy
- [ ] Add Docker-based deployment
- [ ] Add Kubernetes deployment
- [ ] Export Grafana dashboards to `monitoring/dashboards/`
- [ ] Add Terraform infrastructure provisioning

