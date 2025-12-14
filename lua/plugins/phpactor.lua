return
    {
        "gbprod/phpactor.nvim",
        ft = "php",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
            -- If the update/install notification doesn't show properly,
            -- you should also add here UI plugins like "folke/noice.nvim" or "stevearc/dressing.nvim"
        },
        opts = {
            lspconfig = {
                enabled = false, -- 実態がwindowsの改行コードでエラーになるため、language-serverはMasonを使用
            },
        },
    }
