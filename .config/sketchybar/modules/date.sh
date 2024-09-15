#!/usr/bin/env sh
sketchybar --add item date right                         \
           --set date   update_freq=10                   \
                        script="$PLUGIN_DIR/date.sh"     \
                        icon.drawing=off                 

