#!/bin/bash

# Define the URL as a variable
WEBSITE_URL="https://google.com"

# Define time to wait for internet connection
SLEEP_TIME=10

function is_website_reachable() {
  if ping -q -c 1 -W 1 google.com > /dev/null; then
    return 0  # Website is reachable
  else
    return 1  # Website is not reachable
  fi
}

sleep $SLEEP_TIME

if is_website_reachable; then
  echo "Starting Chromium..."

  # Run Chrome in fullscreen mode, like if the user had pressed F11 right after startup
  chromium-browser --start-fullscreen --noerrdialogs --autoplay-policy=no-user-gesture-required --incognito "$WEBSITE_URL"

else
  echo "No network connection..."
  zenity --error --text="Check your network connection." --title="Network Error"
  # You can add additional logic here, such as retrying or other actions
fi
