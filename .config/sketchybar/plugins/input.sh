#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.ABC-India') LABEL='QWERTY ' ;;
'org.unknown.keylayout.ColemakDHANSI') LABEL='COLEMAK ' ;;
esac

sketchybar --set $NAME icon="" icon.color=0xff83a598 label="$LABEL"
