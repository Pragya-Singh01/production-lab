# Incident 03 - Wrong Permissions

## Incident Summary

## Investigation

Nginx service was running normally.

curl localhost returned:

403 Forbidden

File permissions:

---------- index.html

Nginx error log showed:

Permission denied

This confirmed nginx could not read the application file.

## Root Cause

The application file permissions were changed to 000.

As a result, nginx could not read index.html and returned 403 Forbidden even though the nginx service itself remained healthy.

## Recovery

Restored file permissions:

sudo chmod 644 /var/www/production-lab/index.html

## Validation

curl localhost

Result:

Application page loaded successfully.

## Key Learning

Service health does not always mean application health.

Useful troubleshooting flow:

curl
→ ls -l
→ nginx error.log
→ chmod
→ validate
