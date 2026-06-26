# Scenario 1 - Backend Application Down (502 Bad Gateway)

## Objective

Understand nginx reverse proxy dependency on backend application.

## Architecture

Browser
↓
Nginx :80
↓
Python App :5000

## Failure Introduced

Converted nginx from static file hosting to reverse proxy configuration.

Backend application was not running.

## Symptoms

* Website inaccessible
* 502 Bad Gateway
* WebsiteDown alert fired
* Alert email received

## Investigation

Commands used:

curl localhost

curl localhost:5000

sudo nginx -t

sudo ss -tulpn | grep 5000

## Root Cause

Nginx was healthy but backend application on port 5000 was unavailable.

## Resolution

Started Python application.

python3 app.py

## Verification

curl localhost:5000

curl localhost

Website restored successfully.

Alert returned to Inactive state.

Resolved email received.

## Lessons Learned

502 Bad Gateway usually indicates:

* Nginx reachable
* Backend unreachable

Always verify backend service before troubleshooting nginx.


# Scenario 2 - Investigating 502 Bad Gateway

## Objective

Investigate a 502 Bad Gateway error in a reverse proxy setup and identify the failed component.

## Architecture

Browser
↓
Nginx :80
↓
Python App :5000

## Symptoms

* Website returned **502 Bad Gateway**
* WebsiteDown alert fired in Prometheus
* Alert email received

## Investigation

Commands used:

```bash
curl localhost
curl localhost:5000
sudo nginx -t
sudo tail -20 /var/log/nginx/error.log
```

Key log entry:

```
connect() failed (111: Connection refused)
while connecting to upstream
upstream: http://127.0.0.1:5000/
```

## Root Cause

Nginx configuration was correct and attempted to forward requests to the backend application on port 5000.

The backend application was not running, so the operating system returned **Connection Refused**, causing nginx to respond with **502 Bad Gateway**.

## Resolution

Started the Python application.

Verified:

```bash
curl localhost:5000
curl localhost
```

Website became accessible.

Prometheus alert returned to **Inactive** and Alertmanager sent a **Resolved** email.

## Lessons Learned

* A 502 Bad Gateway does not necessarily mean nginx is broken.
* Always identify the upstream service and verify whether it is reachable.
* Read nginx error logs before changing configuration.
* "Connection Refused" usually means nothing is listening on the destination port.

