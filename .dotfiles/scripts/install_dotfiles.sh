#!/usr/bin/env bash
set -e

echo "Installing dotfiles"


# git clone --bare https://github.com/rivit98/dotfiles.git $HOME/.dotfiles
function config {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

mkdir -p .config-backup
config checkout -f master
config config status.showUntrackedFiles no
config submodule init
config submodule update
