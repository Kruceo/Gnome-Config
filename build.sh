cat init.sh > config.sh
echo " " >> config.sh

for file in $(ls -1v ./parts); do
    cat ./parts/$file >> config.sh
    echo " " >> config.sh
done