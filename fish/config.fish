if status is-interactive
  if type -q nvim
    abbr -a vim nvim
  end

  starship init fish | source
end