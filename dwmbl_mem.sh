#!/bin/dash
free --mega | awk '/^Mem/ { print "RAM: " $3 " / " $2 " MB" }'
