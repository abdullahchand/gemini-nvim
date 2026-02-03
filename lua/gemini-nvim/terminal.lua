
local M = {}
local config = require('gemini-nvim.config')

function M.open_gemini_in_split()
  -- Get current configuration
  local conf = config.get_config()

  -- Create a new vertical split
  vim.cmd('vnew')

  local cmd
  if conf.use_gemini then
    -- Use Gemini CLI
    cmd = 'gemini'
  else
    -- Use Claude with Ollama
    if conf.use_ollama then
      -- Set OLLAMA_HOST environment variable and launch claude
      cmd = 'OLLAMA_HOST=' .. conf.ollama_host .. ' ollama launch claude --config'
    else
      -- Use Claude without Ollama (if other Claude model is available)
      cmd = 'claude'
    end
  end

  -- Open a terminal in the new split and run the configured command
  vim.fn.termopen(cmd)
end

return M
