return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex = {
        filetypes = { "tex", "plaintex", "text" }, -- markdown を外す
      },
    },
  },
}
