#!/bin/bash

LOG_FILE="../data/data.log"

# Thresholds for alerts
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

while true; do
    echo "" > $LOG_FILE
    echo "===== System Monitor =====" >> $LOG_FILE
    echo "Date: $(date)" >> $LOG_FILE

    # CPU usage (average over 1 minute)
    CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | awk '{print int($1)}')
    echo "CPU Load: $CPU_LOAD%" >> $LOG_FILE
    if [ $CPU_LOAD -gt $CPU_THRESHOLD ]; then
        echo "ALERT: High CPU usage ($CPU_LOAD%)" >> $LOG_FILE
    fi

    # Memory usage
    MEM_USED=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
    FREE_MEM=$(free -g | awk '/Mem:/ {printf("%.0f", $4)}')
    echo "Memory Usage: $MEM_USED%" >> $LOG_FILE
    echo "Free Memory: $FREE_MEM GB" >> $LOG_FILE
    if [ $MEM_USED -gt $MEM_THRESHOLD ]; then
        echo "ALERT: High Memory usage ($MEM_USED%)" >> $LOG_FILE
    fi

    # Disk usage (root partition)
    DISK_USED=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "Disk Usage: $DISK_USED%" >> $LOG_FILE
    if [ $DISK_USED -gt $DISK_THRESHOLD ]; then
        echo "ALERT: High Disk usage ($DISK_USED%)" >> $LOG_FILE
    fi

    echo "==========================" >> $LOG_FILE
    echo "" >> $LOG_FILE

    # Sleep time in seconds
    sleep 300
done