return {
  -- Maple 테마 (subframe7536/vscode-theme-maple의 nvim 포트)
  -- kitty도 같은 팔레트의 Maple Dark 테마를 사용 (~/.config/kitty/current-theme.conf)
  {
    "abhilash26/mapledark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mapledark",
    },
  },
}
