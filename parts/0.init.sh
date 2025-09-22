ORIGINAL_PATH=$(realpath .)

sudo pacman -Syu --noconfirm

packages=(
  zip
  meson
  ninja
  sassc
  btop
  git
  tree
  curl
  wget
)

is_installed() {
  pacman -Q "$1" &>/dev/null
}

for pkg in "${packages[@]}"; do
  if is_installed "$pkg"; then
    echo "[INFO] $pkg already installed"
  else
    echo "[INFO] $pkg not installed"
    sudo pacman -S --noconfirm "$pkg"
  fi
done



if command -v flatpak &> /dev/null
then
    echo "[INFO] Flatpak is already installed."
else
    echo "[INFO] Flatpak is not installed. Installing..."
    
    # Install Flatpak
    if [[ -f /etc/debian_version ]]; then
        sudo apt update
        sudo apt install flatpak -y
    elif [[ -f /etc/redhat-release ]]; then
        sudo dnf install flatpak -y
    elif [[ -f /etc/arch-release ]]; then
        sudo pacman -S flatpak --noconfirm
    else
        echo "[ERROR] Unsupported OS. Please install Flatpak manually."
    fi
fi

if command -v bun --version >/dev/null 2>&1; then
  echo "[INFO] Bun.js is available"
else

  echo "[INFO] Bun.js is not available"
  curl -fsSL https://bun.sh/install | bash
  source ~/.bashrc
fi


mkdir -p tmppath/bin
export PATH=$PATH:$(realpath tmppath/bin)
echo \#!/bin/bash  >  tmppath/bin/sass
echo "bunx --bun sass \$@" >> tmppath/bin/sass
chmod +x tmppath/bin/sass

ALL_EXTENSIONS="'default_none'"