killall wlsunset
coords="${XDG_CACHE_HOME:-$HOME/.cache}/coords"
if [[ ! -f $coords ]];then
	curl "https://json.geoiplookup.io/$(curl https://ipinfo.io/ip)" > $coords
fi
wlsunset -l $(cat $coords | grep -i "latitude" | awk '{print $NF}' | cut -d',' -f1) -L $(cat $coords | grep -i "longitude" | awk '{print $NF}' | cut -d',' -f1) &
killall wireplumber
wireplumber & # trying this in .zprofile breaks my audio setup for some reason.
bash /usr/share/backgrounds/roll.sh &
killall mako
mako &
killall waybar
waybar &
bash ~/.config/bin/gtktheme
killall polkit-gnome-authentication-agent-1
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
killall nm-applet
nm-applet --indicator &
# Set and exec into the default layout generator, rivertile.
# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile &
exec rivertile -main-ratio 0.5 -view-padding 5 -outer-padding 8 &
for pad in $(riverctl list-inputs | grep -i touchpad )
do
  riverctl input $pad events enabled
  riverctl input $pad tap enabled
done
light -S 100%
