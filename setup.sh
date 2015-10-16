#!/bin/bash

I3CONFIG=~/.i3/config
I3STATUS=~/.i3status.conf
VIMRC=~/.vimrc
KEYBBACK=/usr/local/sbin/keyboard-backlight
TRACKPAD=/usr/X11/xorg.conf.d/50-synaptics-clickpad.conf

SAVEPWD=$PWD/

SRCFILES=(i3_config i3status.conf   vimrc   keyboard-backlight  50-synaptics-clickpad.conf)
DSTFILES=($I3CONFIG $I3STATUS       $VIMRC  $KEYBBACK           $TRACKPAD)
EXTRAOPT=(""        ""              ""      "yes"               "yes")

# move_file "original local file" "destination file" "yes/no sudo"
move_file() {
    SUDO=""
    if [ "$3" = "yes" ]; then
        SUDO="sudo"
    fi

    $SUDO cp -b $SAVEPWD/$1 $2
    test $? == "0" || ( echo "Failed to copy to $2" ; return )

    if [ -f $2~ ]; then
        echo "Original $2 file backed up as $2~"
    fi
}

for i in `seq 0 4`; do
    move_file ${SRCFILES[$i]} ${DSTFILES[$i]} ${EXTRAOPT[$i]}
done

echo Making keyboard-backlight executable...
sudo chmod +x $KEYBBACK

exit 0
