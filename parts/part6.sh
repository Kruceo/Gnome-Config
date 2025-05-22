echo "[INFO] Installing tray icons"

git clone https://github.com/martinpl/tray-icons-reloaded.git
cd tray-icons-reloaded
make _build
make zip
gnome-extensions install trayIconsReloaded@selfmade.pl.zip
gnome-extensions enable trayIconsReloaded@selfmade.pl
cd $ORIGINAL_PATH

ALL_EXTENSIONS="$ALL_EXTENSIONS,'trayIconsReloaded@selfmade.pl'"