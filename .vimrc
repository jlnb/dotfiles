
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

if &compatible
	set nocompatible
end

set encoding=utf-8
"set noswapfile
set splitright
set splitbelow
set number
set ruler
set laststatus=2

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim



if &t_Co > 2 || has("gui_running") && !exists("syntax_on")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"filetype plugin on
"filetype indent on
"let g:tex_flavor='latex'
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_DefaultTargetFormat = 'pdf'
"execute pathogen#infect()

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Possibility to add local configuration adjustments
if filereadable($HOME . "/.vimrc.local")
	source ~/.vimrc.local
endif

