#!/usr/bin/env bash
set -e

echo "Installing as user"


# https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

. "$HOME/.cargo/env"
cargo install bat difftastic eza pwninit ropr
