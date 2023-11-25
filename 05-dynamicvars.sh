#!/bin/bash

DATE="$(date +%F)"
SESSIONS_COUNT="$( who |wc -l)"
echo "todays date is \e[31m $DATE \e[0m"
echo "total number of active sessions are \e[32m $SESSIONS_COUNT \e[0m"