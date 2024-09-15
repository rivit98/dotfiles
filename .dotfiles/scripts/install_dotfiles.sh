#!/usr/bin/env bash
set -e

echo "Installing dotfiles"


# git clone --bare https://github.com/rivit98/dotfiles.git $HOME/.dotfiles
function config {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup

if config checkout master; then
    cho "Checked out config."
else
    echo "Backing up pre-existing dot files."
    config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .config-backup/{}
fi
config checkout master
config config status.showUntrackedFiles no
