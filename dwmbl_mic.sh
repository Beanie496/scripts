#!/bin/sh

muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{ print $2 }')
volume=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk '{ if(NR == 1) print ($5 + $12) / 2 }')
if [ "$muted" = "yes" ]; then
	echo "🎤 [Muted] $volume%"
else
	echo "🎤 $volume%"
fi

dunstify -t 1000 -h string:x-dunst-stack-tag:mic-volume-change "Mic volume" "Muted: $muted\nVolume: $volume%"
