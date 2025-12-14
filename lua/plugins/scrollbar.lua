return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
  },
  config = function()
    require("scrollbar").setup({
      handle = {
        color = "#5e81ac", -- 好きな色に変えてOK
      },
      marks = {
        Search = { color = "#bf616a" },
        Error = { color = "#bf616a" },
        Warn  = { color = "#d08770" },
        Info  = { color = "#88c0d0" },
        Hint  = { color = "#81a1c1" },
        Misc  = { color = "#b48ead" },
      },
    })

    -- hlslens を scroll バーに統合
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.gitsigns").setup()
  end,
}