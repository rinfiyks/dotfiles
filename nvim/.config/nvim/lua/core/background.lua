local M = {}

M.background_file = "~/.config/nvim/lua/config/background.vim"

local function check_and_update_background_periodically()
    local last_modified = vim.fn.getftime(M.background_file)

    -- Assuming you use a global variable to store the last known modification time
    if vim.g.last_background_mod and last_modified ~= vim.g.last_background_mod and last_modified > 0 then
        vim.cmd("source " .. M.background_file)
        vim.g.last_background_mod = last_modified
    end
end

-- Set a global variable with the initial modification time
vim.g.last_background_mod = vim.fn.getftime(M.background_file)

-- Set up a timer to check the background file every second
vim.defer_fn(function() vim.fn.timer_start(1000, check_and_update_background_periodically, { ["repeat"] = -1 }) end, 0)

return M
