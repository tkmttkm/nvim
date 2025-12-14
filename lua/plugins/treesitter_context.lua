return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,  -- 固定ヘッダの行数
      trim_scope = "outer",
      min_window_height = 0,
      multiline_threshold = 20,
      mode = "cursor",
      separator = "-", -- 上下の区切り線を表示
    })
  end,
}