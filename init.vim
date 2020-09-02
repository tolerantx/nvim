source $HOME/.config/nvim/vim-plug/plugins.vim

let mapleader = "\<Space>"

set nocompatible
set mouse=a
set number                      " Display line numbers beside buffer
" set relativenumber
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
set virtualedit=all
set showmatch                   " Show matching brackets.

" Go to Normal mode
imap ;; <ESC>
vmap ;; <ESC>

" Reset search
nmap <ESC><ESC> :noh<CR>

" Open config file
command! Config execute ":vsplit $MYVIMRC"
command! Plugins execute ":vsplit ~/.config/nvim/vim-plug/plugins.vim"
command! Reload execute ":source $MYVIMRC"

" NERDTree
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
nmap <leader>b :NERDTreeToggle<CR>
nmap <leader>rr :NERDTreeFind<CR>

" Copy and Paste
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
vmap <C-x> d:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" Tabs
nnoremap <C-t><C-t> :tabnew<CR> " <Option-t> new tab
vnoremap <C-t><C-t> <Esc>:tabnew<CR> " <Option-t> new tab
inoremap <C-t><C-t> <Esc>:tabnew<CR> " <Option-t> new tab

" Contro+p (fzf) (brew install fzf)
nnoremap <silent> <C-p> :Files<CR>
inoremap <silent> <C-p> <Esc>:Files<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Rg (Search)
nnoremap <C-S-f> :Rg<SPACE>
inoremap <C-S-f> <Esc>:Rg<SPACE>
nnoremap <leader>ff :Rg <C-R>=expand("<cword>")<CR><CR>

" Move to splits
map <C-S-Up> :wincmd k<CR>
map <C-S-Down> :wincmd j<CR>
map <C-S-Left> :wincmd h<CR>
map <C-S-Right> :wincmd l<CR>

" Save and close
map <C-s> :w<CR> :echo "Saved!" <CR>
imap <C-s> <ESC> :w<CR> :echo "Saved!" <CR>
nmap <C-q> :q<CR>

" Blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 250
let g:blamer_date_format = '%b %d, %Y %H:%M'
let g:blamer_template = '<author> • <committer-time> • <summary>'
let g:blamer_show_in_visual_modes = 0

" Vim-Gitgutter
let g:gitgutter_realtime = 0

" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 10

" Colorscheme
colorscheme base16-default-dark
let base16colorspace=256
set termguicolors
" colorscheme jellybeans

" Highlight line
set cursorline
" highlight CursorLine ctermbg=Black cterm=None
" set fillchars+=vert:\|
" hi! vertsplit guifg=fg guibg=bg

" Color column
set colorcolumn=80

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" Copy current path file
let @+ = expand("%")
nmap <leader>pf :let @+ = expand("%")<CR> :echo 'File path copied!'<CR>

" Copy current directory path
nmap <leader>pd :let @+ = expand("%:h")<CR> :echo 'Directory path copied!'<CR>

" Move lines
nnoremap <silent><C-k> :m .-2<CR>==        " Move up
nnoremap <silent><C-j> :m .+1<CR>==        " Move down
inoremap <silent><C-k> <Esc>:m .-2<CR>
inoremap <silent><C-j> <Esc>:m .+1<CR>
vnoremap <silent><C-k> :m '<-2<CR>gv=gv
vnoremap <silent><C-j> :m '>+1<CR>gv=gv

" =================== coc.nvim =================================================

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_global_extensions = ['coc-solargraph']

" =================== END coc.nvim =============================================
