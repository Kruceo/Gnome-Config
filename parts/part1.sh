echo "[INFO] Installing Visual Studio Code"

if command -v code --version &> /dev/null;then
  echo "[INFO] Code is already installed"
else
  wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" -O visual-studio-code.tar.gz
  tar -xf visual-studio-code.tar.gz
  sudo mv VSCode* /opt/VSCode
  sudo ln -s /opt/VSCode/bin/code /bin/code

  sudo echo "[Desktop Entry]"                  > /usr/share/applications/code.desktop
  sudo echo "Name=VS Code"          >> /usr/share/applications/code.desktop
  sudo echo "Comment=Code Editing. Redefined." >> /usr/share/applications/code.desktop
  sudo echo "GenericName=Text Editor"          >> /usr/share/applications/code.desktop
  sudo echo "Exec=/usr/bin/code %F"            >> /usr/share/applications/code.desktop
  sudo echo "Icon=visual-studio-code"          >> /usr/share/applications/code.desktop
  sudo echo "Type=Application"                 >> /usr/share/applications/code.desktop
  sudo echo "StartupNotify=false"              >> /usr/share/applications/code.desktop
  sudo echo "StartupWMClass=Code"              >> /usr/share/applications/code.desktop
  sudo echo "Categories=TextEditor;Development;IDE;" >> /usr/share/applications/code.desktop
  sudo echo "MimeType=application/x-code-workspace;" >> /usr/share/applications/code.desktop
  sudo echo "Actions=new-empty-window;"              >> /usr/share/applications/code.desktop
  sudo echo "Keywords=vscode;"                       >> /usr/share/applications/code.desktop
  sudo echo ""                                       >> /usr/share/applications/code.desktop
  sudo echo "[Desktop Action new-empty-window]"    >> /usr/share/applications/code.desktop
  sudo echo "Name=New Empty Window"                >> /usr/share/applications/code.desktop
  sudo echo "Exec=/usr/bin/code --new-window %F"   >> /usr/share/applications/code.desktop
  sudo echo "Icon=visual-studio-code"              >> /usr/share/applications/code.desktop
fi