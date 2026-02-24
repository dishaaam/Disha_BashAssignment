#!/bin/bash

USERNAME=$(whoami)
HOST=$(hostname)
CURRENT_DATE=$(date)
OS_NAME=$(uname -s)
CURRENT_DIR=$(pwd)
HOME_DIR=$HOME
USERS_COUNT=$(who | wc -l)
SYSTEM_UPTIME=$(uptime)

echo "---------------------------------------"
echo "         SYSTEM INFORMATION"
echo "---------------------------------------"

echo "Username        : $USERNAME"
echo "Hostname        : $HOST"
echo "Date & Time     : $CURRENT_DATE"
echo "OS              : $OS_NAME"
echo "Current Dir     : $CURRENT_DIR"
echo "Home Dir        : $HOME_DIR"
echo "Users Logged In : $USERS_COUNT"
echo "Uptime          : $SYSTEM_UPTIME"

echo "-------------------------------------"

echo "Disk Usage (Root):"
df -h /

echo ""
echo "Memory Usage:"
free -h

echo "------------------------------------"
