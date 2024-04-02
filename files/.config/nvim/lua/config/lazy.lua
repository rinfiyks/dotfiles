local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local function check_and_update_background_periodically()
  local background_file = "/home/tom/.config/nvim/lua/config/background.vim"
  local last_modified = vim.fn.getftime(background_file)

  -- Assuming you use a global variable to store the last known modification time
  if vim.g.last_background_mod and last_modified ~= vim.g.last_background_mod and last_modified > 0 then
    vim.cmd("source " .. background_file)
    vim.g.last_background_mod = last_modified
  end
end

-- Set a global variable with the initial modification time
vim.g.last_background_mod = vim.fn.getftime("/home/tom/.config/nvim/lua/config/background.vim")

-- Set up a timer to check the background file every minute
vim.defer_fn(function()
  vim.fn.timer_start(1000, check_and_update_background_periodically, { ["repeat"] = -1 })
end, 0)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
