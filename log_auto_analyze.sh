#!/bin/bash

LOG_DIR="log"

ERROR_TYPE=("ERROR" "FATAL")
ACTION_TYPE=("QUERY" "INFO")

echo -e "\nScript to analyze log files has started"
echo -e "============================="

echo -e "\nlog files with recent changes"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -5)
echo $LOG_FILES

for LOG_FILE in $LOG_FILES; do
    for ERROR in $ERROR_TYPE; do
    echo -e "\nErrors in the $LOG_FILE log"
    grep "${ERROR_TYPE[0]}" "$LOG_FILE"

    echo -e "\nNumber of errors found in $LOG_FILE"
    grep -c "${ERROR_TYPE[0]}" "$LOG_FILE"

    echo -e "\nNumber of fatal errors found in $LOG_FILE"
    grep -c "${ERROR_TYPE[1]}" "$LOG_FILE"

    echo -e "\nNumber of query in $LOG_FILE log"
    grep -c "${ACTION_TYPE[0]}" "$LOG_FILE"

    echo -e "\nNumber of information found in $LOG_FILE log"
    grep -c "${ACTION_TYPE[1]}" "$LOG_FILE"

    echo -e "\nInformation that are found in $LOG_FILE"
    grep "${ACTION_TYPE[1]}" "$LOG_FILE"
    done
done