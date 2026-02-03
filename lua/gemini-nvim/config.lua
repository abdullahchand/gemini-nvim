local M = {}

local config_dir = vim.fn.stdpath('data') .. '/gemini-nvim'
local config_file = config_dir .. '/config.json'

-- Create config directory if it doesn't exist
vim.fn.mkdir(config_dir, 'p')

-- Function to read configuration
function M.read_config()
  local file = io.open(config_file, 'r')
  if file then
    local content = file:read('*all')
    file:close()
    if content ~= '' then
      return vim.json.decode(content)
    end
  end
  return nil
end

-- Function to write configuration
function M.write_config(config)
  local file = io.open(config_file, 'w')
  if file then
    file:write(vim.json.encode(config))
    file:close()
  end
end

-- Function to get current configuration with defaults
function M.get_config()
  local config = M.read_config()
  if not config then
    return {
      use_gemini = true,
      use_ollama = false,
      ollama_host = 'http://localhost:11434'
    }
  end
  return config
end

-- Function to set configuration
function M.set_config(config)
  M.write_config(config)
end

-- Function to run first-time setup wizard
function M.run_setup_wizard()
  local config = M.read_config()

  if config then
    return config
  end

  -- First run wizard
  local choice = vim.fn.input('Would you like to use Gemini CLI or Claude Code? (gemini/claude): ')

  local new_config = {
    use_gemini = choice:lower() == 'gemini',
    use_ollama = false,
    ollama_host = 'http://localhost:11434'
  }

  if choice:lower() == 'claude' then
    local use_ollama = vim.fn.input('Would you like to use Ollama as your Claude model? (y/n): ')
    new_config.use_ollama = use_ollama:lower() == 'y' or use_ollama:lower() == 'yes'

    if new_config.use_ollama then
      local host = vim.fn.input('Enter Ollama host URL (default: http://localhost:11434): ')
      if host ~= '' then
        new_config.ollama_host = host
      end
    end
  end

  M.write_config(new_config)
  return new_config
end

-- Function to reset configuration
function M.reset_config()
  local file = io.open(config_file, 'w')
  if file then
    file:write(vim.json.encode({
      use_gemini = true,
      use_ollama = false,
      ollama_host = 'http://localhost:11434'
    }))
    file:close()
  end
end

return M