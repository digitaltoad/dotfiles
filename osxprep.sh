#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "--------------------------"
echo "Updating OSX. IF this requires a restart, run the script again."

sudo softwareupdate -ia --verbose

echo "--------------------------"
echo "Installing Xcode Command Line Tools."

xcode-select --install
