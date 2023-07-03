#!/bin/bash

chmod +x info.sh
source ./info.sh

start_time=$(date +%s)

if [ $# -ne 1 ]; then
          echo "ERROR: Incorrect number of parameters. Usage: main.sh <path_to_folder>"
          exit 1
elif [ ! -d "$1" ]; then
          echo "ERROR: The directory does not exist"
          exit 1
else
          init $1
          end_time=$(date +%s)
          execution_time=$((end_time - start_time))
          echo "Script execution time (in seconds) = $execution_time" 
fi

