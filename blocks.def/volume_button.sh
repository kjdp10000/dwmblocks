#!/bin/sh
#case "$1" in
#    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
#    3) pactl set-sink-volume @DEFAULT_SINK@ 50% ;;
#esac


# Prints the current volume or 🔇 if muted.

case "$1" in
	1) setsid -f terminator -e pavucontrol ;;
	2) pactl info ;;
	4) pactl set-sink-volume 0 +1 ;;
	5) pactl set-sink-volume 0 -1 ;;
	3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
- Middle click to mute.
- Scroll to change." ;;
	6) terminator -e vim "$0" ;;
esac

getmute=pacmd list-sinks | grep -e muted | awk '{print $2}'
vol=pacmd list-sinks | grep -E '^\s*volume:' | grep -E -o '[0-9]{1,3}.?\%' | head -1

[ $(getmute) = "yes"] && echo 🔇 && exit

# vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -lt "30" ]; then
	icon="🔈"
else
	icon="🔉"
fi

echo "$icon$vol%"
