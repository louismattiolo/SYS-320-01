#!/bin/bash

webpage=$(curl -s http://10.0.17.47/IOC.html)

ioc=$(echo "$webpage" | grep -oP '(?<=<td>).*?(?=</td>)' | sed -n '1~2p')

echo "$ioc" > IOC.txt
