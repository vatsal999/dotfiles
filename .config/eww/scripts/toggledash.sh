#!/bin/sh

if [ "$(eww get dash_rev)" = "false" ]; then
    eww open dash
    eww update dash_rev=true
else
    eww update dash_rev=false
    sleep 0.5
    eww close dash
fi
