return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
  },
    -- バージョンが古いことによる最低限のエラー潰し
    config = function()
        local require_ok, laravel = pcall(require, "laravel")
        if not require_ok then
            return
        end

        laravel.setup()

        ------------------------------------------------------------------
        -- ① route_info の get() を安全ラップ（vim.iter に変な値が来ても落ちないように）
        ------------------------------------------------------------------
        do
            local view_ok, view_simple = pcall(require, "laravel.extensions.route_info.view_simple")
            if view_ok and type(view_simple) == "table" and type(view_simple.get) == "function" then
                local orig_get = view_simple.get

                view_simple.get = function(self, ...)
                    local get_ok, view_result = pcall(orig_get, self, ...)
                    if not get_ok then
                        return {}
                    end

                    if type(view_result) ~= "table" then
                        return {}
                    end

                    return view_result
                end
            end
        end

        ------------------------------------------------------------------
        -- ② Telescope の route プレビューを安全ラップ
        --    bad argument #1 to 'pairs' (table expected, got string) 対策
        ------------------------------------------------------------------
        do
            local preview_ok, preview = pcall(require, "laravel.pickers.common.preview")
            if preview_ok and type(preview) == "table" and type(preview.route) == "function" then
                local orig_route = preview.route

                preview.route = function(...)
                    local route_ok, route_res = pcall(orig_route, ...)
                    if not route_ok then
                        return
                    end
                    return route_res
                end
            end
        end
    end,}
