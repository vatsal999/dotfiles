#!/bin/sh

wifi=$(nmcli radio wifi | awk '/led/ {print}')

case "$1" in
   "toggle")
#       # Toggles bluetooth power.
        if [ "$wifi" = 'enabled'  ] ; then
            nmcli radio wifi off
        else
            nmcli radio wifi on
        fi
        ;;
   "status") 
      # Shows `ON` if bluetooth is on, or `OFF` if it isn't.
        name=$(iwgetid -r)
        if [ "$wifi" = 'enabled' ] ; then
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
        if [ $(nmcli radio wifi | awk '/led/ {print}') = 'enabled'  ] ; then
            icon="󰤨"
        else
            icon="󰤭"
        fi
        echo "$icon"
        ;;
esac
