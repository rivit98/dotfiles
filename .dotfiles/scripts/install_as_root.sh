#!/usr/bin/env bash
set -e

apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends $(awk '{print $1}' packages.txt)


# install chrome https://www.google.pl/intl/pl/chrome/
# this sets up apt repository for google chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && dpkg -i google-chrome-stable_current_amd64.deb && rm -f google-chrome-stable_current_amd64.deb


# https://www.sublimemerge.com/
# https://www.sublimetext.com/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list



# snaps
snap refresh
snap install dbeaver-ce
snap install code --classic
snap install nvim --classic
snap install rustup --classic
snap install firefox
snap install obsidian --classic
snap install onlyoffice-desktopeditors
snap install kubectl --classic
snap install go --classic
snap install pycharm-community --classic
snap install intellij-idea-community --classic
snap install rustrover --classic


# install rest
apt-get update
apt-get install -y sublime-text sublime-merge

rustup toolchain install stable