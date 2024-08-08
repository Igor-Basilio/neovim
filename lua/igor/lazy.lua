
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6' },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ 'nvim-lua/plenary.nvim' },
	{ 'ThePrimeagen/vim-be-good' },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ 'ThePrimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'tpope/vim-eunuch'},
	{'mattn/emmet-vim'},
	{'levouh/tint.nvim'},
	{'xiyaowong/transparent.nvim'},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"uga-rosa/ccc.nvim"},

})

