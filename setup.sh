#!/bin/bash

I3CONFIG=~/.i3/config
I3STATUS=~/.i3status.conf
VIMRC=~/.vimrc
KEYBBACK=/usr/local/sbin/keyboard-backlight
TRACKPAD=/usr/X11/xorg.conf.d/50-synaptics-clickpad.conf
BASHPROF=~/.bash_profile
ADJUSTSC=/usr/local/bin/adjust_monitors.sh
SCREENSV=~/bin/screensaver.sh

SAVEPWD=$PWD/

SRCFILES=(i3_config i3status.conf   vimrc   keyboard-backlight  50-synaptics-clickpad.conf  bash_profile    adjust_monitors.sh  screensaver.sh)
DSTFILES=($I3CONFIG $I3STATUS       $VIMRC  $KEYBBACK           $TRACKPAD                   $BASHPROF       $ADJUSTSC           $SCREENSV)
EXTRAOPT=(""        ""              ""      "yes"               "yes"                       ""              "yes"               "")

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

# If there is no bin directory in the user's home folder, create it
if [ ! -d ~/bin ]; then
    mkdir -p ~/bin
fi

# Loop over the files and install them on their specific folders
for i in `seq 0 $(( ${#SRCFILES[*]} - 1 ))`; do
    move_file ${SRCFILES[$i]} ${DSTFILES[$i]} ${EXTRAOPT[$i]}
done

echo Making scripts executable...
sudo chmod +x $KEYBBACK
sudo chmod +x $ADJUSTSC
chmod +x $SCREENSV

echo "Add this line to your sudoers file:"
echo "ALL ALL=(root) NOPASSWD: /usr/local/sbin/keyboard-backlight"

exit 0
