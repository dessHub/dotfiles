"note to self
""to see file-type icons on file names, install ITerm Nerd fonts
"brew tap caskroom/fonts
"brew cask install font-hack-nerd-font
"then change yout ITerm2 Non-ASCII font to Hack Regular Nerd Font Complete
syntax on

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
" let vundle manage vundle, required
Plugin 'vundlevim/vundle.vim'
so  ~/dotfiles/.vim/plugins.vim

call vundle#end()            " required
filetype plugin indent on    " required

"show filename on status line
set number
set foldmethod=syntax
"set this for fuzzy explorer
set hidden
colorscheme gruvbox "atom-dark-256  
set cursorline 
set scrolloff=3
set autochdir
"specify buffers for autocomplete
set complete=.,w,b,u
"settings for auto saving files
"let g:auto_save = 1  " enable autosave on vim startup
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

"white space
set backspace=eol,start,indent
set wrap
set textwidth=79
"default number of spaces for tabs
set expandtab ts=2 sw=2 ai
"number of spaces when edditing specific files 
autocmd filetype html setlocal ts=2 sw=2 expandtab
autocmd filetype python setlocal ts=4 sw=4 expandtab
autocmd filetype javascript setlocal ts=2 sw=2 expandtab
"flag any whitespace in a python file

"searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
nnoremap <f5> :grep <c-r><c-w> *<cr>
"a shortcut to edit vimrc file"
let mapleader=',' "make comma the mapleader
map <leader>ev :e ~/.vimrc<cr>
map <leader>pv :e ~/dotfiles/.vim/plugins.vim<cr>
map <leader>sv :so ~/.vimrc<cr>
map <leader><space> :nohlsearch<cr>
 " adding new lines in normal mode
"add a new line below the current
nmap <leader>nl o<esc>
"add a new line above  the current
nmap <leader>nl o<esc>
"nmap <leader>q :q<cr>
nmap <space> i<space><esc>

"fast saving of a buffer
nmap <leader>w :w<cr>

"disabling and remapping the arrow keys
noremap <up> :m .-2<cr>==
noremap <down> :m .+1<cr>==
"noremap <left> <nop>
"noremap <right> <nop>
"do nothing in insert mode
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <Right> <NOP>
"move selected lines up/down in visual mode
vmap <Up> :m '<-2<CR>gv=gv
vmap <Down> :m '>+1<CR>gv=gv

"quick pairs
imap <leader>" ""<ESC>i
imap <leader>' ''<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>( ()<ESC>i
imap <leader>< <><ESC>i
imap jj <ESC>
imap kk <ESC>

"vim-sorround mappings
nmap <leader>mm) ysiw)
nmap <leader>mm] ysiw]
nmap <leader>mm} ysiw}
"custom sorround mappings
nmap <leader>qw bcw''<ESC>hp
nmap <leader>dq bcw""<ESC>hp
vmap <leader>qw c''<ESC>hp
vmap <leader>dq c""<ESC>hp
"sorround selected text in brackets, parenthesis, e.t.c
vmap <leader>{ c{}<esc>hp
vmap <leader>[ c[]<esc>hp
vmap <leader>( c()<esc>hp
"nerdtreeToogle shortcut
"autocmd vimenter * NERDTree

"moving between windows/splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
nmap <C-a> :NERDTreeToggle<CR>
"resize splits 
nmap <Left> :vertical resize -5<CR>
nmap <Right> :vertical resize +5<CR>

"configurations for syntastic
let g:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_emit_conflict_warnings = 0

"cnfigurations for closetag plugin
"enable autoclose in the following file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
" mappings for vim-js-import
nnoremap <F5> :call JsFileImport()<CR>
nnoremap <F6> :call SortJsFileImport()<CR>
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
"
" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

imap ;d <div className=''><ESC>li
imap ;p <p>
imap ;a <a href=''><ESc>hi
imap ;ul <ul><esc>li
imap ;li <li><esc>li
map ;h1 <h1><ESC>li
map ;h2 <h2<ESC>li
map ;h3 <h3><ESC>li
map ;h4 <h4><ESC>li
map ;h5 <h5><ESC>li
imap ;sp <span><ESC>li
imap ;i <input type='text' placeholder=''><ESC>2hi
imap ;bt <button className=''><ESC>li
imap ;im import  from '';<ESC>8hi
"importing objects
imap ;cim import {  } from '';<ESC>10hi

"Invoke CtrlP with starting directory
nmap <leader>p <C-p>
" ignore git files, node_modules and bower_components
" it will load faster this way
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'

"lightline colorscheme
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

augroup autoSourceMyvimrc
    au!
    au BufWritePost .vimrc so ~/.vimrc
augroup END

set nu

set number relativenumber

execute pathogen#infect()

" NeoBundle 'airblade/vim-gitgutter'

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
"use <C-w>f to open the file under the cursor in a new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

let g:deoplete#enable_at_startup = 1
let g:ackprg = 'ag --vimgrep'

let g:LustyExplorerSuppressRubyWarning = 1
