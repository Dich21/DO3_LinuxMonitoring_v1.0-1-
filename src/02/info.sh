#!/bin/bash

HOSTNAME=$(hostname)
TIMEZONE="$(timedatectl | grep "Time zone" | awk '{print $3}') $(date +'UTC %-:::z')"
USER=$(whoami)
OS=$(cat /etc/issue.net)
DATE=$(date +'%d %B %Y %H:%M:%S')
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print $2}' /proc/uptime)
IP=$(hostname -I | awk '{print $1}')
MASK=$(netstat -rn | tail -n 1 | awk '{print $3}')
GATEWAY=$(ip r | grep "default via" | awk '{print $3; exit}')
RAM_TOTAL=$(free -m | awk '/Mem/ {printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem/ {printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem/ {printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df -h / | awk '/dev/{print $2}')
SPACE_ROOT_USED=$(df -h / | awk '/dev/{print $3}')
SPACE_ROOT_FREE=$(df -h / | awk '/dev/{print $4}')

# Инициализация переменных

function init {
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL"
    echo "RAM_USED = $RAM_USED"
    echo "RAM_FREE = $RAM_FREE"
    echo "SPACE_ROOT = $SPACE_ROOT"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}