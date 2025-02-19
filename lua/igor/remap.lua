
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>pv', ':Oil<CR>',
    { noremap = true, silent = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- rainbow csv keymappings
vim.keymap.set('n', '<C-Right>', function()
  return (vim.g.rbcsv or 0) == 1 and '<Cmd>RainbowCellGoRight<CR>' or '<C-Right>'
end, { expr = true, noremap = true })

