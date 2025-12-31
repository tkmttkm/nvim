-- ~/.config/nvim/lua/plugins/dap.lua
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
        ----------------------------------------------------------------------
        -- Mason + DAP
        ----------------------------------------------------------------------
        require("mason-nvim-dap").setup({
            ensure_installed = { "php-debug-adapter" },
            automatic_installation = true,
            handlers = {},
        })

        require("nvim-dap-virtual-text").setup({
            enabled                     = true,
            enabled_commands            = true,
            highlight_changed_variables = true,
            highlight_new_as_changed    = true,
            show_stop_reason            = true,
            commented                   = false,
        })

        local dapui = require("dapui")
        dapui.setup()

        local dap = require("dap")
        -- デバッグ開始/終了時に UI 自動開閉
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        ----------------------------------------------------------------------
        -- PHP 用アダプタ設定
        -- Mason が使う標準パスを「直指定」する方式に変更
        ----------------------------------------------------------------------
        -- stdpath("data") = ~/.local/share/nvim
        local php_debug_path = vim.fn.stdpath("data")
        .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"

        dap.adapters.php = {
            type    = "executable",
            command = "node",
            args    = { php_debug_path },
        }

        ----------------------------------------------------------------------
        -- PHP 用デバッグ設定
        ----------------------------------------------------------------------
        dap.configurations.php = {
            {
                name = "Listen for Xdebug (Docker)",
                type = "php",
                request = "launch",
                port = 9003,
                pathMappings = {
                    ["/var/www/html"] = vim.fn.getcwd(),
                },
            },
        }
    end,
}
