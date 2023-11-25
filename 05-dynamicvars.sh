#!/bin/bash

DATE="$(date +%F)"
SESSIONS_COUNT="$( who |wc -l)"
echo "todays date is $DATE "
echo "total number of active sessions $SESSIONS_COUNT"