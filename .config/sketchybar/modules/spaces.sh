#!/usr/bin/env sh
SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left                                 \
             --set space.$sid associated_space=$sid                      \
                              icon=${SPACE_ICONS[i]}                     \
                              icon.padding_left=5                        \
                              icon.padding_right=5                       \
                              icon.highlight_color=$YELLOW           \
                              background.padding_left=0                  \
                              background.padding_right=0                 \
                              #background.color=0xff282828                \
                              background.corner_radius=0                 \
                              background.height=26                       \
                              background.drawing=on                      \
                              label.drawing=off                          \
                              icon.drawing=on                           \
                              script="$PLUGIN_DIR/space.sh"              \
                              click_script="yabai -m space --focus $sid"
done
