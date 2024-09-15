#!/usr/bin/env sh

sketchybar  --add event input_change 'AppleSelectedInputSourcesChangedNotification' \
            --add item input right \
            --set input script="$PLUGIN_DIR/input.sh" \
            --subscribe input input_change
