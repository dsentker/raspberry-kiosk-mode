#!/bin/bash

sleep 11  # Add a delay if needed

function is_website_reachable() {
  if ping -q -c 1 -W 1 google.com > /dev/null; then
    return 0  # Website is reachable
  else
    return 1  # Website is not reachable
  fi
}

if is_website_reachable; then
  echo "Starting Chromium..."
  chromium-browser --kiosk --incognito https://app.modelmanager.net/public/qms?c=82
else
  echo "No network connection..."
  # You can add additional logic here, such as retrying or other actions
fi
