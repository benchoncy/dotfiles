#!/bin/bash
# This script is used to configure crontab for the user

CRONTAB_FILE="$HOME/.crontab.cron"
crontab < $CRONTAB_FILE
