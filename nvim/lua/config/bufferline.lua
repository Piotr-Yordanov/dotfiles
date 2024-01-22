vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    separator_style = 'slant',
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory"},
      { filetype = "vista", text = "Tags", highlight = "Directory", }
    }
  },
}
