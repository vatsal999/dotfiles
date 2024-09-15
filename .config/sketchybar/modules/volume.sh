#!/usr/bin/env sh
sketchybar  --add item sound right     \
            --set sound                \
                    update_freq=5              \
                    icon.color=$MAGENTA      \
                    script="$PLUGIN_DIR/volume.sh"
