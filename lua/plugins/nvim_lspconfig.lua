return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
    	psalm = false,
        ltex = {
        	filetypes = { "tex", "plaintex", "text" }, -- markdown を外す
        },
    },
  },
}
