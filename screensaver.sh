#!/bin/bash

# sudo /usr/local/sbin/keyboard-backlight off
scrot /tmp/sc.png -e 'convert $f -blur 5x3 $f'
i3lock -e -i /tmp/sc.png
