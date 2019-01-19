# Linux Auto Wallpaper downloader

This project showcases how to automatically download wallpapers from the web and set them as your desktop background image.

It was developed and tested only on Linux Mint 18.3 Sylvia. There is no guarantee if it will work on any other system.

## Disclaimer

The website used in this project to download the wallpapers from is not owned by me, nor are the wallpapers.
It is just used to show the functionality and should be replaced with your own site :)

## Installation

1. Clone the repository

```bash
$ git clone https://github.com/joroGER/auto-wallpapers.git
```

2. Move your current working directory into the newly cloned repository

3. Make sure `python3` and `beautifulsoup4` are installed

```bash
$ which python3
/usr/bin/python3
$ python3 -c "import bs4" && echo $?
0
```

4. Allow execution to the setup script and run it

```bash
$ sudo chmod +x setup.sh && ./setup.sh
[INFO] Cron job added.
```

5. Check your crontab if everything went OK

```bash
$ crontab -e
Edit this file to introduce tasks to be run by cron.
...
*/10 *    * * *   .../auto-wallpaper/download.sh

```