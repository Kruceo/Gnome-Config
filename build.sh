cat init.sh > config.sh
echo " " >> config.sh

for file in $(ls -1v ./parts); do
    cat ./parts/$file >> config.sh
    echo " " >> config.sh
    echo "cd \$ORIGINAL_PATH" >> config.sh
    echo " " >> config.sh
done

bun fileReplacer.js