# Incident 05 - High CPU

## Incident Summary

## Investigation

Application remained accessible.

System metrics showed CPU utilization above 90%.

top identified a process consuming most CPU resources.

ps confirmed the process was:

yes

This process was responsible for the CPU spike.

## Root Cause

A runaway process (yes) was consuming nearly all available CPU resources.

## Recovery

Identified the process using:

ps -ef --sort=-%cpu | head

Terminated the process using:

kill <PID>

## Validation

top -bn1 | head -10

curl localhost

Result:

CPU utilization returned to normal and application remained accessible.

## Key Learning

Useful troubleshooting flow:

top
→ ps
→ identify PID
→ kill
→ validate
