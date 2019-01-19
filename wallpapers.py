from urllib.request import urlopen
from urllib.request import urlretrieve
from bs4 import BeautifulSoup
from random import randint
from os import rename
from os import getcwd
from os import path
import zlib

CWD = getcwd()

# Get random url page
page_nr = randint(0, 172)
url = "https://wallpaperscraft.com/catalog/nature/3840x2400/page"+str(page_nr)

# Download it
response = urlopen(url)
html = ""

# If chunked read gzipped chunks
if response.info()["Transfer-Encoding"] == "chunked":
	d = zlib.decompressobj(16+zlib.MAX_WBITS)
	buffer = response.read(1000)
	while buffer:
        	outstr = d.decompress(buffer)
	        html += str(outstr)
	        buffer = response.read(1000)
else:
	html = str(response.read())

# Get the image and save it
soup = BeautifulSoup(html, "html.parser")
imgs = soup.findAll("img", {"class": "wallpapers__image"})
img_nr = randint(0, len(imgs))
url = imgs[img_nr]["src"]
img_url = url.split("_")[0:-1]
img_url += ["3840x2400.jpg"]
img_url = "_".join(img_url)
urlretrieve(img_url, path.join(CWD, "current_wallpaper_new.jpg"))
rename(path.join(CWD, "current_wallpaper_new.jpg"), path.join(CWD, "current_wallpaper.jpg"))

