local lsp_config = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'rust_analyzer',
    'lua_ls'
  }
})

local servers = require('mason-lspconfig').get_installed_servers
for _, server in ipairs(servers()) do
  local config = { capabilities = lsp_capabilities }
  if server == 'clangd' then
    config.on_new_config = function(config, root_dir)
      config.cmd = {
        "/Library/Developer/CommandLineTools/usr/bin/clangd",
        "--background-index",
        "--query-driver",
        "/Library/Developer/CommandLineTools/usr/bin/clang++"
      }
    end
  end
  lsp_config[server].setup(config)
end


-- diagnostics settings
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

--vim.lsp.set_log_level("trace")

