-- LSP Config
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Java
nvim_lsp.jdtls.setup {
  ensure_installed = { 'jdtls'},
  on_attach = on_attach,
  filetypes = { "java" },
  cmd = { "jdtls", "--stdio" },
  capabilities = capabilities

}

-- TypeScript
nvim_lsp.tsserver.setup {
  ensure_installed = { 'tsserver'},
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
}

-- Tailwind
nvim_lsp.tailwindcss.setup {
  ensure_installed = { 'tailwindcss-intellisense'},
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Python
nvim_lsp.pyright.setup {
  filetypes = { "python" },
  on_attach = on_attach,
  capabilities = capabilities,
}
-- JSON
require'lspconfig'.jsonnet_ls.setup{}



-- FOR ICONS
-- This will change the icons on these bad boys
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

