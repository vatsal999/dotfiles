#!/bin/sh

LOCK_FILE="$HOME/.cache/eww-redshift.lock"

case $1 in
	"color")
		if [ ! -f "$LOCK_FILE" ]; then
            echo "#458588"
        else
            echo "#d79921"
        fi
		;;
	"toggle")
		if [ ! -f "$LOCK_FILE" ]; then
			touch "$LOCK_FILE"
			redshift -P -O 4800
		else
			rm "$LOCK_FILE"
			redshift -x
		fi
		;;
esac
