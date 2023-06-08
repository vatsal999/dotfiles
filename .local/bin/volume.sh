#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

speaker_card="$(pactl list short sinks | cut -f1 | tail -n1)"

function get_volume {
    #pamixer --get-volume-human |cut -d '%' -f 1
    echo $(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | awk '{print $5}' | tr % " ")
}

#function is_mute {
    #pamixer --get-volume-human|grep -oE '[^ ]+$' | grep off > /dev/null
#}
#

function send_notification {
    volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep Volume | awk '{print $5}' | tr % " ")
    echo "VOL:$volume"
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" "$((volume/5))" | sed 's/[0-9]//g')
    # Send the notification
    dunstify -t 900 -r 70 -a volume "Volume: $volume %" -h int:value:"$volume"
    #dunstify -t 900 -r 70 -a volume "$bar"

}

case $1 in
    get)
        get_volume
    ;;
    up)
	# pamixer --unmute > /dev/null
	# pamixer --increase 1 > /dev/null
        pactl set-sink-volume "$speaker_card" +1%
	    send_notification
	;;
    down)
	# pamixer -u > /dev/null
	# pamixer  --decrease 1 > /dev/null
        pactl set-sink-volume "$speaker_card" -1%
	    send_notification
	;;
    mute)
    	# Toggle mute
	# pamixer --toggle-mute > /dev/null
    pactl set-sink-mute "$speaker_card" toggle
    mute_status="$(pactl get-sink-mute $speaker_card | awk '{print $2}')"
	if [ $mute_status == "yes" ] ; then
	    dunstify -t 2000 -r 2593 -u normal "Mute"
	else
	    send_notification
	fi
	;;
esac
