-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map       = vim.keymap.set
local which_key = require("which-key")

-- ターミナルモード
-- map("t", "<Esc>", [[<C-\><C-n>]])

-- ヴィジュアルモード
map("x", "<A-Down>",   ":move '>+1<CR>gv", { noremap = true, silent = true })
map("x", "<A-Up>",     ":move '<-2<CR>gv", { noremap = true, silent = true })
map("x", "<C-A-Down>", ":t '><CR>gv",      { noremap = true, silent = true })
map("x", "<C-A-Up>",   ":t '<-1<CR>gv",    { noremap = true, silent = true })
map("x", "<C-p>",      "\"0p",             { noremap = true, silent = true, desc = "Paste Last Yank" })

-- ノーマルモード
map("n",                    "<A-Down>",     ":m .+1<CR>==",                                                   { noremap = true, silent = true })
map("n",                    "<A-Up>",       ":m .-2<CR>==",                                                   { noremap = true, silent = true })
map("n",                    "<C-A-Down>",   ":t .<CR>",                                                       { noremap = true, silent = true })
map("n",                    "<C-A-Up>",     ":t -1<CR>",                                                      { noremap = true, silent = true })
-- map("n",                    "<C-w>c",       ":bd<CR>",                                                        { noremap = true, silent = true })
map("n",                    "<C-p>",        "\"0p",                                                           { noremap = true, silent = true })
map("n",                    "<C-PageDown>", ":bnext<CR>",                                                     { noremap = true, silent = true })
map("n",                    "<C-PageUp>",   ":bprevious<CR>",                                                 { noremap = true, silent = true })
map("n",                    "<A-Left>",     "<C-o>",                                                          { noremap = true, silent = true })
map("n",                    "<A-Right>",    "<C-i>",                                                          { noremap = true, silent = true })
which_key.add({"<leader>/", group = "grep"})
map("n",                    "<leader>/g",   function() Snacks.picker.grep() end,                              { desc = "Snacks grep" })
map("n",                    "<leader>/G",   function() Snacks.picker.grep({ cwd = vim.fn.getcwd() }) end,     { desc = "Snacks grep(cwd)" })
map("n",                    "<leader>/s",   ":Telescope grep_string<CR>",                                     { desc = "Telescope grep_string" })
which_key.add({"<leader>S", group = "Snacks"})
map("n", "<leader>Sc", function() Snacks.picker.explorer({cwd = vim.fn.stdpath("config")}) end, { desc = "Open Nvim Config Dir" })
which_key.add({"<leader><Space>", group = "Set"})
which_key.add({"<leader><Space>e", group = "Encoding"})
which_key.add({"<leader><Space>es", group = "Save"})
map("n", "<leader><Space>ess", function()
    vim.bo.fileencoding = "cp932"
    vim.cmd("write ++enc=cp932")
end, { desc = "Shift-JIS (CP932)" })
map("n", "<leader><Space>esu", function()
    vim.bo.fileencoding = "utf-8"
    vim.cmd("write ++enc=utf-8")
end, { desc = "UTF-8" })
map("n", "<leader><Space>eS", function()
    local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding) or vim.o.encoding
    local ff  = vim.bo.fileformat
    vim.notify("fileencoding=" .. enc .. " fileformat=" .. ff, vim.log.levels.INFO, { title= "Encoding" })
end, { desc = "Show current fileencoding" })
which_key.add({"<leader><Space>er", group = "Reload"})
map("n", "<leader><Space>eru", function()
    vim.cmd("e ++enc=utf-8")
end, { desc = "UTF-8" })
map("n", "<leader><Space>ers", function()
    vim.cmd("e ++enc=cp932")
end, { desc = "Shift-JIS (CP932)" })

