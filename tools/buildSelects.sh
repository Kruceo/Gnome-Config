echo " " >> config.sh
echo "# PARTS" >> config.sh

parts=(
   18.emoji.sh
   99.enable-extensions.sh
)

for file in "${parts[@]}"; do
    echo $file
    cat ./parts/$file >> config.sh
    echo " " >> config.sh
done

bun tools/fileReplacer.js config.sh