imap ;; <Esc>
let mapleader = ""
syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set nocompatible

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Clipboard xsel config
set clipboard^=unnamed,unnamedplus
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel --input --clipboard")

" vim instead of man config
let $PAGER=''

" vim kitty scrollback buffer clean
function! KittyBufferHistoryClean()
  set modifiable
  set noconfirm
  " clean ascii/ansi code  (starts with ^[)
  silent! %s/\e\[[0-9:;]*m//g
  silent! %s/[^[:alnum:][:punct:][:space:]]//g
  silent! %s/\e\[[^\s]*\s//g
  " remove empty spaces from end
  silent! %s/\s*$//
  let @/ = ""
  " map q to force quit
  cnoremap q q!
endfunction
command! KittyBufferHistoryClean call KittyBufferHistoryClean()

