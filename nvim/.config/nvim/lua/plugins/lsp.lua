return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim", opts = {} },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lsp = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local border = {
                { "🭽", "FloatBorder" },
                { "▔", "FloatBorder" },
                { "🭾", "FloatBorder" },
                { "▕", "FloatBorder" },
                { "🭿", "FloatBorder" },
                { "▁", "FloatBorder" },
                { "🭼", "FloatBorder" },
                { "▏", "FloatBorder" },
            }

            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
            }
            require("lspconfig").myserver.setup({ handlers = handlers })

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            lsp.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                    },
                },
            })
            lsp.clangd.setup({ capabilities = capabilities })

            vim.keymap.set("n", "<leader>M", vim.diagnostic.open_float)
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist)

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { buffer = ev.buf })
                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = ev.buf })
                    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = ev.buf })
                    vim.keymap.set({ "n", "v" }, "<leader>C", vim.lsp.buf.code_action, { buffer = ev.buf })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf })
                    vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, { buffer = ev.buf })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
                    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = ev.buf })
                    vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, { buffer = ev.buf })
                end,
            })
        end,
    },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = {
            formatters_by_ft = {
                c = { "clangformat" },
                groovy = { "npm-groovy-lint" },
                javascript = { "prettierd" },
                lua = { "stylua" },
                scala = { "scalafmt" },
                typescript = { "prettierd" },
            },
            format_on_save = { timeout_ms = 3000, lsp_fallback = true },
            notify_on_error = true,
        },
    },
}
