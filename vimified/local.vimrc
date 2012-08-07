let g:vimified_packages = ['general', 'coding', 'os', 'fancy', 'color']

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


" map <silent> <F3> :call BufferList()<CR>
map <silent> <F2> :BufExplorer<CR>


map <F1> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nmap qq :q!<CR>

autocmd BufNewFile,BufRead *.twig set filetype=htmljinja
