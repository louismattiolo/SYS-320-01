#! /bin/bash

# This is the link we will scrape
link="http://10.0.17.47/Courses.html"

# get it with curl and tell curl not to give errors
fullPage=$(curl -sL "$link")

# Extract table rows using grep and process with sed
echo "$fullPage" | \
grep -o '<tr[^>]*>.*</tr>' | \
sed 's/<\/tr>/\n/g' | \
sed -e 's/&amp;//g' | \
sed -e 's/<tr[^>]*>//g' | \
sed -e 's/<td[^>]*>//g' | \
sed -e 's/<\/td>/;/g' | \
sed -e 's/<[/]\{0,1\}a[^>]*>//g' | \
sed -e 's/<[/]\{0,1\}nobr>//g' | \
sed -e 's/<[/]\{0,1\}span[^>]*>//g' | \
grep -v '^;*$' | \
grep -v '^[[:space:]]*$' \
> courses.txt
