#!/bin/bash

# File to monitor
MONITORED_FILE="userlogs-1.bash"

# Script to execute on access
ACCESS_SCRIPT="./access.bash"

# Monitor the file for IN_ACCESS events
inotifywait -m -e access "$MONITORED_FILE" |
while read path action file; do
    echo "File accessed: $file"
    bash "$ACCESS_SCRIPT"
done