-- インサートモード
map("i", "<A-Down>",   "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
map("i", "<A-Up>",     "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
map("i", "<C-A-Down>", "<Esc>:t .<CR>gi",     { noremap = true, silent = true })
map("i", "<C-A-Up>",   "<Esc>:t -1<CR>gi",    { noremap = true, silent = true })
map("i", "<C-p>",      "<Esc>\"0p<CR>gi",     { noremap = true, silent = true })

-- gitgraph
map("n", "<leader>gl", function() require('gitgraph').draw({}, { all = true, max_count = 5000 }) end, {desc = "GitGraph - Draw"})

-- Telescope
map("n", "<leader>//",   ":Telescope live_grep<CR>",   { desc = "Telescope live_grep" })
map("n", "<leader>/s",   ":Telescope grep_string<CR>", { desc = "Telescope grep_string" })

-- lazygit
if vim.fn.executable("lazygit") == 1 then
    map("n", "<leader>gg", function() Snacks.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
    map("n", "<leader>gG", function() Snacks.lazygit() end,                             { desc = "Lazygit (cwd)" })
end

-- accelerated-jk
map("n", "j",      "<Plug>(accelerated_jk_j)", { noremap = true, silent = true })
map("n", "<Down>", "<Plug>(accelerated_jk_j)", { noremap = true, silent = true })
map("n", "k",      "<Plug>(accelerated_jk_k)", { noremap = true, silent = true })
map("n", "<Up>",   "<Plug>(accelerated_jk_k)", { noremap = true, silent = true })

-- diffview
map("n", "<leader>gd", ":DiffviewOpen<CR>",       { desc = "DiffView" })
map("n", "<leader>gD", ":DiffviewClose<CR>",      { desc = "Close DiffView" })
map("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Gitsigns Blame"})

-- markdown-preview
which_key.add({"<leader>m", group = "Markdown"})
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Preview"})
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>",   { desc = "Stop Preview"})

-- phpactor
which_key.add({"<leader>p", group = "Php"})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function(ev)
    local buf = ev.buf
    which_key.add({"<leader>pa", group = "PhpActor"})
    map("n", "<leader>pac", "<cmd>PhpActor import_class<CR>", {
      buffer = buf,
      desc = "Import class (カーソル位置)",
    })
    map("n", "<leader>paC", "<cmd>PhpActor import_missing_classes<CR>", {
      buffer = buf,
      desc = "Import missing classes (未インポート全部)",
    })
    map("n", "<leader>pa?", "<cmd>PhpActor context_menu<CR>", {
      buffer = buf,
      desc = "Context menu",
    })
    map("n", "<leader>pan", "<cmd>PhpActor new_class<CR>", {
      buffer = buf,
      desc = "Create new class",
    })
    map("n", "<leader>pam", "<cmd>PhpActor move_class<CR>", {
      buffer = buf,
      desc = "Move class (ファイル移動 + namespace 修正)",
    })
    map("n", "<leader>pax", "<cmd>PhpActor expand_class<CR>", {
      buffer = buf,
      desc = "Expand class skeleton",
    })
    map("n", "<leader>paa", "<cmd>PhpActor generate_accessor<CR>", {
      buffer = buf,
      desc = "Generate accessor (getter/setter)",
    })
    map("n", "<leader>pav", "<cmd>PhpActor change_visibility<CR>", {
      buffer = buf,
      desc = "Change visibility (public/private/protected)",
    })
    map("n", "<leader>pat", "<cmd>PhpActor transform<CR>", {
      buffer = buf,
      desc = "Transform (refactor menu)",
    })
    map("n", "<leader>paN", "<cmd>PhpActor navigate<CR>", {
      buffer = buf,
      desc = "Navigate class tree",
    })
    map("n", "<leader>pas", "<cmd>PhpActor status<CR>", {
      buffer = buf,
      desc = "Status",
    })
    map("n", "<leader>paS", "<cmd>PhpActor lsp/status<CR>", {
      buffer = buf,
      desc = "LSP status",
    })
    map("n", "<leader>paR", "<cmd>PhpActor lsp/reindex<CR>", {
      buffer = buf,
      desc = "Reindex project (重い)",
    })
    map("n", "<leader>paK", "<cmd>PhpActor cache_clear<CR>", {
      buffer = buf,
      desc = "Clear PhpActor cache",
    })
    map("n", "<leader>paf", "<cmd>PhpActor copy_fcqn<CR>", {
      buffer = buf,
      desc = "Copy FQCN (完全修飾クラス名)",
    })
    map("n", "<leader>paU", "<cmd>PhpActor update<CR>", {
      buffer = buf,
      desc = "Update PhpActor",
    })
    map("n", "<leader>paO", "<cmd>PhpActor config<CR>", {
      buffer = buf,
      desc = "Open PhpActor config",
    })
  end,
})

-- codex
which_key.add({"<leader>C", group = "Codex"})
map("n", "<leader>Cc", require("codex").toggle,                 { desc = "Codex: Toggle" })
map("v", "<leader>Cs", require("codex").actions.send_selection, { desc = "Codex: Send selection" })

