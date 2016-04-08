set nocompatible              " required
set backspace=2
filetype off                  " required
let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" SimpylFold ===================
"Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1
"=================================

" indent for Python
Plugin 'vim-scripts/indentpython.vim'

" auto-complete
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g : YcmCompleter GoTo<CR>
nnoremap <leader>r : YcmCompleter GoToReferences<CR>

" nerdtree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" <F2> Toggle NERDTree
map <F2> :call NERDTree()<CR>
func! NERDTree()
	exec ":NERDTreeToggle"
endfunc
nnoremap <leader>f : NERDTreeFind<CR>

" super search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
"let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_extensions = ['buffertag', 'tag']

" auto update tags
Plugin 'craigemery/vim-autotag'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"set guifont=Source\ Code\ Pro\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Snip
"Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="/"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" line
set number
set history=1000
set background=dark

" syntax highlight
syntax on
filetype plugin indent on

" indent
set autoindent
set smartindent
set cindent

"tab & expand
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" brackets match
set showmatch

" cursor position
set  ruler

" highlight current line
set cursorline

" quick search
set incsearch
set hlsearch
set ignorecase smartcase

" fold
set foldmethod=indent
"set foldlevel=99
nnoremap <space> za

" mouse
set mouse=c

" comment for vim setting
set modeline

"colorscheme evening

" pathogen
"call pathogen#infect()


" chinese
set encoding=utf-8

" window
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" <F1> compile
map <F1> :call CompileRun()<CR>
func! CompileRun()
    if &filetype == 'python'
        exec ":w"
        exec "!/usr/bin/python ./%"
    elseif &filetype == 'c'
        exec ":w" 
        exec "!gcc % -o %<"
        exec "! ./%<"
	elseif &filetype == 'go'
        exec ":w"
        "exec "!go run ./%"
        exec "!/usr/local/go/bin/go run ./%"
	elseif &filetype == 'sh'
        exec ":w"
        exec "!/bin/bash %"
    endif
endfunc

"**********************************************************

"新建文件后，自动定位到文件末尾
"autocmd BufNewFile * normal G

autocmd BufNewFile *.sh,*.java,*.py,*.go exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
		call append(1, "\#########################################################################")
		call append(2, "\# Author: Johnny Shi")
		call append(3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(4, "\# File Name: ".expand("%"))
		call append(5, "\# Description: ")
		call append(6, "\#########################################################################")
		call append(7, "")
	elseif &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call append(1, "\#-*- coding: utf-8 -*-")
		call append(2, "\#########################################################################")
		call append(3, "\# Author: Johnny Shi")
		call append(4, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(5, "\# File Name: ".expand("%"))
		call append(6, "\# Description: ")
		call append(7, "\#########################################################################")
		call append(8, "")
		call append(9, "\# vim: set expandtab ts=4 sts=4 sw=4 :")
	elseif &filetype == 'go'
		call setline(1, "\//#########################################################################")
		call append(1, "\// Author: Johnny Shi")
		call append(2, "\// Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(3, "\// File Name: ".expand("%"))
		call append(4, "\// Description: ")
		call append(5, "\//#########################################################################")
		call append(6, "")
		call append(7, "\// vim: set expandtab ts=4 sts=4 sw=4 :")
	endif
endfunc

"**********************************************************

" Tlist config
" <F3> Tlist
map <F3> :call Tlist()<CR>
func! Tlist()
	exec ":TlistToggle"
endfunc

" vim中命令行模式的自动匹配
set wildmode=longest:list

" multi-line comment
autocmd FileType * setlocal formatoptions=tcqro

" system clipboard
set clipboard=unnamed

