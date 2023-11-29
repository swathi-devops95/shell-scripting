#!/bin/bash

echo "demo on if usage"

ACTION=$1
if [ "$ACTION" == "start" ] ;then
    echo "start payment"
    exit 0
fi