-- oil
-- map("n", "<leader>e", function()
--   require("oil").open()
-- end, { desc = "Oil (current dir)" })
-- map("n", "<leader>E", function()
--   require("oil").open(vim.fn.getcwd())
-- end, { desc = "Oil (cwd)" })
-- map("n", "<leader>oe", function()
--   require("oil").open()
-- end, { desc = "Explorer (current dir)" })
-- map("n", "<leader>oE", function()
--   require("oil").open(vim.fn.getcwd())
-- end, { desc = "Explorer (cwd)" })
-- which_key.add({"<leader>o", group = "Oil"})
-- map("n", "<leader>oc", function()
--   require("oil").open(vim.fn.stdpath("config"))
-- end, { desc = "Open Nvim Config Dir" })

-- goto-preview
which_key.add({"<leader>G", group = "Preview"})
local preview_ok, gp = pcall(require, "goto-preview")
if preview_ok then
    map("n", "<leader>Gp", function()
        gp.goto_preview_definition()
    end, { desc = "Go to Preview" })

    map("n", "<leader>GP", function()
        gp.close_all_win()
    end, { desc = "Close Preview" })
end

-- doge
which_key.add({"<leader>D", group = "doge"})
map("n", "<leader>Dg", ":DogeGenerate<CR>",                  {desc = "Generate doc comment"})
map('n', '<leader>Df', '<Plug>(doge-comment-jump-forward)',  {desc = "Jump Forward in doc comment"})
map('n', '<leader>Db', '<Plug>(doge-comment-jump-backward)', {desc = "Jump Backward in doc comment"})

-- translate
which_key.add({"<leader>t", group = "Translate"})
map("n", "<leader>te", "<cmd>Translate EN<CR>", {desc = "JP → EN 翻訳"})
which_key.add({"<leader>tE", group = "JP → EN"})
map("n", "<leader>tEc", "<cmd>Translate EN -output=register<CR>", {desc = "JP → EN コピー"})
map("n", "<leader>tEp", "<cmd>Translate EN -output=replace<CR>",  {desc = "JP → EN 置換"})
map("n", "<leader>tj",  "<cmd>Translate JA<CR>",                  {desc = "EN → JA 翻訳"})
which_key.add({"<leader>tJ", group = "EN → JP"})
map("n", "<leader>tJc", "<cmd>Translate JA -output=register<CR>", {desc = "EN → JA コピー"})
map("n", "<leader>tJp", "<cmd>Translate JA -output=replace<CR>",  {desc = "EN → JA 置換"})
map("n", "<leader>tp",  "\"\"p",                                  {desc = "翻訳結果ペースト"})
map("x", "<leader>te",  "<cmd>Translate EN<CR>",                  {desc = "JP → EN 翻訳"})
map("x", "<leader>tEc", "<cmd>Translate EN -output=register<CR>", {desc = "JP → EN コピー"})
map("x", "<leader>tEp", "<cmd>Translate EN -output=replace<CR>",  {desc = "JP → EN 置換"})
map("x", "<leader>tj",  "<cmd>Translate JA<CR>",                  {desc = "EN → JA 翻訳"})
map("x", "<leader>tJc", "<cmd>Translate JA -output=register<CR>", {desc = "EN → JA コピー"})
map("x", "<leader>tJp", "<cmd>Translate JA -output=replace<CR>",  {desc = "EN → JA 置換"})
map("x", "<leader>tp",  "\"\"p",                                  {desc = "翻訳結果ペースト"})

-- transparent
which_key.add({"<leader>T", group = "Transparent"})
map("n", "<leader>Tt", ":TransparentToggle<CR>", { desc = "Toggle Transparency" })


-- mini.files
-- which_key.add({"<leader>m", group = "Mini"})
-- map("n", "<leader>mf", function()
--   require("mini.files").open()
-- end, { desc = "Files" })

-- dap
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
    map("n", "<F5>", function()
        dap.continue()
    end, { noremap = true, silent = true })

    map("n", "<F6>", function()
        dap.terminate()
    end, { noremap = true, silent = true })

    map("n", "<F9>", function()
        dap.toggle_breakpoint()
    end, { noremap = true, silent = true })

    map("n", "<F10>", function()
        dap.step_over()
    end, { noremap = true, silent = true })

    map("n", "<F11>", function()
        dap.step_into()
    end, { noremap = true, silent = true })

    map("n", "<F12>", function()
        dap.step_out()
    end, { noremap = true, silent = true })
end

local dapui_ok, dapui = pcall(require, "dapui")
if dapui_ok then
    map("n", "<leader>du", function()
        dapui.toggle()
    end, { noremap = true, silent = true, desc = "Toggle DAP UI" })
end

