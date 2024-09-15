#!/usr/bin/env bash

git config --global --add safe.directory '*'
git clone --bare https://github.com/rivit98/dotfiles.git $HOME/.dotfiles
# chmod +x $HOME/.dotfiles/scripts/*.sh
