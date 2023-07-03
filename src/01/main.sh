#!/bin/bash

par=$1

if [ $# -eq 1 ]; then
    if [[ $1 =~ ^[0-9]+$ ]] || [[ $1 =~ [0-9] ]]; then
        echo "ERROR: Invalid input"
    else
        echo $1
    fi
elif [ $# -lt 1 ]; then
    echo "ERROR: No argument"
else
    echo "ERROR: Too many arguments"
fi
