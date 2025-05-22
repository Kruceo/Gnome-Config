#!/bin/bash

ORIGINAL_PATH=$(realpath .)


#!/bin/bash

# Lista de pacotes a serem instalados
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


# Função para verificar se um pacote está instalado
is_installed() {
  pacman -Q "$1" &>/dev/null
}

# Instala apenas os pacotes que ainda não estão instalados
for pkg in "${packages[@]}"; do
  if is_installed "$pkg"; then
    echo "✔️  $pkg já está instalado"
  else
    echo "➕ Instalando $pkg..."
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

flatpak install -y flathub com.vivaldi.Vivaldi
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.usebottles.bottles
flatpak install -y flathub org.virt_manager.virt-manager
flatpak install -y flathub org.inkscape.Inkscape

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
echo echo \$1 >> tmppath/bin/sass
echo echo \$2 >> tmppath/bin/sass
echo echo \$3 >> tmppath/bin/sass
echo "bunx --bun sass \$@" >> tmppath/bin/sass
chmod +x tmppath/bin/sass