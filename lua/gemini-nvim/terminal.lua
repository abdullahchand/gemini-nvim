
local M = {}

function M.open_gemini_in_split()
  -- Create a new vertical split
  vim.cmd('vnew')

  -- Open a terminal in the new split and run the 'gemini' command
  vim.fn.termopen('gemini')
end

return M
