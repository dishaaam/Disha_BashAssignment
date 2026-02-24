#!/bin/bash

# Log Analyzer Script

# Check if argument given
if [ $# -lt 1 ]; then
    echo "Please provide log file name."
    echo "Usage: ./q3_log_analyzer.sh filename"
    exit 1
fi

file=$1

# Check if file exist
if [ ! -f "$file" ]; then
    echo "File not found."
    exit 1
fi

# Check if file empty
if [ ! -s "$file" ]; then
    echo "Log file is empty."
    exit 1
fi

#log file analysis 

echo ""
echo "===== LOG FILE ANALYSIS ====="
echo "Log File: $file"
echo ""

# Total log entries
total=$(wc -l < "$file")
echo "Total Entries: $total"
echo ""

# Unique IPs
echo "Unique IP Addresses:"
awk '{print $1}' "$file" | sort | uniq
unique_count=$(awk '{print $1}' "$file" | sort | uniq | wc -l)
echo "Total Unique IPs: $unique_count"
echo ""

# Status code summary
echo "Status Code Summary:"
awk '{print $9}' "$file" | sort | uniq -c
echo ""


# Top 3 IPs by number of requests
echo "Top 3 IP Addresses:"
awk '{print $1}' "$file" | sort | uniq -c | sort -nr | head -3 | \
awk '{print NR") "$2" - "$1" requests"}'
echo ""

#Detect possible security threat (multiple 403 from same IP)

echo "Possible Security Threats:"
awk '$7 == 403 {print $1}' "$file" | sort | uniq -c | awk '$1 > 2 {print "IP:", $2, " - 403 Count:", $1}'
echo ""

#Generate CSV report
csv_file="report.csv"
echo "IP,Requests" > $csv_file
awk '{print $1}' "$file" | sort | uniq -c | awk '{print $2","$1}' >> $csv_file
echo "CSV report generated: $csv_file"
echo ""
