return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = function(str) return str:sub(1, 1) end,
                        },
                    },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "g:metals_status" },
                    lualine_y = { "encoding", "fileformat", "filetype" },
                    lualine_z = { "progress", "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                options = { section_separators = "", component_separators = "" },
            })
        end,
    },
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function() require("bufferline").setup({}) end,
        keys = {
            {
                "H",
                ":BufferLineCyclePrev<cr>",
            },
            {
                "L",
                ":BufferLineCycleNext<cr>",
            },
            { "<M-h>", ":BufferLineMovePrev<cr>" },
            { "<M-l>", ":BufferLineMoveNext<cr>" },
            { "<leader>bg", ":bp|sp|bn|bd!<cr>" },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = "󰌵",
                    },
                },
            })
            require("neo-tree").setup({
                filesystem = {
                    group_empty_dirs = true,
                },
                view = {
                    adaptive_size = true,
                },
                window = {
                    position = "right",
                },
            })
        end,
        keys = {
            {
                "<leader>ee",
                ":Neotree toggle<CR>",
                desc = "Toggle Neo-tree",
            },
            {
                "<leader>eE",
                ":Neotree toggle position=current<CR>",
                desc = "Toggle Neo-tree in current window",
            },
            {
                "<leader>ef",
                ":Neotree reveal_file=%:p<CR>",
                desc = "Focus current file in Neo-tree",
            },
        },
    },
}