-- laravel
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function(ev)
        which_key.add({"<leader>L", group = "Laravel"})
        map("n", "<leader>Ll", function() Laravel.pickers.laravel() end,              {desc = "Laravel: Open Laravel Picker"} )
        map("n", "<c-g>",      function() Laravel.commands.run("view:finder") end,    {desc = "Laravel: Open View Finder"} )
        map("n", "<leader>La", function() Laravel.pickers.artisan() end,              {desc = "Laravel: Open Artisan Picker"} )
        map("n", "<leader>Lt", function() Laravel.commands.run("actions") end,        {desc = "Laravel: Open Actions Picker"} )
        map("n", "<leader>Lr", function() Laravel.pickers.routes() end,               {desc = "Laravel: Open Routes Picker"} )
        map("n", "<leader>Lh", function() Laravel.run("artisan docs") end,            {desc = "Laravel: Open Documentation"} )
        map("n", "<leader>Lm", function() Laravel.pickers.make() end,                 {desc = "Laravel: Open Make Picker"} )
        map("n", "<leader>Lc", function() Laravel.pickers.commands() end,             {desc = "Laravel: Open Commands Picker"} )
        map("n", "<leader>Lo", function() Laravel.pickers.resources() end,            {desc = "Laravel: Open Resources Picker"} )
        map("n", "<leader>Lp", function() Laravel.commands.run("command_center") end, {desc = "Laravel: Open Command Center"} )
        map("n", "gf", function()
            local laravel_gf_ok, laravel_gf_res = pcall(function()
                if Laravel.app("gf").cursorOnResource() then
                    return "<cmd>lua Laravel.commands.run('gf')<cr>"
                end
            end)
            if not laravel_gf_ok or not laravel_gf_res then
                return "gf"
            end
            return laravel_gf_res
        end,
            {
                expr = true,
                noremap = true,
                silent = true,
                desc = "Laravel-aware gf",
            })
    end,
})

-- ===========================
-- Mermaid PNG / PDF 出力
-- ===========================
which_key.add({"<leader>mM", group = "Mermaid"})
which_key.add({"<leader>mMC", group = "Create"})
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "mermaid" },
    callback = function()
        map("n", "<leader>mMCp", function()
            local input = vim.fn.expand("%:p")
            local output = vim.fn.expand("%:p:r") .. ".png"
            local cmd = { "mmdc", "-i", input, "-o", output }
            vim.fn.jobstart(cmd, {
                on_exit = function(_, code)
                    if code == 0 then
                        print("✔ PNG exported: " .. output)
                    else
                        print("✖ PNG export failed")
                    end
                end,
            })
        end, { buffer = true, desc = "Mermaid → PNG" })

        map("n", "<leader>mMCP", function()
            local input = vim.fn.expand("%:p")
            local output = vim.fn.expand("%:p:r") .. ".pdf"
            local cmd = { "mmdc", "-i", input, "-o", output }
            vim.fn.jobstart(cmd, {
                on_exit = function(_, code)
                    if code == 0 then
                        print("✔ PDF exported: " .. output)
                    else
                        print("✖ PDF export failed")
                    end
                end,
            })
        end, { buffer = true, desc = "Mermaid → PDF" })
    end,
})
which_key.add({"<leader>mC", group = "Create"})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        local buf = ev.buf

        map("n", "<leader>mCP", function()
            local input = vim.api.nvim_buf_get_name(buf)
            if input == "" then
                print("このバッファにはファイル名がありません")
                return
            end

            local output = vim.fn.fnamemodify(input, ":r") .. ".pdf"

            if vim.fn.executable("md-to-pdf") == 0 then
                print("md-to-pdf が見つかりません（PATH 問題）")
                return
            end

            ---------------------------------------------------
            -- ▼ プロジェクトごとに CSS を探す（無ければ nil）
            ---------------------------------------------------
            local function find_project_root(path)
                return vim.fs.root(path, {
                    ".git", "package.json", "composer.json", "README.md",
                })
            end

            local root = find_project_root(input)
            local css = nil

            if root then
                local maybe_css = root .. "/markdown_pdf.css"
                if vim.loop.fs_stat(maybe_css) then
                    css = maybe_css
                end
            end
            ---------------------------------------------------

            -- コマンド組み立て
            local cmd = { "md-to-pdf", input }
            if css then
                table.insert(cmd, "--stylesheet")
                table.insert(cmd, css)
            end

            local result = vim.fn.system(cmd)

            if vim.v.shell_error == 0 then
                print("✔ Markdown → PDF 成功: " .. output)
            else
                print("✖ Markdown → PDF 失敗:\n" .. result)
            end
        end, { buffer = buf, desc = "Markdown → PDF" })
    end,
})
