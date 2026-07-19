# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

sep='<span weight="bold" foreground="#00ff00">|</span>'

date=$(date "+%a %F") 

time=$(date "+%H:%M:%S")

# Works on FreeBSD
# Not sure for linux
sys_info=$(uname -ar | cut -d " " -f 1,3 | cut -d "-" -f 1)

battery_status=$(acpiconf -i 0 | grep "Remaining capacity" | cut -b 21-23)

# ifconfig is used on FreeBSD
private_ip=$(ifconfig wlan0 | grep "inet" | cut -d " " -f 2)

echo "$sep  $sys_info  $sep  $private_ip  $sep  $date  $sep  $battery_status  $sep  $time  $sep"
