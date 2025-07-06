
local M = {}

function M.setup()
  -- Define the command to open Gemini in a vertical split
  vim.api.nvim_create_user_command('Gemini', function()
    require('gemini-nvim.terminal').open_gemini_in_split()
  end, {
    nargs = 0,
    desc = 'Open Gemini CLI in a vertical split',
  })
end

return M
