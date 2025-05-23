echo "[INFO] Installing desktop icons"

git clone https://gitlab.com/rastersoft/desktop-icons-ng.git
cd desktop-icons-ng
bash local_install.sh
gnome-extensions enable ding@rastersoft.com
cd $ORIGINAL_PATH
dconf load /org/gnome/shell/extensions/ding/ < configs/ding.conf

ALL_EXTENSIONS="$ALL_EXTENSIONS,'ding@rastersoft.com'"