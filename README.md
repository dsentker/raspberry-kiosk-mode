# Raspberry Kiosk Mode
Example for running an auto-starting webbrowser in kiosk mode on raspberry pi.

## Usage
Copy run_website.sh to `/usr/local/bin`. Make the file executable.
```bash
sudo chmod +x /usr/local/bin/run_website.sh
```

Edit the autostart file to reference this script:

```bash
# Choose one of the following autostart files:
nano /etc/xdg/lxsession/LXDE-pi/autostart 
nano ~/.config/lxsession/LXDE-pi/autostart
```

Add the following line to execute the script:

```bash
# (Keep previous entries)
@/usr/local/bin/run_website.sh
```