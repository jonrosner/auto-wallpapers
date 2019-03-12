# Linux automatic Desktop Wallpaper Slideshow

This project showcases how to automatically download wallpapers from the web and set them as your desktop background image.

It was developed and tested only on Linux Mint 18.3 Sylvia. There is no guarantee if it will work on any other system.

## Dependencies

All dependencies are pre-installed on Ubuntu-based systems. If for some reason they are not pre-installed you can install them manually.

```bash
$ sudo apt-get update
$ sudo apt-get install curl zip unzip grep
```

## Installation

1. Clone the repository

```bash
$ git clone https://github.com/joroGER/auto-wallpapers.git
```

2. Move your current working directory into the newly cloned repository

3. Allow execution to the setup script and run it

```bash
$ sudo chmod +x setup.sh && ./setup.sh
[INFO] Cron job added.
```

4. Check your crontab if everything went OK

```bash
$ crontab -e
Edit this file to introduce tasks to be run by cron.
...
*/10 *    * * *   .../auto-wallpapers/download.sh

```

## Change frequency

To change the frequency of wallpaper changes simply change the frequency of the cron job with `crontab -e`

## Disclaimer

The website used to scrape the images does not belong to me. All images are royalty free stock images. If you find your image falsely being shown here as roalty free picture, feel free to contact me.
