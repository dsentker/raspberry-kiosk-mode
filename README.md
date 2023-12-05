# Raspberry Kiosk Mode

**Example for running an auto-starting webbrowser in kiosk mode on raspberry pi.**

## Pitfalls when using Raspberry PI as "Kiosk Mode" Runner

- Configuring autostart on Raspbian OS is tricky and varies from version to version. There are many examples on the
  internet, but most of them didn't work (for me).
- The correct flags for starting the Chromium browser are not well documented - you have to try out many settings until
  you find the right one.
- The autostart script for Chromium is not allowed to open Chrome immediately. This is because a wireless Internet
  connection takes some time to be ready - but by this time Chrome is already open and misses the Internet connection.

## Usage

Copy run_website.sh to `/usr/local/bin`. Make the file executable.

```bash
sudo chmod +x /usr/local/bin/run_website.sh
```

We need to advise Rasperry OS to run this shell script on start.

### Method 1: Using `.desktop` file
This method seems to be the most reliable. Copy the autostart.desktop file to `/etc/xdg/autostart`. You need root access
for that, so use the terminal for this task.

### Method 2: Using `LXDE-pi` autostart script
This method was working once, from time to time it will not run as expected. It is hard to debug why the script start 
fails.

Edit the autostart file to reference this script:

```bash
# Choose one of the following autostart files:
nano /etc/xdg/lxsession/LXDE-pi/autostart 
nano ~/.config/lxsession/LXDE-pi/autostart
```

Add the following line to execute the script:

```bash
# (Keep previous entries)
@bash /usr/local/bin/run_website.sh
```

## Chromium Command line switches

Edit run_website.sh to modify chromiums behaviour. Here is a good, but not complete list of
switches: https://peter.sh/experiments/chromium-command-line-switches/

For example, to run chrome in kiosk mode, change chromium startup to this:

```bash
# Run Chrome in kiosk mode
chromium --kiosk --autoplay-policy=no-user-gesture-required --incognito "$WEBSITE_URL"
```