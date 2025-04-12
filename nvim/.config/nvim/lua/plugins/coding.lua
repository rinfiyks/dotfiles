return {
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
    },
    {
        "folke/trouble.nvim",
        opts = {
            auto_close = true, -- auto close when there are no items
            -- auto_preview = true, -- automatically open preview when on an item
            auto_refresh = true, -- auto refresh when open
            modes = {
                cascade = {
                    mode = "diagnostics", -- inherit from diagnostics mode
                    auto_open = false, -- auto open when there are items
                    filter = function(items)
                        local severity = vim.diagnostic.severity.HINT
                        for _, item in ipairs(items) do
                            severity = math.min(severity, item.severity)
                        end
                        return vim.tbl_filter(function(item) return item.severity == severity end, items)
                    end,
                },
            },
        },
        keys = {
            { "<space>d", "<cmd>Trouble cascade toggle<cr>", desc = "Diagnostics (Trouble)" },
            {
                "<space><space>",
                "<cmd>Trouble cascade open focus=true<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
}
