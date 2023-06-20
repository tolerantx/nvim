" Reset search
nmap <ESC><ESC> :noh<CR>

nnoremap C "_C
nnoremap c "_c
nnoremap S "_S
nnoremap s "_s

" Tabs
nnoremap <C-t><C-t> :tabnew<CR>
vnoremap <C-t><C-t> <Esc>:tabnew<CR>
inoremap <C-t><C-t> <Esc>:tabnew<CR>

" Go end to the line exclusing triling whitespace
vnoremap $ g_

" Contro+p (fzf) (brew install fzf)
nnoremap <silent> <C-p> :Files<CR>
inoremap <silent> <C-p> <Esc>:Files<CR>

" Rg (Search)
" nnoremap <C-F> :Rg<SPACE>
" inoremap <C-F> <Esc>:Rg<SPACE>
nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fg :Rg<SPACE>
nnoremap <leader>gs :GitFiles?<CR>
nnoremap <leader>gb :Git blame<CR>

" Move to splits
" map <C-S-Up> :wincmd k<CR>
" map <C-S-Down> :wincmd j<CR>
" map <C-S-Left> :wincmd h<CR>
" map <C-S-Right> :wincmd l<CR>
map <M-Up> :wincmd k<CR>
map <M-Down> :wincmd j<CR>
map <M-Left> :wincmd h<CR>
map <M-Right> :wincmd l<CR>

" Save and close
map <C-s> :w<CR> :echo "Saved!" <CR>
imap <C-s> <ESC> :w<CR> :echo "Saved!" <CR>
nmap <C-q> :q<CR>

" Move lines
nnoremap <silent><C-k> :m .-2<CR>==        " Move up
nnoremap <silent><C-j> :m .+1<CR>==        " Move down
inoremap <silent><C-k> <Esc>:m .-2<CR>
inoremap <silent><C-j> <Esc>:m .+1<CR>
vnoremap <silent><C-k> :m '<-2<CR>gv=gv
vnoremap <silent><C-j> :m '>+1<CR>gv=gv

" Explorer
nmap <leader>e :CocCommand explorer<CR>

" Formatting JSON
noremap <silent> <leader>rjp :%!ruby -rjson -e 'puts JSON.pretty_generate(JSON.load_file("%"))'<CR>
