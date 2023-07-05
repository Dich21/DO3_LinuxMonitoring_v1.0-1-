#!/bin/bash

COLOR=./colors.sh
COLOR_DEFAULT='\033[0m\n'

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
    echo -en "$($COLOR $1 $2)HOSTNAME\033[0m = $($COLOR $3 $4)$HOSTNAME${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)TIMEZONE\033[0m = $($COLOR $3 $4)$TIMEZONE${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)USER\033[0m = $($COLOR $3 $4)$USER${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)OS\033[0m = $($COLOR $3 $4)$OS${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)DATE\033[0m = $($COLOR $3 $4)$DATE${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)UPTIME\033[0m = $($COLOR $3 $4)$UPTIME${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)UPTIME_SEC\033[0m = $($COLOR $3 $4)$UPTIME_SEC${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)IP\033[0m = $($COLOR $3 $4)$IP${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)MASK\033[0m = $($COLOR $3 $4)$MASK${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)GATEWAY\033[0m = $($COLOR $3 $4)$GATEWAY${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)RAM_TOTAL\033[0m = $($COLOR $3 $4)$RAM_TOTAL${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)RAM_USED\033[0m = $($COLOR $3 $4)$RAM_USED${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)RAM_FREE\033[0m = $($COLOR $3 $4)$RAM_FREE${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)SPACE_ROOT\033[0m = $($COLOR $3 $4)$SPACE_ROOT${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)SPACE_ROOT_USED\033[0m = $($COLOR $3 $4)$SPACE_ROOT_USED${COLOR_DEFAULT}"
    echo -en "$($COLOR $1 $2)SPACE_ROOT_FREE\033[0m = $($COLOR $3 $4)$SPACE_ROOT_FREE${COLOR_DEFAULT}"
    echo -en "\033[0m\n"
    echo
}

