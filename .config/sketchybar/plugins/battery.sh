#!/usr/bin/env sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  9[0-9]|100)
      ICON="" 
      ICONCOLOR=0xffb8bb26
  ;;
  [6-8][0-9])
      ICON="" 
      ICONCOLOR=0xffb8bb26
  ;;
  [3-5][0-9])
      ICON="" 
      ICONCOLOR=0xfffabd2f
  ;;
  [1-2][0-9])
      ICON="" 
      ICONCOLOR=0xfffabd2f
  ;;
  *)
  # OCD inducing charging label
  ICON="CHARGE!CHARGE!CHARGE!CHARGE!CHARGE!CHARGE!CHARGE!" 
  ICONCOLOR=0xfffb4934
esac

if [[ $CHARGING != "" ]]; then
  ICON=""
  ICONCOLOR=0xffb8bb26
fi

sketchybar --set $NAME icon="$ICON" icon.color="$ICONCOLOR" label="${PERCENTAGE}%"
