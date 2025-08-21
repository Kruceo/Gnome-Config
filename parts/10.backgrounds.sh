# echo "[INFO] Removing default backgrounds"
# sudo rm /usr/share/backgrounds/* -r
# sudo rm /usr/share/gnome-background-properties/*.xml

# mkdir images-temp

# echo "[INFO] Downloading backgrounds"

# images=(
#     https://github.com/foxt/macOS-Wallpapers/blob/master/Mojave%20Day.jpg?raw=true                                          
# )


# for i in "${!images[@]}"; do
#     url=${images[$i]}
#     echo $i $url
#     wget "$url" -O "images-temp/$i.jpg"
# done

# sudo mv images-temp /usr/share/backgrounds/kruceo

# echo "[INFO] Adding backgrounds to gnome background properties"

# for file in $(ls -1v /usr/share/backgrounds/kruceo); do
#     echo $file
#     echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"                       >  $file.xml
#     echo "<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">              " >> $file.xml
#     echo "<wallpapers>                                                    " >> $file.xml
#     echo "  <wallpaper>                                                   " >> $file.xml
#     echo "    <name>Wallpaper $file</name>                                " >> $file.xml
#     echo "    <filename>/usr/share/backgrounds/kruceo/$file</filename>    " >> $file.xml
#     echo "    <options>zoom</options>                                     " >> $file.xml
#     echo "    <pcolor>#000000</pcolor>                                    " >> $file.xml
#     echo "    <scolor>#000000</scolor>                                    " >> $file.xml
#     echo "    <shade_type>solid</shade_type>                              " >> $file.xml
#     echo "  </wallpaper>                                                  " >> $file.xml
#     echo "</wallpapers>                                                   " >> $file.xml
#     sudo mv $file.xml /usr/share/gnome-background-properties/kruceo.$file.xml 
# done

# gsettings set org.gnome.desktop.background picture-uri "'file:///usr/share/backgrounds/kruceo/1.jpg'"
# gsettings set org.gnome.desktop.background picture-uri-dark "'file:///usr/share/backgrounds/kruceo/2.jpg'"

# echo "[INFO] Backgrounds update complete"