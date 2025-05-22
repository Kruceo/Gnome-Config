echo "[INFO] Installing dash to dock"

git clone https://github.com/micheleg/dash-to-dock.git
echo cloned
export SASS=dart
cd dash-to-dock
make install
gnome-extensions enable dash-to-dock@micxgx.gmail.com
cd $ORIGINAL_PATH
dconf load /org/gnome/shell/extensions/dash-to-dock/ < dash-to-dock.conf

ALL_EXTENSIONS="'dash-to-dock@micxgx.gmail.com'"