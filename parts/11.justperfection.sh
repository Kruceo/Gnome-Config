echo "[INFO] Installing tray icons"

git clone https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git

cd just-perfection

bash scripts/build.sh -i

dconf load /org/gnome/shell/extensions/just-perfection/ < configs/just-perfection.conf

ALL_EXTENSIONS="$ALL_EXTENSIONS,'just-perfection-desktop@just-perfection.shell-extension'"