#!/bin/bash

function init {

          # Инициализация переменных

          TOTAL_NUMBER_OF_FOLDERS=$(find "$1" -type d | wc -l)
          TOTAL_NUMBER_OF_FILES=$(find "$1" -type f | wc -l)
          CONFIG_FILES=$(find "$1" -type f -name "*.conf" | wc -l)
          TEXT_FILES=$(find "$1" -type f -name "*.txt" | wc -l)
          EXECUTABLE_FILES=$(find "$1" -type f -executable | wc -l)
          LOG_FILES=$(find "$1" -type f -name "*.log" | wc -l)
          ARCHIVE_FILES=$(find "$1" -type f -name "*.zip" | wc -l)
          SYMLINK_FILES=$(find "$1" -type l | wc -l)

          # Вывод переменных

          echo "Total number of folders (including all nested ones) = $(( $TOTAL_NUMBER_OF_FOLDERS - 1 ))"
          echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
          for i in {1..5}; do
                    result=$(du -h "$1"* | sort -hr | sed -n ""$i"p")
                    if [[ ! -z "$result" ]]; then
                              size=$(echo "$result" | awk '{print $1}')
                              folder=$(echo "$result" | awk '{print $2}')
                              echo "$i - $folder, $size"
                    fi
          done
          echo "Total number of files = $TOTAL_NUMBER_OF_FILES"
          echo "Number of:"
          echo "Configuration files (with the .conf extension) = $CONFIG_FILES"
          echo "Text files = $TEXT_FILES"
          echo "Executable files = $EXECUTABLE_FILES"
          echo "Log files (with the extension .log) = $LOG_FILES"
          echo "Archive files = $ARCHIVE_FILES"
          echo "Symbolic links =$SYMLINK_FILES"
          echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
          for i in {1..10}; do
                    result=$(find "$1" -type f -exec du -ah {} + | sort -hr | sed -n ""$i"p")
                    if [[ ! -z "$result" ]]; then
                              size=$(echo "$result" | awk '{print $1}')
                              folder=$(echo "$result" | awk '{print $2}')
                              extension=$(echo "$folder" | awk -F. '{print $NF}')
                              echo "$i - $folder, $size, $extension"
                    fi
          done
          echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):  "
          for i in {1..10}; do
                    result=$(find "$1" -type f -executable -exec du -ah {} + | sort -hr | sed -n ""$i"p")
                    if [[ ! -z "$result" ]]; then
                              size=$(echo "$result" | awk '{print $1}')
                              folder=$(echo "$result" | awk '{print $2}')
                              hash=$(md5sum "$folder" | awk '{print $1}')
                              echo "$i - $folder, $size, $hash"
                    fi
          done
}
