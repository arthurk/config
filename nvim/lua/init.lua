vim.cmd('packadd nvim-lspconfig')

local lsp = require'lspconfig'

-- convenience func, to keep key mappings short
local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

-- enable lsp and completion
local on_attach = function(client)
  -- mappings
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', 'gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', 'gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', 'gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

  -- enable lsp omnifunc
  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

  print("LSP ready")
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  allow_prefix_unmatch = false;

  source = {
    path = true;
    buffer = true;
    calc = false;
    vsnip = false;
    nvim_lsp = true;
    nvim_lua = true;
    spell = false;
    tags = true;
    snippets_nvim = false;
  };
}

-- Go
lsp.gopls.setup{
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }
}

-- Terraform
lsp.terraformls.setup{
  on_attach = on_attach
}

-- Synchronously organise (Go) imports.
-- https://github.com/neovim/nvim-lspconfig/issues/115
function go_organize_imports_sync(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, 't', true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result then return end
  result = result[1].result
  if not result then return end
  edit = result[1].edit
  vim.lsp.util.apply_workspace_edit(edit)
end
-- auto organize imports and format go code
vim.api.nvim_command("au BufWritePre *.go lua go_organize_imports_sync(1000)")
vim.api.nvim_command("au BufWritePre *.go lua vim.lsp.buf.formatting()")

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}

require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require'bufferline'.setup{
  diagnostics = "nvim_lsp"
}
