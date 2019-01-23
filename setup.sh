#!/bin/bash

# Run for first time
chmod +x $PWD/download.sh
./download.sh
gsettings set org.gnome.desktop.background picture-uri file://$PWD/current_wallpaper.jpg

# Add the cron job. Change interval here if wanted.
(crontab -l ; echo "*/10 *    * * *   $PWD/download.sh"$'\n') | crontab -
echo "[INFO] Cron job added. Check it using 'crontab -e'"
