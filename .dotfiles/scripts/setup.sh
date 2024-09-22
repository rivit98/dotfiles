#!/usr/bin/env bash
set -e
set -x


sudo ./install_as_root.sh
./install_as_user.sh
./install_dotfiles.sh


echo "Common setup"
mkdir -p ~/.ssh

echo cleanup
sudo apt autoremove -y

echo Done, please reboot
