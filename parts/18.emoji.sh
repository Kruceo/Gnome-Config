echo "[INFO] Installing smile-extension"

git clone https://github.com/mijorus/smile-gnome-extension.git
cd smile-gnome-extension
zip smile-extension@mijorus.it.zip extension.js metadata.json
gnome-extensions install smile-extension@mijorus.it.zip
gnome-extensions enable smile-extension@mijorus.it

ALL_EXTENSIONS="$ALL_EXTENSIONS,'smile-extension@mijorus.it'"