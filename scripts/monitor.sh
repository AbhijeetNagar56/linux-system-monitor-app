#!/bin/bash

LOG_FILE="../data/data.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

echo "Starting System Monitor... Logging to $LOG_FILE"

while true; do
    
    CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | cut -d. -f1)


    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)


    DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

    {
        echo "CPU Load: ${CPU_LOAD}%"
        echo "Memory Usage: ${MEM_USAGE}%"
        echo "Disk Usage: ${DISK_USAGE}%"
    } > "$LOG_FILE"

    
    if [ "$CPU_LOAD" -gt "$CPU_THRESHOLD" ]; then
        echo "ALERT: High CPU Usage detected: ${CPU_LOAD}%"
    fi

    if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
        echo "ALERT: High Memory Usage detected: ${MEM_USAGE}%"
    fi

    if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        echo "ALERT: High Disk Usage detected: ${DISK_USAGE}%"
    fi

    
    sleep 300
done