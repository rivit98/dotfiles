#!/usr/bin/env bash
set -e

echo "Installing as user"

rustup toolchain install stable
cargo install bat difftastic eza pwninit ropr

# https://ohmyz.sh/
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


cat vscode-extensions.txt | xargs -L1 code --force --install-extension
