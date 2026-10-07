vim.cmd([[
    syntax on
    filetype plugin indent on
    autocmd BufNewFile,BufRead *.yaml,*.yml set filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    let g:indentLine_char = '⦙'
    set number
    set norelativenumber
    set nowrap
    set cindent shiftwidth=4
    command NnnExplorer
    colorscheme retrobox
    
    call plug#begin()
    Plug 'sphamba/smear-cursor.nvim'
    Plug 'karb94/neoscroll.nvim'
    call plug#end()
]])

require("smear_cursor").enabled = true
require("neoscroll").setup()
