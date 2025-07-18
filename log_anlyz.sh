#!/bin/bash

LOG_DIR="/home/faikhan/play_ground/prac_sh_scrtp/log"
APP_LOG="app.log"
DB_LOG="db.log"

ERROR_TYPE=("ERROR" "FATAL")
ACTION_TYPE=("QUERY" "INFO")

echo -e "\nScript to analyze log files has started"
echo -e "============================="

echo -e "\nlog files with recent changes"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo $LOG_FILES

echo -e "\nErrors in the application log"
grep "${ERROR_TYPE[0]}" "$LOG_DIR/$APP_LOG"

echo -e "\nNumber of errors found"
grep -c "${ERROR_TYPE[0]}" "$LOG_DIR/$APP_LOG"

echo -e "\nNumber of fatal errors found"
grep -c "${ERROR_TYPE[1]}" "$LOG_DIR/$APP_LOG"

echo -e "\nNumber of query in database log"
grep -c "${ACTION_TYPE[0]}" "$LOG_DIR/$DB_LOG"

echo -e "\nNumber of information found in database log"
grep -c "${ACTION_TYPE[1]}" "$LOG_DIR/$DB_LOG"

echo -e "\nInformation that are found in database"
grep "${ACTION_TYPE[1]}" "$LOG_DIR/$DB_LOG"