# aliases
alias lua="lua5.1"
command -qv nvim && alias vim nvim

switch (uname)
  case Darwin or Linux
    source (dirname (status --current-filename))/config-osx.fish
end

set -gx EDITOR nvim

set -gx PATH $HOME/bin $PATH

# Rust
set -gx PATH $HOME/.cargo/bin $PATH

# Pyenv and virtualenv setting
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

starship init fish | source

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

