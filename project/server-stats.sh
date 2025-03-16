#!/bin/bash
echo("############")
echo("CPU")

top -bn2 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1"%"}'

echo("############")
echo("Total memmory")

free | grep "Mem:" | awk '{print $3 "-" ($3/$2)*100 "%", $4 "-" ($4/$2)*100 "%"}'

echo("#############")
echo("Total disk")

df -h | awk '{gsub("%", "", $5); print $5, "%", 100-$5 "%"}'

echo("#############")
echo("5 process by cpu usage")

top -bn2 | grep "Cpu(s)" -A 20 | sort -k 3 -n -r | head -n 5

echo '###############'
echo '5 procces by memory usage'

ps aux --sort=-%mem | head -n 5


