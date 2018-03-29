#!/bin/bash
DATE=$(date +%d/%m/%Y)
TIME=$(date +%H:%M:%S)
HOSTNAME=$(hostname)
UPTIME=$(uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}')
CURRENT_USERS=$(users | wc -w)
MEMORY_UTILISATION=$(free -m | awk 'NR==2{printf "Memory Utilization: %.2f%%\n", $3*100/$2 }')
CPU_LOAD=$(top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}')

echo "------------------------ System Report ---------------------------"
echo "Date: $DATE Time: $TIME				$HOSTNAME					"
echo "------------------------------------------------------------------"
echo "Uptime: $UPTIME													"
echo "Current Users: $CURRENT_USERS										"
echo "$MEMORY_UTILISATION												"
echo "$CPU_LOAD															"
echo "-------------------------- End Report ----------------------------"