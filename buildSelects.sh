cat init.sh > config.sh
echo " " >> config.sh
echo "# PARTS" >> config.sh

parts=(
    part10.sh
)

for file in "${parts[@]}"; do
    echo $file
    cat ./parts/$file >> config.sh
    echo " " >> config.sh
done

bun test.ts