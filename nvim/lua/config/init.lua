require'colorizer'.setup()

require'diffview'.setup()
require('mini.indentscope').setup()
require('mini.cursorword').setup()
require'hop'.setup()

require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require('telescope').load_extension('media_files')


require 'config.bufferline'
require 'config.lualine'
require 'config.coc'
require 'config.packageinfo'
require 'config.wilder'
require 'config.fzflua'
require 'config.gitsigns'
require 'config.vista'
require 'config.blamer'
require 'config.nvim-tree'
require 'config.hlslens'
require 'config.zenmode'
require 'config.neoscroll'
require 'config.telekasten'



require("twilight").setup({
  context = 0,
  expand = {
    -- markdown
    "paragraph",
    "fenced_code_block",
    "list",
  }
})

-- require 'config.copilot'
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- require 'config.cmp'
-- require 'config.prettier'
require("onedarkpro").setup({
  highlights = {
    Comment = { italic = true },
    Directory = { bold = true },
    ErrorMsg = { italic = true, bold = true }
  },
  filetypes = {
    all = true
  }
})


    
require('CopilotChat').setup({
  opts = {
    show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
    debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
    disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
    language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
    -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
    -- temperature = 0.1,
  },
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  event = "VeryLazy",
  keys = {
    { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
    { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    {
      "<leader>ccT",
      "<cmd>CopilotChatVsplitToggle<cr>",
      desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
    },
    {
      "<leader>ccv",
      ":CopilotChatVisual ",
      mode = "x",
      desc = "CopilotChat - Open in vertical split",
    },
    {
      "<leader>ccx",
      ":CopilotChatInPlace<cr>",
      mode = "x",
      desc = "CopilotChat - Run in-place code",
    },
    {
      "<leader>ccf",
      "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
      desc = "CopilotChat - Fix diagnostic",
    },
    {
      "<leader>ccr",
      "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
      desc = "CopilotChat - Reset chat history and clear buffer",
    }
  },
})

