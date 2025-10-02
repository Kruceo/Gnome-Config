echo "" > config.sh

parts=(
    0.init.sh
    18.emoji.sh
    11.clipboard.sh
    13.trayicons.sh
    99.enable-extensions.sh
)

for file in "${parts[@]}"; do
    echo $file
    cat ./parts/$file >> config.sh
    echo " " >> config.sh
done

bun tools/fileReplacer.js config.sh