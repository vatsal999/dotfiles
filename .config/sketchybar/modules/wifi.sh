#!/usr/bin/env sh
source "$PLUGIN_DIR/wifi.sh"
sketchybar --add item           wifi.control right                      \
                                                                        \
           --set wifi.control   icon=""                                \
                                icon.color=$GREEN                       \
                                label="OK"                              \
                                click_script="$POPUP_CLICK_SCRIPT"      \
                                popup.background.color=$GRAY            \
                                popup.background.corner_radius=5        \
                                                                        \
           --add item           wifi.ssid popup.wifi.control            \
           --set wifi.ssid      icon=""                                \
                                label="${SSID}"                         \
                                                                        \
           --add item           wifi.speed     popup.wifi.control       \
           --set wifi.speed     icon=""                        \
                                script="$PLUGIN_DIR/wifi_click.sh"        \
                                update_freq=10                          \
