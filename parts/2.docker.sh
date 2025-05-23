echo "[INFO] Getting Docker"
if command -v docker --version &> /dev/null;then
  echo "[INFO] Docker is already installed"
else
  sudo pacman -S --noconfirm docker docker-compose docker-buildx
  sudo systemctl enable --now docker.service
  sudo systemctl is-active docker.service
  docker --version
  sudo usermod -aG docker ${USER}
  newgrp docker
fi
