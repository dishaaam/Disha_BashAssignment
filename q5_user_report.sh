#!/bin/bash

echo "===== USER ACCOUNT REPORT ====="
echo ""

#user statistics

total_users=$(wc -l < /etc/passwd)
system_users=$(awk -F: '$3 < 1000 {count++} END {print count}' /etc/passwd)
regular_users=$(awk -F: '$3 >= 1000 {count++} END {print count}' /etc/passwd)
logged_in=$(who | awk '{print $1}' | sort -u | wc -l)

echo "=== USER STATISTICS ==="
echo "Total Users: $total_users"
echo "System Users (UID < 1000): $system_users"
echo "Regular Users (UID >= 1000): $regular_users"
echo "Currently Logged In: $logged_in"
echo ""

#user details

echo "=== USER DETAILS (Regular Users) ==="
printf "%-15s %-6s %-20s %-15s %-20s\n" "Username" "UID" "Home Directory" "Shell" "Last Login"
echo "---------------------------------------------------------------------------------------"

awk -F: '$3 >= 1000 {print $1, $3, $6, $7}' /etc/passwd | while read user uid home shell
do
    last_login=$(lastlog -u "$user" | awk 'NR==2 {print $4,$5,$6,$7}')
    if [ -z "$last_login" ]; then
        last_login="Never logged in"
    fi
    printf "%-15s %-6s %-20s %-15s %-20s\n" "$user" "$uid" "$home" "$shell" "$last_login"
done

echo ""

#group info
echo "=== GROUP INFORMATION ==="
awk -F: '{print $1 ":" $4}' /etc/group | while IFS=":" read group members
do
    if [ -z "$members" ]; then
        count=0
    else
        count=$(echo "$members" | tr ',' '\n' | wc -l)
    fi
    echo "$group : $count"
done
echo ""

#security check

echo "=== SECURITY CHECK ==="

# Users with UID 0
uid_zero=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
echo "Users with root privileges (UID 0):"
echo "$uid_zero"
echo ""

# Inactive users
echo "Inactive Users (Never logged in):"
lastlog | grep "Never logged in" | awk '{print $1}'
echo ""

echo "===== END OF REPORT ====="