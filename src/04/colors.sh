#!/bin/bash


#Значения переменных для цветов текста

White='\033[0;37m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Black='\033[0;30m'

#Значения переменных для цветов фона

White_BG='\033[47m'
Red_BG='\033[41m'
Green_BG='\033[42m'
Blue_BG='\033[44m'
Purple_BG='\033[45m'
Black_BG='\033[40m'

#Присваивание цвета

case "$2" in
1) echo -en "${White}" ;;
2) echo -en "${Red}" ;;
3) echo -en "${Green}" ;;
4) echo -en "${Blue}" ;;
5) echo -en "${Purple}" ;;
6) echo -en "${Black}" ;;
esac

case "$1" in
1) echo -en "${White_BG}" ;;
2) echo -en "${Red_BG}" ;;
3) echo -en "${Green_BG}" ;;
4) echo -en "${Blue_BG}" ;;
5) echo -en "${Purple_BG}" ;;
6) echo -en "${Black_BG}" ;;
esac