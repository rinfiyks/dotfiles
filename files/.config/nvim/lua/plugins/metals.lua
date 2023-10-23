return {

  -- scala lsp
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "scala", "sbt", "java" },
    -- stylua: ignore
    keys = {
      {'<leader>me', function() require "telescope".extensions.metals.commands() end, desc="Metals commands"},
      {'<leader>mc', function() require "metals".compile_cascade() end, desc="Metals compile cascade"},
    },
    config = function()
      local metals = require("metals")
      local config = metals.bare_config()

      config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        serverProperties = { "-Xmx3g" },
        serverVersion = "latest.snapshot",
      }

      config.init_options.statusBarProvider = "on"

      -- cmp integration
      config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "run",
            envFile = "${workspaceFolder}/.env",
          },
        },
      }
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
              "repl",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      })
      require("dap.ext.vscode").load_launchjs(nil, {})

      dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.notify("ev term")
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        vim.notify("ev ex")
      end

      config.on_attach = function(client, bufnr)
        metals.setup_dap()
        require("lsp-format").on_attach(client, bufnr)
      end

      -- Autocmd that will actually be in charge of starting the whole thing
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          metals.initialize_or_attach(config)
        end,
        group = nvim_metals_group,
      })
    end,
    require("config.dap.keymaps").setup(),
  },
}
