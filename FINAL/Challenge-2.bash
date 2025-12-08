#!/bin/bash

> report.txt  # Clear report file

while read -r ioc; do  # Read each IOC
    grep "$ioc" "$1" | awk '{print $1,$4,$7}' | sed 's/\[//g' >> report.txt  # Find & extract data
done < "$2"  # From IOC file

echo "Report saved to report.txt"
