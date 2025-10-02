GO_VERSION=1.25.1

if command -v go >/dev/null 2>&1; then
    echo "[INFO] Go already installed."
else
    echo "[INFO] Installing Golang $GO_VERSION"

    wget "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" -O golang.tar.gz
    tar -xzf golang.tar.gz # => ./go/
    mv go ~/.go

    echo "PATH=\$PATH:$(realpath ~/.go)" >> ~/.bashrc
fi