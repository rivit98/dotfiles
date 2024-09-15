#!/usr/bin/env bash

git config --global --add safe.directory '*'
git clone --bare https://github.com/rivit98/dotfiles.git $HOME/.dotfiles

function config {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout master  -- scripts
chmod +x $HOME/.dotfiles/scripts/*.sh
