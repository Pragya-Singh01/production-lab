# Incident 04 - Bad Deployment / Missing File

## Incident Summary

## Incident Trigger

Application file was renamed from:

index.html

to:

index.html.bak

## Investigation

Nginx service remained healthy.

curl localhost returned:

403 Forbidden

Nginx error log showed:

directory index of "/var/www/production-lab/" is forbidden

This indicated the default application file was missing.

## Root Cause

The application file was renamed from index.html to index.html.bak.

Nginx was configured to serve index.html as the default page.

Because the file was missing, nginx could not serve the application and returned 403 Forbidden.

## Recovery

Restored the file name:

sudo mv index.html.bak index.html

## Validation

curl localhost

Result:

Application page loaded successfully.

## Key Learning

A healthy service does not guarantee a successful deployment.

Useful troubleshooting flow:

curl
→ ls
→ nginx config
→ error.log
→ restore file
→ validate
