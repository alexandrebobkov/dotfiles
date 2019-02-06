# ~/.config/openbox/autostart.sh
#
# Run these programs when openbox starts.

# Use feh for background wallpaper.
feh --bg-fill ~/Pictures/bg.png &

# compton -- composition manager
compton &

# tint2 -- provides panel, systray, clock & taskbar
tint2 &

# Wireless control for systray
wicd &
wicd-client --tray &

# Volume control for systray
volumeicon &
