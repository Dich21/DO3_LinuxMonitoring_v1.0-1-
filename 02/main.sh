#!/bin/bash
source ./info.sh

if [ $# -eq 0 ]; then
          INFO=$(init)
          echo ""
          echo "Do you want to save this information? (y/n)"
          read ANSWER
          if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
                    date=$(date +'%d %B %Y %H:%M:%S')
                    echo "$INFO" > "$date.txt"
                    echo "Information saved to $date.status"
          else
                    echo "Information deleted"
          fi

fi