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
