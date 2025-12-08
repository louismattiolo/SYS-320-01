#!/bin/bash
# Usage: bash Challenge-3.bash
# Converts report.txt into an HTML table and moves it to /var/www/html
# Make sure report.txt exists in the current directory before running

# Create HTML report from report.txt
{
    echo "<html><body>"
    echo "<h3>Access logs with IOC indicators:</h3>"
    echo "<table border='1'>"
    
    # Loop through each line and convert to table row
    while read -r line; do
        echo "<tr><td>${line// /</td><td>}</td></tr>"
    done < report.txt
    
    echo "</table></body></html>"
} > report.html

# Move to web directory
sudo mv report.html /var/www/html/

echo "HTML report created and moved to /var/www/html/report.html"
