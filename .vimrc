set nocompatible
filetype off

set t_Co=256
let g:closetag_html_style=1 

" Load the magic!
source ~/.vim/bundles.vim

syntax on
filetype plugin indent on

" Some terminals fuck up backspace
imap  <BS>
cmap  <BS>

" For humans that use a layout other than the US International [wtf does that
" even mean International, but .. USA FTW too!? ;o ]
map <C-J> <C-]>

" to get out of insert mode, quickly!
imap jj <Esc>

" So how exactly the shift-semicolon got chosen, that requires punching shift
" even on the US layout?
map ; :


map <silent> <F3> :call BufferList()<CR>   

map <F1> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nmap qq :q!<CR>


" Just delete these if you don't want to partake in this blasphemy, after all
" tabs are created 8space wide!
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set textwidth=80

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set hlsearch


" set background=dark
" colorscheme solarized

" set statusline=%*%P%l#Statusline(4,1)

set showmatch

au Filetype html,xml,xsl,htmldjango,jinjahtml,rhtml source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

au Filetype php inoremap ## /**<CR><Space>*<CR>*/<Space><CR>
" omnicomplete
au FileType php set omnifunc=phpcomplete#CompletePHP

" check php syntax
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>


