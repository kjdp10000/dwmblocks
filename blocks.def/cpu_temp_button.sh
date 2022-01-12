#!/bin/sh

    #1) exec "$TERMINAL" -e htop -s PERCENT_CPU ;;
    #2) exec "$TERMINAL" -e htop ;;
    #3) exec "$TERMINAL" -e htop -s PERCENT_MEM ;;
case "$1" in
    1) st -e htop -s PERCENT_CPU ;;
    2) st -e htop ;;
    3) st -e htop -s PERCENT_MEM ;;
esac
