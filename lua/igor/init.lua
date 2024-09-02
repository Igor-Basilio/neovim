
require("igor.remap")
require("igor.lazy")
require("igor.options")

vim.cmd [[
  autocmd BufRead,BufNewFile *.py set filetype=python
  autocmd BufRead,BufNewFile CMakeLists.txt set filetype=cmake
  autocmd BufRead,BufNewFile *.* if &syntax == '' && !exists("b:current_syntax") | set syntax=txt | endif
]]

