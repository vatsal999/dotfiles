#!/bin/bash

nameWs() {
  buffered=""
  wmctrl -d | awk '{print $1 " " "\\"$2 " " $9}' | while read -r id active name; do
    name="${name#*_}"
    active=${active##*\\} && active=${active%% *}

    if wmctrl -l | grep --regexp '.*\s\+'"$id"'\s\+.*' >/dev/null; then
      wClass="occupied"
    else
      wClass="unoccupied"
    fi

    if [ "$active" == '*' ]; then
      wClass="active"
    fi

    # use this to show only active and unactive-occupied
    if [ "$wClass" != "unoccupied" ]; then
        buffered+="(button :class \"$wClass\" :tooltip \"Switch to $name?\" :onclick \"wmctrl -s $id\" \"$name\")"
        echo -n "$buffered"
    fi
    # comment above if statement and use uncomment this to show all workspaces
    # buffered+="(button :class \"$wClass\" :tooltip \"Switch to $name?\" :onclick \"wmctrl -s $id\" \"$name\")"
    # echo -n "$buffered"
    #
    buffered=""
  done
}

# This are the eww box attributes that will be used in the workspace widget.
#box_attrs=':orientation "h" :class "ws" :space-evenly false :spacing 12 :valign 0.5'
box_attrs=':orientation "v" :class "ws" :space-evenly true :spacing 5 :halign "center" :valign "center" '

# This checks the root window for updates, updating the nameWs output every 
# time a change occurs to a workspace (window opened or focused desktop).
xprop -spy -root _NET_CURRENT_DESKTOP | while read -r _; do
echo "(box $box_attrs $(nameWs))"
done
