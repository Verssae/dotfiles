#!/usr/bin/env fish

./set_env.fish

# Auto-backup
set CONFIG_BACKUP ~/.config_backup

mv ~/.config/fish/config.fish CONFIG_BACKUP/fish/config.fish
mv ~/.config/fish/functions CONFIG_BACKUP/fish/functions
mv ~/.config/starship.toml CONFIG_BACKUP/starship.toml

# Sync via creating symbolic links
ln -s fish/config.fish ~/.config/fish/config.fish
ln -s fish/functions ~/.config/fish/functions
ln -s starship.toml ~/.config/starship.toml