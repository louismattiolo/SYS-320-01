#!/bin/bash

link="http://10.0.17.47/Assignment.html"
fullPage=$(curl -sL "$link")

# Extract temperature values and times from first table
temps=$(echo "$fullPage" | \
xmlstarlet sel -t -m "//table[1]/tr[position()>1]/td[1]" -v . -n)

times=$(echo "$fullPage" | \
xmlstarlet sel -t -m "//table[1]/tr[position()>1]/td[2]" -v . -n)

# Extract pressure values from second table
press=$(echo "$fullPage" | \
xmlstarlet sel -t -m "//table[2]/tr[position()>1]/td[1]" -v . -n)

# Merge columns
paste <(echo "$press") <(echo "$temps") <(echo "$times")
