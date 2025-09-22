echo "[INFO] Installing dash to dock"

git clone https://github.com/micheleg/dash-to-dock.git
echo cloned
export SASS=dart
cd dash-to-dock
make install
echo "[INFO] Dash to dock build and install complete"
gnome-extensions enable dash-to-dock@micxgx.gmail.com
ALL_EXTENSIONS="$ALL_EXTENSIONS,'dash-to-dock@micxgx.gmail.com'"
dconf load /org/gnome/shell/extensions/dash-to-dock/ < configs/dash-to-dock.conf