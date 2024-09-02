
local lsp_zero = require('lsp-zero')
lsp_zero.preset('recommended')
lsp_zero.setup()

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
  "ols", "asm_lsp", "clangd", "pylsp" ,"zls", "tsserver", "cssls", "html", "gopls", "lua_ls", "tsserver", "eslint", "rust_analyzer", },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- Function to set filetype based on lowercase extension
function SetFiletypeBasedOnLowercaseExtension()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.fnamemodify(filename, ':e'):lower()
  if extension ~= '' then
    -- For now manually set .inc filetype for every project 
    -- could change this to automatically check for highest 
    -- file number then setting inc ext to that.
    if extension == 'inc' then
        vim.bo.filetype = "asm"
    elseif extension == 'hs' then
        vim.bo.filetype = 'haskell'
    elseif extension == 'h' then
        vim.bo.filetype = 'c'
    elseif extension == 's' then
        vim.bo.filetype = "asm"
    elseif extension == 'S' then
        vim.bo.filetype = "asm"
    else
        vim.bo.filetype = extension
    end
  end
end

-- Autocommand to call the function for BufRead and BufNewFile events
vim.cmd [[
  augroup SetFiletype
    autocmd!
    autocmd BufRead,BufNewFile * lua SetFiletypeBasedOnLowercaseExtension()
  augroup END
]]

