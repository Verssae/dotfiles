return {
  -- 브라우저에서 실시간 마크다운 프리뷰 (<leader>cp 시작 / <leader>cP 종료)
  {
    "brianhuster/live-preview.nvim",
    cmd = { "LivePreview" },
    keys = {
      { "<leader>cp", "<cmd>LivePreview start<cr>", ft = "markdown", desc = "Markdown Preview (start)" },
      { "<leader>cP", "<cmd>LivePreview close<cr>", ft = "markdown", desc = "Markdown Preview (close)" },
    },
  },
  -- lang.markdown extra에 딸려오는 방치된 플러그인은 비활성화
  { "iamcco/markdown-preview.nvim", enabled = false },

  -- LazyVim은 render-markdown을 수수하게 꺼놓으므로(아이콘/체크박스 비활성) 다시 켠다
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        position = "inline", -- '#' 자리를 아이콘으로 대체
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        width = "full",
      },
      checkbox = { enabled = true },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
        language_name = true,
      },
    },
  },
}
