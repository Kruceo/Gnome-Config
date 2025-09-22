echo "[INFO] Installing Reversal icons"
git clone https://github.com/Kruceo/Reversal-icon-theme.git
cd Reversal-icon-theme
./install.sh
dconf write /org/gnome/desktop/interface/icon-theme "'Reversal-dark'" 
