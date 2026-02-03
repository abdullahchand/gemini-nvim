
local M = {}
local config = require('gemini-nvim.config')

function M.setup()
  -- Run setup wizard if no config exists
  config.run_setup_wizard()

  -- Define the command to open Gemini in a vertical split
  vim.api.nvim_create_user_command('Gemini', function()
    require('gemini-nvim.terminal').open_gemini_in_split()
  end, {
    nargs = 0,
    desc = 'Open Gemini CLI in a vertical split',
  })

  -- Add command to reset configuration
  vim.api.nvim_create_user_command('GeminiResetConfig', function()
    config.reset_config()
    print('Gemini configuration reset to defaults')
  end, {
    nargs = 0,
    desc = 'Reset Gemini configuration to defaults',
  })
end

return M
