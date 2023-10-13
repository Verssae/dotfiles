# Verssae's dotfiles
My dotfiles for macOS

## Requirements
### Homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### iTerm2
```sh
brew install --cask iterm2
```

### Fish

```sh
brew tap homebrew/cask-fonts # only once
brew install font-fira-code-nerd-font fish exa starship
```

### NeoVim
Setup [NvChad](https://nvchad.com) :
```sh
brew install neovim ripgrep
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

### dotfiles
```sh
git clone https://github.com/Verssae/dotfiles.git
cd dotfiles
```

## Customization (dotfiles)
### Colors & Font
Open `iterm`, go `Preferences > Profile` and import color preset from `onehalfdark.itermcolors` and `FiraCode Nerd Font`.

### Init configurations
Set universal environment variables and generate symbolic links into `.config`
```sh
./init_config.fish
```

### copilot.vim

[NvChad + Copilot](https://github.com/NvChad/NvChad/issues/2020#issuecomment-1691652333)

```sh
ln -s ~/dotfiles/nvim/lua/custom ~/.config/nvim/lua/custom
```