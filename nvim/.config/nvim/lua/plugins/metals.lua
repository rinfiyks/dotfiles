return {
    {
        "scalameta/nvim-metals",
        ft = { "scala", "sbt", "java" },
        keys = {
            {
                "<leader>me",
                function() require("telescope").extensions.metals.commands() end,
                desc = "Metals commands",
            },
            { "<leader>mc", function() require("metals").compile_cascade() end, desc = "Metals compile cascade" },
            { mode = "v", "K", function() require("metals").type_of_range() end, desc = "Metals type of range" },
        },
        config = function()
            local metals = require("metals")
            local config = metals.bare_config()

            config.init_options.statusBarProvider = "on"
            config.settings = {
                showImplicitArguments = true,
                excludedPackages = { "akka.actor.typed.javadsl" },
                serverProperties = { "-Xmx3g" },
                serverVersion = "latest.snapshot",
            }

            config.capabilities = require("blink.cmp").get_lsp_capabilities()

            config.on_attach = function(client, bufnr)
                vim.keymap.set("n", "<Esc>", function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local cfg = vim.api.nvim_win_get_config(win)
                        if cfg.relative and cfg.relative ~= "" then vim.api.nvim_win_close(win, true) end
                    end
                end, {
                    buffer = bufnr,
                    silent = true,
                    desc = "Close any floating LSP window",
                })
            end

            -- Autocmd that will actually be in charge of starting the whole thing
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala", "sbt", "java" },
                callback = function() metals.initialize_or_attach(config) end,
                group = nvim_metals_group,
            })
        end,
    },
}
