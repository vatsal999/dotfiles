#!/bin/sh
pamixer -m
i3lock --nofork                 	\
    --ignore-empty-password		\
    \
    --indicator				\
    --bar-indicator			\
    --bar-pos="1070"		\
    --bar-base-width="10"		\
    --bar-orientation=horizontal	\
    --bar-color=808080			\
    --ringver-color=88c0d0		\
    --ringwrong-color=bf616a		\
    --bshl-color=5e81ac			\
    --keyhl-color=a3be8c			\
    \
    --clock				\
    --time-color=eceff4ff		\
    --time-str="%I:%M %p"		\
    --time-font="Metropolis Bold"		\
    --time-size=120			\
    --time-pos="960:540"		\
    --time-color=ffffffff		\
    \
    --date-color=d8dee9ff		\
    --date-str="%A, %d %B"		\
    --date-color=ffffffff		\
    --date-font="MetroPolis"		\
    --date-size=50			\
    --date-pos="960:600"	\
    \
    --verif-font="Metropolis"		\
    --verif-size=50			\
    --verif-text="Welcome home!"		\
    --verif-color=ffffff \
    --wrong-font="Metropolis"		\
    --wrong-size=50			\
    --wrong-text="Try again"		\
    --wrong-color=ffffff\
    --image=/home/vatsal/Pictures/Wallpapers/Black/hell.png \
    --fill

