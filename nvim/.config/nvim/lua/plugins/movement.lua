return {
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = function()
            local harpoon = require("harpoon")
            return {
                { "<leader>xx", function() harpoon:list():add() end },
                { "<leader>xa", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
                { "<leader>1", function() harpoon:list():select(1) end },
                { "<leader>2", function() harpoon:list():select(2) end },
                { "<leader>3", function() harpoon:list():select(3) end },
                { "<leader>4", function() harpoon:list():select(4) end },
                { "<leader>5", function() harpoon:list():select(5) end },
                { "<leader>6", function() harpoon:list():select(6) end },
                { "<leader>7", function() harpoon:list():select(7) end },
                { "<leader>8", function() harpoon:list():select(8) end },
                { "<leader>9", function() harpoon:list():select(9) end },
                { "<leader>0", function() harpoon:list():select(10) end },
            }
        end,
        opts = { settings = { save_on_toggle = true } },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search",
            },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
}
