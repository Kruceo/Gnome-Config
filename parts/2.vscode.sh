echo "[INFO] Installing Visual Studio Code"

if command -v code --version &> /dev/null; then
  echo "[INFO] Code is already installed"
else
  wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O visual-studio-code.tar.gz
  tar -xf visual-studio-code.tar.gz
  sudo mv VSCode* /opt/VSCode
  sudo ln -s /opt/VSCode/bin/code /bin/code
fi

if [ -f /usr/share/applications/code.desktop ]; then
  echo "[INFO] Desktop entry for VS Code already exists"
else
  echo "[INFO] Creating desktop entry"
  sudo tee /usr/share/applications/code.desktop > /dev/null <<EOF
[Desktop Entry]
Name=VS Code
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/usr/bin/code %F
Icon=visual-studio-code
Type=Application
StartupNotify=false
StartupWMClass=Code
Categories=TextEditor;Development;IDE;
MimeType=application/x-code-workspace;
Actions=new-empty-window;
Keywords=vscode;

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=/usr/bin/code --new-window %F
Icon=visual-studio-code
EOF
fi
