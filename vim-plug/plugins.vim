" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'sheerun/vim-polyglot'                         " Syntax support
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf (Control+p)
  Plug 'junegunn/fzf.vim'
  Plug 'chriskempson/base16-vim'                      " Colorscheme
  Plug 'vim-scripts/vim-gitgutter'                    " Show  git changes  on sign column
  " Plug 'APZelos/blamer.nvim'
  Plug 'Yggdroot/indentLine'                          " See vertical lines at each identation
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'                           " surroundings: parentheses, brackets, quotes, XML tags, and more
  Plug 'ap/vim-css-color'                             " multi-syntax context-sensitive color name highlighter
  " Plug 'tpope/vim-commentary'                         " Comment lines
  Plug 'numToStr/Comment.nvim'                        " Comment code
  Plug 'kana/vim-textobj-user'                        " Required by nelstrom/vim-textobj-user
  Plug 'nelstrom/vim-textobj-rubyblock'               " Select ruby blocks

  Plug 'kdheepak/lazygit.nvim'
call plug#end()
