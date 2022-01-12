#!/bin/sh
# (for pulseaudio users)

# Prints the current volume or 🔇 if muted.

case $1 in
	1) setsid -f "$TERMINAL" -e pavucontrol ;;
	2) pactl set-sink-mute @DEFAULT_SINK@ toggle 
		kill -44 $(pidof dwmblocks) ;;
	4) pactl set-sink-volume @DEFAULT_SINK@ +1% 
		kill -44 $(pidof dwmblocks) ;;
	5) pactl set-sink-volume @DEFAULT_SINK@ -1%  
		kill -44 $(pidof dwmblocks) ;; 
	3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
- Middle click to mute.
- Scroll to change." ;;
	6) "$TERMINAL" -e "${EDITOR} $0" ;;
esac

getmute=`pacmd list-sinks | grep -e muted | awk '{print $2}'`
vol=`pacmd list-sinks | grep -E '^\s*volume:' | grep -E -o '[0-9]{1,3}.?\%' | head -1 | sed 's/%//'`

[ $getmute = "yes" ] && echo "🔇" && exit

# vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -lt "30" ]; then
	icon="🔈"
else
	icon="🔉"
fi

#echo "$icon$vol%"
printf "$icon%s" "$vol%"
