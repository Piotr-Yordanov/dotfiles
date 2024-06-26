-- local configs = require("nvim-treesitter.configs")
-- configs.setup {
--   -- Add a language of your choice
--   ensure_installed = {"python", "lua", "java", "javascript", "typescript", 'tsx'},
--   sync_install = false,
--   ignore_install = { "" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true, -- false will disable the whole extension
--     disable = { "" }, -- list of language that will be disabled
--     additional_vim_regex_highlighting = true,
--   },
--   indent = { enable = true, disable = { "yaml" } },
--   rainbow = {
--     enable = true,
--     -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--     extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--     max_file_lines = nil, -- Do not enable for files with more than n lines, int
--     -- colors = {}, -- table of hex strings
--     -- termcolors = {} -- table of colour name strings
--   }
-- }
local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end
 
ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "fish",
    "json",
    "yaml",
    "javascript",
    "css",
    "html",
    "lua",
    "vim",
    "json5",
    "bash",
    "markdown",
    "dockerfile",
    "python",
    "typescript",
  },
  autotag = {
    enable = true,
  },
}
 
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
