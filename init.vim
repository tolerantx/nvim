source $HOME/.config/nvim/vim-plug/plugins.vim

let mapleader = "\<Space>"

set nocompatible
set mouse=a
set number                      " Display line numbers beside buffer
set relativenumber
set backspace=indent,eol,start  " Sane backspace behavior
set splitbelow
set splitright
set noswapfile                  " Don't use swapfile
set encoding=utf-8              " Set default encoding to UTF-8
set autoindent
set smartindent

set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
set lazyredraw          	      " Wait to redraw "

set ts=2                        " Tabs are 2 spaces
set bs=2                        " Backspace over everything in insert mode
set softtabstop=2
set shiftwidth=2                " Tabs under smart indent
set smarttab
set expandtab
set virtualedit=onemore         " all, block, insert, onemore
set showmatch                   " Show matching brackets.
set clipboard=unnamed
set foldmethod=manual

" This is required to use vim-textobj-user/vim-textobj-rubyblock
runtime macros/matchit.vim

" Open config file
command! Config execute ":vsplit $MYVIMRC"
command! Plugins execute ":vsplit ~/.config/nvim/vim-plug/plugins.vim"
command! Reload execute ":source $MYVIMRC" | execute ":echo 'Reloaded!'"
command! Tmux execute ":vsplit ~/.tmux.conf"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Blamer.nvim
let g:blamer_enabled = 1
" let g:blamer_delay = 250
let g:blamer_date_format = '%b %d, %Y %H:%M'
let g:blamer_template = '<author> • <committer-time> • <summary>'
let g:blamer_show_in_visual_modes = 0

" Vim-Gitgutter
let g:gitgutter_realtime = 0

" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_theme='angr'

" Colorscheme
colorscheme base16-default-dark
let base16colorspace=256
set termguicolors

" Highlight line
set cursorline

" Color column
set colorcolumn=80

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" Copy current path file
let @+ = expand("%")
nmap <leader>pf :let @+ = expand("%")<CR> :echo 'File path copied!'<CR>

" Copy current directory path
nmap <leader>pd :let @+ = expand("%:h")<CR> :echo 'Directory path copied!'<CR>

" Copy current file name
nmap <leader>fn :let @+ = expand("%:t")<CR> :echo 'File name copied!'<CR>

" Settings
source $HOME/.config/nvim/settings/mappers.vim
source $HOME/.config/nvim/settings/tabs.vim
source $HOME/.config/nvim/vim-plug/coc.conf.vim

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Allow searching in hidden files
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

