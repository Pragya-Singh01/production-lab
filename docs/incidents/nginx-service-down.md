# Incident 01 - Nginx Service Down

## Incident Summary

## Baseline Health Check

Application reachable through nginx.

Validation:

curl localhost

Output:

<h1>Auto Deployed via GitHub Actions</h1>

## Incident Trigger

Introduced invalid nginx configuration.

Validation command:

sudo nginx -t

Error:

directive "server" has no opening "{"

Configuration test failed.

## Root Cause

A malformed nginx configuration was deployed.

The opening brace `{` after the `server` directive was accidentally removed.

As a result, nginx configuration validation failed and the service could not start after restart.

Error:

directive "server" has no opening "{"

## Recovery

Restored last known good configuration from backup.

Commands:

sudo cp /etc/nginx/conf.d/production-lab.conf.bak \
/etc/nginx/conf.d/production-lab.conf

sudo nginx -t

sudo systemctl start nginx

## Validation

sudo systemctl status nginx

curl localhost

Result:

Application successfully served through nginx.
