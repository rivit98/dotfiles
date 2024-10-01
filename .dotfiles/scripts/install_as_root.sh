#!/usr/bin/env bash
set -e

apt-get update
apt-get upgrade -y
apt-get install -y --no-install-recommends $(awk '{print $1}' packages.txt)


# install chrome https://www.google.pl/intl/pl/chrome/
# this sets up apt repository for google chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && dpkg -i google-chrome-stable_current_amd64.deb && rm -f google-chrome-stable_current_amd64.deb


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


update-alternatives --install /usr/bin/python python /usr/bin/python3 1

