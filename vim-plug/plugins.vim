" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  " File Explorer
  Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'sheerun/vim-polyglot'                         " Syntax support
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf (Control+p)
  Plug 'junegunn/fzf.vim'
  Plug 'chriskempson/base16-vim'                      " Colorscheme
  Plug 'vim-scripts/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'
  Plug 'Yggdroot/indentLine'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'

call plug#end()
