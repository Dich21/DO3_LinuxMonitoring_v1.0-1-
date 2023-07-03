#!/bin/bash

COLOR=./colors.sh
# COLOR_DEFAULT='\033[0m'

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

# Инициализация переменных и изменения цвета

function init {
    echo "$($COLOR $1 $2)HOSTNAME = $($COLOR $3 $4)$HOSTNAME"
    echo "$($COLOR $1 $2)TIMEZONE = $($COLOR $3 $4)$TIMEZONE"
    echo "$($COLOR $1 $2)USER = $($COLOR $3 $4)$USER"
    echo "$($COLOR $1 $2)OS = $($COLOR $3 $4)$OS"
    echo "$($COLOR $1 $2)DATE = $($COLOR $3 $4)$DATE"
    echo "$($COLOR $1 $2)UPTIME = $($COLOR $3 $4)$UPTIME"
    echo "$($COLOR $1 $2)UPTIME_SEC = $($COLOR $3 $4)$UPTIME_SEC"
    echo "$($COLOR $1 $2)IP = $($COLOR $3 $4)$IP"
    echo "$($COLOR $1 $2)MASK = $($COLOR $3 $4)$MASK"
    echo "$($COLOR $1 $2)GATEWAY = $($COLOR $3 $4)$GATEWAY"
    echo "$($COLOR $1 $2)RAM_TOTAL = $($COLOR $3 $4)$RAM_TOTAL"
    echo "$($COLOR $1 $2)RAM_USED = $($COLOR $3 $4)$RAM_USED"
    echo "$($COLOR $1 $2)RAM_FREE = $($COLOR $3 $4)$RAM_FREE"
    echo "$($COLOR $1 $2)SPACE_ROOT = $($COLOR $3 $4)$SPACE_ROOT"
    echo "$($COLOR $1 $2)SPACE_ROOT_USED = $($COLOR $3 $4)$SPACE_ROOT_USED"
    echo "$($COLOR $1 $2)SPACE_ROOT_FREE = $($COLOR $3 $4)$SPACE_ROOT_FREE"
    echo -en "\033[0m\n"
    
}