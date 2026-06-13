# Incident 06 - Disk Full

## Incident Summary

## Investigation

Application remained accessible.

Disk utilization increased to 98%.

Used df -h to identify filesystem pressure.

Used du -sh to identify large files.

Found:

bigfile.img  = 2G
bigfile2.img = 3G

These files were responsible for the disk usage spike.

## Root Cause

Large files consumed most of the available disk space.

Files identified:

bigfile.img  = 2G
bigfile2.img = 3G

## Recovery

Removed unnecessary files:

rm -f ~/bigfile.img ~/bigfile2.img

## Validation

df -h

curl localhost

Result:

Disk utilization reduced from 98% to 73% and application remained accessible.

## Key Learning

Useful troubleshooting flow:

df
→ du
→ identify large files
→ delete/archive
→ validate
