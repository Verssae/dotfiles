#!/usr/bin/env fish

# Set the PATH
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/bin

# Set other universal environment variables
set -U EDITOR nvim
set -U fish_greeting ""