return {
    "saghen/blink.cmp",
    dependencies = {
        "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name         = "copilot",
                    module       = "blink-cmp-copilot",
                    score_offset = 100, -- 他の候補より少し優先度を上げる
                    async        = true,
                },
            },
        },
    },
}
