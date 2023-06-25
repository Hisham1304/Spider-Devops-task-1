#!/bin/bash

echo "==============================
        COMPUTER LOG
==============================
" > comp_log.txt

echo "Uptime: $(uptime -p)" >> comp_log.txt
echo "Disk and memory usage: $(df -h /) (free -h /)" >> comp_log.txt
echo "Utilization and most expensive processes: $(top -bn1 -o %CPU -c | sed -n '8p')" >>comp_log.txt
echo "Open TCP ports: $(netstat -tuln | grep 'tcp')" >>comp_log.txt
echo "Current connections: $(netstat -an | grep 'ESTABLISHED')" >>comp_log.txt
echo "Processes: $(ps aux) " >>comp_log.txt

echo "===============================
">> comp_log.txt
