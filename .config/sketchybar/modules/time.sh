#!/usr/bin/env sh
sketchybar --add item clock center                        \
           --set clock   update_freq=1                  \
                         script="$PLUGIN_DIR/clock.sh"   \
                         icon.drawing=off
