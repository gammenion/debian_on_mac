# Debian on Mac

This repo is used to store my config files when using Linux on Mac.

## Overall setup

I have a late 2013 Mac laptop hardware and I use Debian with i3 as the window manager. Many of the files here are architecture agnostic, such as `vimrc` and `bash_profile`.

### i3 config - file: i3_config

This file is the main i3 configuration file. It must be located at `~/.i3/config`

This file will:
* initialize the laptop screen to 1920x1200
* Create two terminals on screen 1 split horizontally
* Open iceweasel on screen 2
* Set the left Command key as $mod (the default)
* Set `Command + Shift + a` to lock the screen
* Rightfully set keys for screen brightness, keyboard backlit and sound 

There are a few package dependencies for this file to work fully:
1. xbacklight: to adjust screen brightness
2. alsa-utils: to adjust volume - up and down
3. pulseaudio-utils: to mute and unmute
4. Keyboard backlight: this is a script, not a package. See section below

### i3 status bar - file: i3status.conf

This file is the i3 status bar configuration below the screen. It must be located at `~/.i3status.conf`

### Keyboard backlight - file: keyboard_backlight

This is a manually added script. It should be located at `/usr/local/sbin/` and must be executable

For the mapped key to work properly as it requires root privileges, the following line should be added to the sudoers file:

`ALL    ALL=(root) NOPASSWD: /usr/local/sbin/keyboard-backlight`

### Touchpad - file: 50-synaptics-clickpad.conf

This file makes several improvements to the usability of the trackpad. It must be located at `/etc/X11/xorg.conf.d`

### Bash Profile

My preferences on bash.

### Additional useful i3 commands and cheat sheet

1. Changing the screen size and adding a second HDMI screen at the right of the laptop screen

`xrandr --output eDP1 --mode 1920x1200 --pos 0x0 --output HDMI2 --auto --right-of eDP1`

2. Changes to default i3 configuration

`Command + b` = split vertically
This is required because the terminal is mapped to copy and paste with `Command + c` and `Command + v` by changing the shortcuts.

### Other linux on Mac tips:

1. Wifi: a new non-free repo must be added to the `/etc/apt/source.list` file:
`deb http://http.debian.net/debian/ jessie main contrib non-free`

Once this is added, run `apt-get update` and install package `broadcom-sta-dkms`. This will recognize the wifi card.

---
Markdown accepts emoji :metal:
