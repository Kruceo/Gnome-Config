echo "[INFO] Installing clipboard history"

cd ~/.local/share/gnome-shell/extensions/ && \
  git clone https://github.com/SUPERCILEX/gnome-clipboard-history.git clipboard-history@alexsaveau.dev && \
  cd clipboard-history@alexsaveau.dev && \
  make

gnome-extensions enable clipboard-history@alexsaveau.dev
dconf load /org/gnome/shell/extensions/clipboard-history/ < configs/clipboard-history.conf

ALL_EXTENSIONS="$ALL_EXTENSIONS,'clipboard-history@alexsaveau.dev'"