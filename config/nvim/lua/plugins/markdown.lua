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

  -- 프로젝트별 설정이 없을 때 사용자 전역 markdownlint 설정을 기본값으로 사용한다.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.expand("~/.markdownlint-cli2.yaml"), "-" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", vim.fn.expand("~/.markdownlint-cli2.yaml") },
        },
      },
    },
  },

  -- LazyVim은 render-markdown을 수수하게 꺼놓으므로(아이콘/체크박스 비활성) 다시 켠다
  {
    "MeanderingProgrammer/render-markdown.nvim",
    init = function()
      -- Maple Dark의 ColorColumn이 Normal과 같은 색이라 기본 코드 블록 배경이 보이지 않는다.
      local function set_code_highlights()
        vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#242426" })
        vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = "#242426" })
        vim.api.nvim_set_hl(0, "RenderMarkdownCodeInfo", { fg = "#8fc7ff", bg = "#242426", bold = true })
        vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = "#2a2a2b" })
      end

      set_code_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("maple_render_markdown", { clear = true }),
        callback = set_code_highlights,
      })
    end,
    opts = {
      heading = {
        position = "inline", -- '#' 자리를 아이콘으로 대체
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        width = "full",
      },
      checkbox = { enabled = true },
      code = {
        sign = false,
        width = "full",
        border = "thin",
        background_inset = 0,
        left_pad = 1,
        right_pad = 1,
        language_name = true,
      },
    },
  },
}
