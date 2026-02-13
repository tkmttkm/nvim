-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.termguicolors    = true
opt.expandtab        = true
opt.tabstop          = 4
opt.shiftwidth       = 4
vim.g.autoformat     = false
vim.g.lazyvim_format = {
    format_on_save = {
        mode = "diff",
        lsp_fallback = false,
    },
}
vim.o.scrolloff     = 4 -- treesitter-contextの固定行表示のため
vim.o.sidescrolloff = 0

-- doge
vim.g.doge_doc_standard_php        = "phpdoc"
vim.g.doge_doc_standard_javascript = "jsdoc"

-- diffview
opt.diffopt:append("algorithm:patience")
opt.diffopt:append("linematch:60")
opt.diffopt:append("iblank")

-- codex
vim.env.PATH = vim.env.HOME .. "/.npm-global/bin:" .. vim.env.PATH
