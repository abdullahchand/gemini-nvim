# gemini-nvim

A Neovim plugin to interact with the Gemini CLI in a vertical split.

## Installation

Use your favorite plugin manager to install.

### lazy.nvim

```lua
{
  'abdullahchand/gemini-nvim',
  config = function()
    require('gemini-nvim').setup()
  end,
}
```

## Usage

After installation, you can use the following command to open the Gemini CLI in a new vertical split:

```
:Gemini
```

## Features

- **Gemini CLI support**: Default mode that runs the `gemini` command
- **Claude Code support**: Enhanced mode that can use Claude with Ollama integration
- **Configuration wizard**: First-time setup to choose between Gemini CLI and Claude Code
- **Ollama integration**: When using Claude, you can configure Ollama as the model provider
- **Configuration reset**: Reset to default settings with `:GeminiResetConfig`

## Configuration

On first run, the plugin will prompt you to choose:
1. Whether to use Gemini CLI or Claude Code
2. If Claude is selected, whether to use Ollama as the model
3. If Ollama is selected, the host URL to connect to

You can reset your configuration at any time using the `:GeminiResetConfig` command.
