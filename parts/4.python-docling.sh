echo "[INFO] Installing python docling..."

set -euo pipefail

INSTALL_PATH="$HOME/.docling"
BIN_PATH="$HOME/.docling/bin"

# Save old TMPDIR and prepare temporary dir
OLDTMPDIR="${TMPDIR:-/tmp}"
TMPDIR="$(realpath ./.piptmp)"
export TMPDIR
mkdir -p "$TMPDIR"

# Prepare installation directory
mkdir -p "$INSTALL_PATH"
ORIGINAL_PATH=$(realpath .)
cd "$INSTALL_PATH"

# Setup Python venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install docling

# Create launcher script
cat <<EOF > docling.sh
#!/usr/bin/env bash
source "$INSTALL_PATH/venv/bin/activate"
exec "$INSTALL_PATH/venv/bin/docling" "\$@"
EOF

chmod +x docling.sh

# Create symlink in ~/.local/bin
mkdir -p "$BIN_PATH"
ln -sf "$INSTALL_PATH/docling.sh" "$BIN_PATH/docling"

rm -rf "$TMPDIR";
export TMPDIR="$OLDTMPDIR"

# Ensure BIN_PATH is in PATH
if ! grep -q "export PATH=\"$BIN_PATH:\$PATH\"" "$HOME/.bashrc"; then
    echo "export PATH=\"$BIN_PATH:\$PATH\"" >> "$HOME/.bashrc"
    echo "[INFO] Added $BIN_PATH to PATH in ~/.bashrc"
else
    echo "[INFO] $BIN_PATH already in PATH in ~/.bashrc"
fi


echo "[INFO] docling installed successfully. You can run it using the command 'docling'"
