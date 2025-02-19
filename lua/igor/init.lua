
require("igor.remap")
require("igor.lazy")
require("igor.options")

vim.cmd [[

  autocmd BufRead,BufNewFile *.py set filetype=python
  autocmd BufRead,BufNewFile CMakeLists.txt set filetype=cmake
  autocmd BufNewFile,BufRead *.csv   set filetype=rfc_csv
  autocmd BufNewFile,BufRead *.dat   set filetype=rfc_csv
  autocmd BufNewFile,BufRead *.data  set filetype=rfc_csv
  autocmd BufNewFile,BufRead *.hpp   set filetype=cpp
  autocmd BufNewFile,BufRead *.proto set filetype=proto
  autocmd BufNewFile,BufRead *.p     set filetype=proto
  autocmd BufNewFile,BufRead *.cc    set filetype=cpp
  autocmd BufRead,BufNewFile *.creole,*.mkb-creole,*.mkb set filetype=mkb-creole
  autocmd BufRead,BufNewFile *.* if &syntax == '' && !exists("b:current_syntax") | set syntax=txt | endif

  set viewoptions-=options
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
  augroup END
  set foldcolumn=1

]]

vim.api.nvim_set_hl(0, "FoldColumn", {
    fg = "#bbbbbb",
    bg = "#262626",
})

-- For automatic saving of folds 
-- https://vi.stackexchange.com/questions/28695/automatically-load-save-folds-of-files-except-for-help-files
-- when closing or opening a file.

