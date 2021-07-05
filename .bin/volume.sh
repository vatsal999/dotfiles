#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    pamixer --get-volume-human |cut -d '%' -f 1
}

function is_mute {
    pamixer --get-volume-human|grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume= 'get_volume'
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" "$((volume/5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify  -t 8 -r 2593 -u normal "$bar"

}

case $1 in
    up)
	pamixer --unmute > /dev/null
	pamixer --increase 1 > /dev/null
	#send_notification
	;;
    down)
	pamixer -u > /dev/null
	pamixer  --decrease 1 > /dev/null
	#send_notification
	;;
    mute)
    	# Toggle mute
	pamixer --toggle-mute > /dev/null
	#if is_mute ; then
	    #dunstify -i audio-volume-muted -t 8 -r 2593 -u normal "Mute"
	#else
	    #send_notification
	#fi
	;;
esac
