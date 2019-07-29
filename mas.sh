#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Mac Appstore Apps
brew install mas
mas install 1176895641 # Install Spark by Readdle
