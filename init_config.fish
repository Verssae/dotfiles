#!/usr/bin/env fish

./set_env.fish

# Sync via creating symbolic links
ln -s fish/config.fish ~/.config/fish/config.fish
ln -s fish/functions ~/.config/fish/functions
ln -s starship.toml ~/.config/starship.toml