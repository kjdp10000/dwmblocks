#!/bin/sh
ICON="📅"

case $1 in
	1) setsid -f "$TERMINAL" -e "cal -y; read 'X? Hit <enter> to exit' ;" ;;
#	2) setsid -f "$TERMINAL" -e calcurse ;
	3) notify-send "📅 Time/date module" "\- Left click to show calendar for the year" ;;
	6) "$TERMINAL" -e "${EDITOR} $0" ;;
esac

printf "$ICON%s" "$(date '+%a, %b %d, %R')"
