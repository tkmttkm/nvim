-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local api = vim.api

-- 前後の空白除去
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- 全角空白強調表示
api.nvim_set_hl(0, "ZenkakuSpace", { bg = "#3b3b3b" })
vim.fn.matchadd("ZenkakuSpace", "　\\+")

-- 改行時のコメントの自動挿入を無効化
api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- コメント設定
api.nvim_create_autocmd("FileType", {
    pattern = { "blade", "blade.php" },
    callback = function()
        vim.bo.commentstring = "{{-- %s --}}"
    end,
})

-- markdownの日本語チェックをオフ
api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- diffview
api.nvim_set_hl(0, "DiffviewDiffAdd", { bg = "#003300" })
api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "#330000" })
api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#002244" })
api.nvim_set_hl(0, "DiffviewDiffText", { bg = "#004488" })

-- blink cmp copilot ghost text
api.nvim_set_hl(0, "BlinkCmpGhostText", {
  fg = "#5f87ff",
  italic = true,
})

-- dap
local dap_colors = {
    breakpoint_fg = "#FF5F5F",
    breakpoint_bg = "#3C1F1F",
    stopped_fg    = "#5FD7FF",
    stopped_bg    = "#0F2F40",
}
api.nvim_set_hl(0, "DapBreakpoint",         { fg = dap_colors.breakpoint_fg, bold = true })
api.nvim_set_hl(0, "DapBreakpointLine",     { bg = dap_colors.breakpoint_bg })
api.nvim_set_hl(0, "DapBreakpointRejected", { fg = dap_colors.breakpoint_fg })
api.nvim_set_hl(0, "DapStopped",            { fg = dap_colors.stopped_fg, bold = true })
api.nvim_set_hl(0, "DapStoppedLine",        { bg = dap_colors.stopped_bg })
vim.fn.sign_define("DapBreakpoint", {
    text   = "",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpointLine",
    numhl  = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
    text   = "",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpointLine",
    numhl  = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text   = "",
    texthl = "DapBreakpointRejected",
    linehl = "DapBreakpointLine",
    numhl  = "DapBreakpointRejected",
})
vim.fn.sign_define("DapStopped", {
    text   = "",
    texthl = "DapStopped",
    linehl = "DapStoppedLine",
    numhl  = "DapStopped",
})
