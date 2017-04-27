" the globber in the search
set path+=**

" do not make vim compatible with vi.
set nocompatible

" set indentation options
set autoindent
set smartindent

" set indentation config
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" detect filetype and indent
filetype plugin indent on

" auto complete
filetype plugin on
"set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" remap code autocompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
" autocomplete for commands
set wildmode=longest,list,full
set wildmenu

" if not using vim plug enable this
syntax enable

" javascript syntax related
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" number the lines.
set number
set relativenumber

" set the ruler
set ruler
set colorcolumn=80

" show location of cursor using a horizontal line.
set cursorline

" keep cursor in the middle of the screen while scrolling up and down.
set scrolloff=999

" show auto complete menus.
set wildmenu

" Make wildmend behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest

" run the Bash script by pressing F6 without leaving VIM.
map <f6> :w <CR>:!bash % <CR>

" turn on syntax hightlighting.
set syntax=on

" configure tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" configure vim test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" remap the Tab key for browsing between buffers
function! SwitchTabs()
    b#
endfunction

nmap <Tab> :call SwitchTabs()<CR>

" Lets start installing plugins with VimPlug

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" This lets you indent the text starting with ga
" align the current paragraph around '=' gaip=
Plug 'junegunn/vim-easy-align'

" get the syntax from scss going
Plug 'tpope/vim-haml'

" On-demand loading the tree plugin
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Edit surroundings of a text
Plug 'tpope/vim-surround'

" get the new javascript syntax for javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" get the tests running
Plug 'janko-m/vim-test'

" get the syntax for react only when javascript is available 
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" syntax for json
Plug 'leshill/vim-json'

" syntax for pug
Plug 'digitaltoad/vim-pug'

" color scheme
Plug 'crusoexia/vim-monokai'

" Fuzzy file finder
" Use it with vim 7.4 or more
" Orders of magnitude faster than any other plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Jumps through common js modules
Plug 'moll/vim-node'

" Enable more Javascript support
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" add upgraded status bar at the bottom 
Plug 'vim-airline/vim-airline'

" add repeat support ofr other plugins
Plug 'tpope/vim-repeat'

" syntatic checker
Plug 'vim-syntastic/syntastic'

" add comments plugin
Plug 'scrooloose/nerdcommenter'

" add git support
"Plug 'jreybert/vimagit'

call plug#end()

" configure color scheme  
" this has to be after the plugin activation
syntax on
colorscheme monokai

" Plugin options

" Open NERDTree when vim is opened NERDTree option
"au VimEnter *  NERDTree

" display all buffers when only tab open vim-airline option
let g:airline#extensions#tabline#enabled = 1

" syntastic eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
