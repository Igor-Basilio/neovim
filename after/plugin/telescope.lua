
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {

	defaults = {

		previewer = true,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
		
	}

}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string( { search = vim.fn.input("Grep > ") });
end)
vim.api.nvim_set_keymap('n', '<leader>pg', ':lua require("telescope.builtin").find_files({cwd = os.getenv("HOME")})<CR>', { noremap = true, silent = true })

