# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

uptime=$(uptime | cut -d "," -f 1 | cut -d " " -f 4-6)

date=$(date "+%a %F %H:%M")

sys_info=$(uname -ar | cut -d " " -f 1,3 | cut -d "-" -f 1)

battery_status=$(acpiconf -i 0 | grep "Remaining capacity" | cut -b 21-23)

# Emojis and characters for the status bar
echo -e "|  $sys_info  |  $uptime  |  $date  |  $battery_status  |"
