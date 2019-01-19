#!/bin/bash

# Check if python is installed
python3 -c "import bs4"
if [[ $? -ne 0 ]]
then
	echo "[ERROR] Python or Beautifulsoup is not installed correctly. Please install."
	exit 1
fi

# Run for first time
chmod +x $PWD/download.sh
./download.sh
gsettings set org.gnome.desktop.background picture-uri file://$PWD/current_wallpaper.jpg

# Add the cron job. Change interval here if wanted.
(crontab -l ; echo "*/10 *    * * *   $PWD/download.sh") | crontab -
echo "[INFO] Cron job added."
