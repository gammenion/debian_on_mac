#!/bin/bash

FINALMODE=""
for sc in `xrandr | grep " connected" | cut -f 1 -d " "`; do
    case $sc in
        eDP1)
            MODE="--mode 1920x1200 --pos 0x0"
            ;;
        *)
            MODE="--auto --right-of $LASTSCREEN"
            ;;
    esac
    LASTSCREEN=$sc
    FINALMODE="$FINALMODE --output $sc $MODE"
done

echo xrandr $FINALMODE
