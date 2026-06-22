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

