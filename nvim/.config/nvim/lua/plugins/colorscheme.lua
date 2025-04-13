return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local background = require("core.background")
            vim.cmd("source " .. background.background_file)
        end,
    },
}
