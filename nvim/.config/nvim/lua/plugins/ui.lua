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
}
