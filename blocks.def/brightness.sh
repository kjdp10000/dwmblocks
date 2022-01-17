#!/bin/sh
ICON="🔆"

case $1 in
#	1) setsid -f "$TERMINAL" -e pavucontrol ;;
#	2) pactl set-sink-mute @DEFAULT_SINK@ toggle 
#		kill -38 $(pidof dwmblocks) ;;
	4) brightnessctl -d 'amdgpu_bl0' s +1% 
		kill -38 $(pidof dwmblocks) ;;
	5) brightnessctl -d 'amdgpu_bl0' s 1%-  
		kill -38 $(pidof dwmblocks) ;; 
	3) notify-send "🔆 Display module" " - Scroll to change." ;;
#	6) "$TERMINAL" -e "${EDITOR} $0" ;;
esac


#brightness=$(brightnessctl -d 'amdgpu_bl0' | awk -F'[()]' '{print $2}')
brightness=$(brightnessctl -d 'amdgpu_bl0' | awk '/\(/ {print $4}' | awk -F'[()]' '{print $2}')
#printf "$ICON%s" "$brightness"
echo "$ICON$brightness"
