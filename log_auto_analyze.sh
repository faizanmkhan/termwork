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

    echo -e "\n"
    echo    "=================================================="
    echo    "=============$LOG_FILE======================"
    echo    "=================================================="
    for ERROR in ${ERROR_TYPE[@]}; do

        echo -e "\n"
        echo    "=================================================="
        echo    "================$ERROR========================"
        echo    "=================================================="
        echo -e "\nErrors in the $LOG_FILE log"
        grep "$ERROR" "$LOG_FILE"

        echo -e "\nNumber of errors found in $LOG_FILE"
        grep -c "$ERROR" "$LOG_FILE"

        echo -e "\nNumber of fatal errors found in $LOG_FILE"
        grep -c "$ERROR" "$LOG_FILE"
    done
    for ACTION in ${ACTION_TYPE[@]}; do
        echo -e "\n"
        echo    "=================================================="
        echo    "================$ACTION======================="
        echo    "=================================================="
        echo -e "\nNumber of query in $LOG_FILE log"
        grep -c "$ACTION" "$LOG_FILE"

        echo -e "\nNumber of information found in $LOG_FILE log"
        grep -c "$$ACTION" "$LOG_FILE"

        echo -e "\nInformation that are found in $LOG_FILE"
        grep "$$ACTION" "$LOG_FILE"
    done
done