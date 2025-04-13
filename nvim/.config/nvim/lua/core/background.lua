local M = {}

M.background_file = vim.fn.expand("~/.config/nvim/lua/config/background.vim")
local fs_event = vim.loop.new_fs_event()

if fs_event then
    fs_event:start(M.background_file, {}, function(err, filename, events)
        if err then
            vim.notify("fs_event error: " .. err)
            return
        end
        vim.schedule(function() vim.cmd("source " .. M.background_file) end)
    end)
end

return M
