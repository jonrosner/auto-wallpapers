#!/bin/bash
basename="$(dirname $0)"

# Create url
N=$(($RANDOM%172))
URL="https://wallpaperscraft.com/catalog/nature/3840x2400/page"$N

SITE_PATH=$basename/images_site
DECOMPRESSED_SITE_PATH=$basename/decompressed_site

# Download and unzip if neccesary
curl -s -o $SITE_PATH $URL
gunzip -c $SITE_PATH > $DECOMPRESSED_SITE_PATH
if [ $? -eq 0 ]; 
then
    F=$DECOMPRESSED_SITE_PATH
else
    F=$SITE_PATH
fi

# Parse out image urls
LINKS=$(grep -oP '(?<=wallpapers__image" src=").*(?=" alt)' $F)

# Remove temporary files
rm -rf $SITE_PATH
rm -rf $DECOMPRESSED_SITE_PATH

# Create random image url
N=$(($RANDOM%$(echo "$LINKS" | wc -w)))
IMGURL=$(echo $LINKS |
cut -d' ' -f$N |
rev |
cut -d'_' -f2- |
rev)_3840x2400.jpg

# Download new image and replace current wallpaper
curl -s -o $basename/wallpaper_dowload.jpg $IMGURL
mv $basename/wallpaper_dowload.jpg $basename/current_wallpaper.jpg


