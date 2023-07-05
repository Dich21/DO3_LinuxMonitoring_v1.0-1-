#!/bin/bash

source ./info.sh
source ./check.sh

function ERROR {
          case "$1" in
          1) echo "Font color and background color must be different.";;
          2) echo "Invalid text color code. Choose from 1 to 6.";;
          3) echo "Incorrect number of parameters. Usage: main.sh <background1> <font1> <background2> <font2>";;
          esac
          echo "Do you want to start over? (y/n)"
                    read -s -n 1 ANSWER
                    if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
                              echo "Enter four parameters"
                              read one two tree four
                              ./main.sh $one $two $tree $four

                    fi
}

if [ $# -eq 4 ]; then
          check_val "$@"
          if [ $? -eq 1 ]; then
                    check_dup $@
                    if [ $? -eq 1 ]; then
                              init $@
                    else
                              ERROR 1
                    fi
          else
                    ERROR 2
          fi
else 
          ERROR 3
fi
