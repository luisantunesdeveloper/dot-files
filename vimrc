" the globber in the search
set path+=**

" set paste mode
"set paste
" the previous command conflicts with YouCompleteMe and almost all the other
" auto complete plugins

" do not make vim compatible with vi.
set nocompatible

" changes directory to the files dirname
"set autochdir

" set indentation options
set autoindent
set smartindent

" auto format elm code
let g:elm_format_autosave = 1

" solve backspace problem
set backspace=indent,eol,start

" set indentation config
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" detect filetype and indent
filetype plugin indent on

" auto complete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

" copy registers
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

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

" add buffer number to the tab
let g:bufferline_echo=0
let g:bufferline_show_bufnr = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
au BufWinEnter * set number

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

"
" Ripgrep configuration
"
" --column: Show column number
"  " --line-number: Show line number
"  " --no-heading: Do not show file headings in results
"  " --fixed-strings: Search term as a literal string
"  " --ignore-case: Case insensitive search
"  " --no-ignore: Do not respect .gitignore, etc...
"  " --hidden: Search hidden files and folders
"  " --follow: Follow symlinks
"  " --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
"  " --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" this can also be used for grepprg
set grepprg=rg\ --vimgrep

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

" add upgraded status bar at the bottom 
Plug 'vim-airline/vim-airline'

" add repeat support ofr other plugins
Plug 'tpope/vim-repeat'

" syntatic checker
Plug 'vim-syntastic/syntastic'

" add comments plugin
Plug 'scrooloose/nerdcommenter'

" add buffer info 
Plug 'bling/vim-bufferline'

" add elm support
Plug 'elmcast/elm-vim'

" add java, elixir you complete me support
Plug 'Valloric/YouCompleteMe', { 'do': 'python ./install.py', 'for': ['ruby', 'eruby'] }
Plug 'elixir-lang/vim-elixir'

" auto complete for vim (java)
"let g:EclimCompletionMethod = 'omnifunc'

" vertical line indentation
Plug 'nathanaelkane/vim-indent-guides'

" plugin managing tab
Plug 'ervandew/supertab'

" plugin to manage automatic closing of quotes, etc
Plug 'Raimondi/delimitMate'

" plugin to browse ctags
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" plugin to manage vim sessions
Plug 'mhinz/vim-startify'

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

" syntastic javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" fix system clipboard interaction
" yank to clipboard
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard
    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif
