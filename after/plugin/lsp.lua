
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
  "java_language_server", "ols", "asm_lsp", "pylsp" ,"zls", "tsserver", "cssls", "html", "gopls", "lua_ls", "tsserver", "eslint", "rust_analyzer" },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

require('lspconfig').clangd.setup {
  init_options = {
    fallbackFlags = {'--std=c++23'}
  },
}

require('lspconfig').lua_ls.setup {
     settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `love` global
                globals = { 'love' },
            },
            workspace = {
                -- Make the server aware of LÖVE's runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- Function to set filetype based on lowercase extension
function SetFiletypeBasedOnLowercaseExtension()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.fnamemodify(filename, ':e'):lower()
  if extension ~= '' then
    -- For now manually set .inc filetype for every project 
    -- could change this to automatically check for highest 
    -- file number then setting inc ext to that.
    if extension == 'inc' then
        vim.bo.filetype = "fasm"
    elseif extension == 'hs' then
        vim.bo.filetype = 'haskell'
    elseif extension == 'asm' then
        vim.bo.filetype = 'fasm'
    elseif extension == 'h' then
        vim.bo.filetype = 'c'
    elseif extension == 's' then
        vim.bo.filetype = "fasm"
    elseif extension == 'S' then
        vim.bo.filetype = "fasm"
    elseif extension == 'js' then
        vim.bo.filetype = "javascript"
    elseif extension == 'rs' then
        vim.bo.filetype = "rust"
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

