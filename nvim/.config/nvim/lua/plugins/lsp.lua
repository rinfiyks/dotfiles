return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim", opts = {} },
            "saghen/blink.cmp",
            "lukas-reineke/lsp-format.nvim",
        },
        opts = function(_, opts)
            opts.inlay_hints = {
                enabled = false,
            }
            opts.servers = {
                lua_ls = {},
            }
        end,
        config = function()
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

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

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

    -- {
    --     "neovim/nvim-lspconfig",
    --     opts = function(_, opts)
    --         opts.inlay_hints = {
    --             enabled = false,
    --         }
    --         opts.servers = {
    --             lua_ls = {},
    --         }
    --     end,
    -- },
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = {
            formatters_by_ft = {
                c = { "clangformat" },
                css = { "prettierd" },
                groovy = { "npm-groovy-lint" },
                javascript = { "prettierd" },
                json = { "jq" },
                lua = { "stylua" },
                scala = { "scalafmt" },
                typescript = { "prettierd" },
                svelte = { "prettierd" },
            },
            format_on_save = { timeout_ms = 3000, lsp_fallback = false },
            notify_on_error = true,
            formatters = {
                prettierd = {
                    condition = function()
                        local rp = vim.loop.fs_realpath
                        return rp(".prettierrc") or rp(".prettierrc.json")
                    end,
                },
            },
        },
    },
}
