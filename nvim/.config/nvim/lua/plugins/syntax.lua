return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter").setup({})

            require("nvim-treesitter").install({
                "bash",
                "c",
                "css",
                "cpp",
                "groovy",
                "json",
                "lua",
                "luadoc",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "scala",
                "sql",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            })

            -- Highlighting and indentation are now core neovim features;
            -- enable them for any filetype that has a treesitter parser.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    if vim.treesitter.get_parser(ev.buf) then
                        vim.treesitter.start(ev.buf)
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = true,
                },
                move = {
                    set_jumps = true,
                },
            })

            local ts_select = require("nvim-treesitter-textobjects.select")
            vim.keymap.set({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "aa", function() ts_select.select_textobject("@parameter.outer", "textobjects") end)
            vim.keymap.set({ "x", "o" }, "ia", function() ts_select.select_textobject("@parameter.inner", "textobjects") end)

            local ts_move = require("nvim-treesitter-textobjects.move")
            vim.keymap.set({ "n", "x", "o" }, "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]F", function() ts_move.goto_next_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[f", function() ts_move.goto_previous_start("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[F", function() ts_move.goto_previous_end("@function.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]c", function() ts_move.goto_next_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "]C", function() ts_move.goto_next_end("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[c", function() ts_move.goto_previous_start("@class.outer", "textobjects") end)
            vim.keymap.set({ "n", "x", "o" }, "[C", function() ts_move.goto_previous_end("@class.outer", "textobjects") end)

            local ts_swap = require("nvim-treesitter-textobjects.swap")
            vim.keymap.set("n", "<leader>a", function() ts_swap.swap_next("@parameter.inner") end)
            vim.keymap.set("n", "<leader>A", function() ts_swap.swap_previous("@parameter.inner") end)
        end,
    },
}
