#!/bin/bash

function check_val {
          for arg in "$@"; do
          if [[ ! "$arg" =~ ^[1-6]$ ]]; then
                    return 0;
          fi
          done
          return 1
}

function check_dup {
          if [ "$1" == "$2" ] || [ "$3" == "$4" ]; then
                    return 0
          else
                    return 1
          fi  
}