return {
    {
        "nvim-telescope/telescope.nvim",
        version = false, -- telescope did only one release, so use HEAD for now
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- customize ripgrep args
            require("telescope").setup({
                defaults = {
                    path_display = { truncate = 2 },
                },
            })
            local builtin = require("telescope.builtin")

            function SearchInCurrentDir()
                -- Get the current directory of the active buffer
                local current_dir = vim.fn.expand("%:p:h")
                -- Use Telescope's live_grep to search in the current directory
                builtin.live_grep({
                    search_dirs = { current_dir },
                })
            end

            vim.keymap.set(
                "n",
                "<leader>ff",
                "<cmd>lua require('telescope.builtin').find_files()<CR>",
                { desc = "Find files" }
            )
            vim.keymap.set(
                "n",
                "<leader>fF",
                "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
                { desc = "Find files (include hidden)" }
            )
            vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "diagnostics" })
            vim.keymap.set(
                "n",
                "<leader>fq",
                "<cmd>Telescope quickfix<cr>",
                { desc = "List items in the quickfix list" }
            )
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "List help tags" })
            vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "List marks" })
            vim.keymap.set(
                "n",
                "<leader>fcd",
                function() SearchInCurrentDir() end,
                { desc = "Search in current directory" }
            )
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            require("todo-comments").setup({})
            vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Search for TODOs" })
        end,
    },
}
