syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
so  ~/.vim/plugins.vim

call vundle#end()            " required
filetype plugin indent on    " required

set number
"set this for fuzzy explorer
set hidden
colorscheme atom-dark-256
set cursorline
set scrolloff=3
set autochdir
"specify buffers for autocomplete
set complete=.,w,b,u
"white space
set backspace=eol,start,indent
set wrap
set textwidth=79
set expandtab ts=4 sw=4 ai
"flag any whitespace in a python file

"searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
nnoremap <F5> :grep <C-R><C-W> *<CR>
"a shortcut to edit vimrc file"
let mapleader=',' "make comma the mapleader
map <leader>ev :e ~/.vimrc<CR>
map <leader>sv :so ~/.vimrc<CR>
map <leader><space> :nohlsearch<cr>
 " adding new lines in normal mode
"add a new line below the current
nmap <leader>nl o<ESC>
"add a new line above  the current
nmap <leader>nL O<ESC>
nmap <leader>a :q<cr>
nmap <space> i<space><ESC>

"fast saving of a buffer
nmap <leader>w :w<cr>

"disabling the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>

"quick pairs
imap <leader>" ""<ESC>i
imap <leader>' ''<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>( ()<ESC>i
imap <leader>< <><ESC>i
imap jj <ESC>
imap kk <ESC>

"moving between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"vim-sorround mappings
nmap <leader>mm) ysiw)
nmap <leader>mm] ysiw]
nmap <leader>mm} ysiw}
"NERDTreeToogle shortcut
nmap <C-a> :NERDTreeToggle<CR>

"configurations for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:ale_emit_conflict_warnings = 0
nmap <leader>st :SyntasticToggleMode<CR>

"cnfigurations for closetag plugin
"enable autoclose in the following file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
"
