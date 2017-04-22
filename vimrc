" the globber in the search
set path+=**

" do not make vim compatible with vi.
set nocompatible

" set indentation options
set autoindent
set smartindent

" set indentation config
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" number the lines.
set number

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

" Lets start installing plugins with VimPlug

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins 
call plug#begin('~/.vim/plugged')

" This lets you indent the text starting with ga
" align the current paragraph around '=' gaip=
Plug 'junegunn/vim-easy-align'

call plug#end()
