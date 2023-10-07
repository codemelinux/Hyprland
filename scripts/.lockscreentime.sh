#/bin/sh
systemd-inhibit --what=idle --who=swayidle-inhibit --why=commanded --mode=block sleep 1 &

if [ -f "/usr/bin/swayidle" ]; then
    echo "swayidle is installed."
    swayidle -w timeout 1 'swaylock -f' timeout 1 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
    echo "swayidle not installed."
fi;
