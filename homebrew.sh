#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install gnu-sed --with-default-names
brew install zsh

sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh

brew install wget

brew install python3

brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

brew install neovim
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vi

brew install direnv

brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install reattach-to-user-namespace
brew install tmux

# ChunkWM
brew tap koekeishiya/formulae
brew install chunkwm
brew install skhd

brew install fzf

brew install overmind

brew install ag
brew install hub
brew install git
brew install exa
brew install pkg-config libffi

brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

brew install rustup

brew tap heroku/brew
brew install heroku
heroku update

brew install nodenv
brew install yarn

brew install postgres
brew install pgcli
brew install redis
brew install elasticsearch

brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" kitty
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" android-studio
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" keepassxc
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" viscosity
brew cask install --appdir="/Applications" reactotron
