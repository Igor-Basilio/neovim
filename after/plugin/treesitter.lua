
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "haskell", "vimdoc", "javascript","typescript", "go", "rust", "c", "lua", "vim", "vimdoc", "query", "cmake" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

