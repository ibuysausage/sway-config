#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

sep='<span weight="bold" foreground="#00ff00">|</span>'
bat="/sys/class/power_supply/BAT0"

date=$(date "+%a %F") 

time=$(date "+%H:%M:%S")

sys_info=$(uname -ar | cut -d " " -f 1,3 | cut -d "-" -f 1)

if [[ $OSTYPE == "freebsd"* ]]; then
    battery_status="$(acpiconf -i 0 | grep 'Remaining capacity' | awk -F' ' '{print $3}') $(acpiconf -i 0 | grep "State" | awk -F' ' '{print $2}'"
else
    battery_status="$(cat $bat/capacity)% <span weight=\"bold\">$(cat $bat/status)</span>"
fi

if [[ $OSTYPE == "freebsd"* ]]; then
    private_ip=$(ifconfig wlan0 | grep 'inet' | cut -d ' ' -f2)
else
    private_ip=$(ip address | grep 'wlan0$' | cut -d ' ' -f6)
fi

echo "$sep  $sys_info  $sep  $private_ip  $sep  $date  $sep  $battery_status  $sep  $time  $sep"
