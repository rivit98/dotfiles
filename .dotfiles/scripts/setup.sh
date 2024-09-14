#!/usr/bin/env bash
set -e
set -x

sudo ./install_as_root.sh
./install_as_user.sh


# cleanup
apt-get autoremove -y
