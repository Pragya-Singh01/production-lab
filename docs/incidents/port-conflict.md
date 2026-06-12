# Incident 02 - Port Conflict

## Incident Summary

## Investigation

Nginx configuration validated successfully.

Service startup failed with:

bind() to 0.0.0.0:80 failed (98: Address already in use)

curl localhost returned a Python directory listing rather than the application page.

This indicated another process was already listening on port 80.

## Root Cause

A Python HTTP server was already bound to port 80.

Because only one process can listen on the same IP:Port combination, nginx was unable to bind to port 80 and failed to start.

## Recovery

Identified the process listening on port 80.

Commands:

sudo ss -tulpn | grep :80

sudo kill 84247

sudo systemctl start nginx

## Validation

sudo systemctl status nginx

curl localhost

Result:

Nginx started successfully and the application page was served correctly.

## Key Learning

Useful troubleshooting flow:

systemctl status
→ journalctl
→ ss -tulpn
→ ps
→ kill process
→ restart service
