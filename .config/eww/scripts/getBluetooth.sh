#!/bin/sh
bluetooth="$(bluetoothctl show | grep -w Powered:)"

case "$1" in
   "toggle")
      # Toggles bluetooth power.
      [ "${bluetooth#*yes}" != "$bluetooth" ] \
         && power="off" || power="on"
      bluetoothctl power $power ;;
   "status") 
    # prints "OFF" if bt off, "Disconnected" if bt on but not connected to device
    # and prints name of device if bt is on and connected to device
        if [ "${bluetooth#*yes}" != "$bluetooth" ] ; then
            name=$(bluetoothctl devices | cut -f2 -d' ' | \
              while read uuid; do bluetoothctl info $uuid; done | \
              grep -e "Name\|Connected: yes" | grep -B1 "yes" | head -n 1 | cut -d\  -f2-)
            if [ -z $name ]; then
                echo "Disconnected"
            else
                echo $name
            fi
        else
            echo "OFF"
        fi
        ;;
   "icon") 
      # Shows a `bluetooth on` icon if bluetooth is on.
      [ "${bluetooth#*yes}" != "$bluetooth" ] \
         && icon="󰂯" || icon="󰂲"
      echo "$icon" ;;
esac
