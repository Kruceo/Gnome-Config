echo "[INFO] Installing transparent tool bar"

git clone https://github.com/lamarios/gnome-shell-extension-transparent-top-bar.git
cd gnome-shell-extension-transparent-top-bar
make build
echo "[INFO] transparent tool bar build complete"
gnome-extensions install ./build/transparent-top-bar@com.ftpix.zip
gnome-extensions enable transparent-top-bar@ftpix.com
cd $ORIGINAL_PATH
dconf load /com/ftpix/transparentbar/ < configs/transparent-top-bar.conf

ALL_EXTENSIONS="$ALL_EXTENSIONS,'transparent-top-bar@ftpix.com'"