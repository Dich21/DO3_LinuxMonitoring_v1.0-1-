#!/bin/bash

chmod +x *.sh
source ./info.sh

default_color_scheme=(1 4 6 2)
error_flag=0

# Функция ошибок

function ERROR {
    case "$1" in
    1) echo "No arguments required. To select a color, use the configuration file.";;
    2) echo "Font color and background color must be different.";;
    3) echo "Invalid color value. Color values must be between 1 and 6.";;
    esac
    error_flag=1
}

# Функция вывода схемы палитры

function output {
    user_scheme=("$@")
    default_color_scheme=(1 4 6 2)
    colors=( [1]=white [2]=red [3]=green [4]=blue [5]=purple [6]=black)
    print=("Column 1 background = default (white)" "Column 1 font color = default (blue) " "Column 2 background = default (black) " "Column 2 font color = default (red)")
          
    for (( i = 0; i < 4; i++ )); do
        if [ ${user_scheme[i]} -ne ${default_color_scheme[i]} ]; then
            print[i]="$(echo ${print[i]} | cut -d "=" -f 1) = ${user_scheme[i]} (${colors[${user_scheme[i]}]})"
        fi
        echo ${print[i]}
    done
}

# Создание цветовой палитры

if [ $# -eq 0 ]; then
for (( i=1; i <= 4; i++ )); do
    color=$(cat ./config.sh | grep column | head -n $i | tail -n 1 | cut -d '=' -f 2)
        if [[ $color =~ ^[1-6]+$ ]]; then
            default_color_scheme[i-1]=$color
        elif [ -z "$color" ]; then
            default_color_scheme[i-1]=${default_color_scheme[i-1]}
        else
            ERROR 3
            break
        fi
done

# Проверка на совпадение цвета и фона

if [ ${default_color_scheme[0]} == ${default_color_scheme[1]} ] || [ ${default_color_scheme[2]} == ${default_color_scheme[3]} ]; then 
    ERROR 2
fi

# Преобразование палитры в цвет. Вывод схему палитры

if [ $error_flag -eq 0 ]; then
    init "${default_color_scheme[@]}"
    output "${default_color_scheme[@]}"
fi
else 
    ERROR 1
fi