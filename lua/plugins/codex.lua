return {
    "rhart92/codex.nvim",
    config = function()
        require("codex").setup({
            system_prompt = [[
                                You must always respond in Japanese.
                                You must correctly understand Japanese technical specifications.
                                When generating code, include Japanese comments.
                                Do not switch to English unless explicitly instructed.
                            ]]
        })
    end,
}
