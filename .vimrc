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

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
" if exists('skip_defaults_vim')
"   finish
" endif

set nocompatible

if isdirectory($HOME . "/.vim/bundle/Vundle.vim")
	"Vundle specific stuff only if it is available
	" The following is just copied from the Vundle git repository
	" https://github.com/VundleVim
	
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')
	
	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	
	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	" Plugin 'tpope/vim-fugitive'
	Plugin 'preservim/nerdtree'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'	
	Plugin 'lervag/vimtex'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'ludovicchabant/vim-gutentags'
	" plugin from http://vim-scripts.org/vim/scripts.html
	" Plugin 'L9'
	" Git plugin not hosted on GitHub
	" Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	" Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Install L9 and avoid a Naming conflict if you've already installed a
	" different version somewhere else.
	" Plugin 'ascenator/L9', {'name': 'newL9'}
	
	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
	
	" Plugin specific options
	let g:airline#extensions#tabline#enabled = 1
	" let g:vimtex_view_general_viewer = 'zathura' > move to local vimrc
	" (not installed on all my machines)
	let g:vimtex_imaps_leader = 'ä'

	" let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-b>"
	let g:UltiSnipsListSnippets="<F2>"
	let g:UltiSnipsSnippetDirectories=[$HOME . "/.vim/UltiSnips"]

	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"

	augroup ultisnips
	    au!
	    autocmd Filetype tex UltiSnipsAddFiletypes texmath 
	    autocmd Filetype tex UltiSnipsAddFiletypes tex 
	augroup END

endif

set encoding=utf-8
set noswapfile
set splitright
set splitbelow
set number
set ruler
set laststatus=2
set softtabstop=4
set shiftwidth=4
set tabstop=8
set noexpandtab
set shiftround
set wrap

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim
" > copied the whole content of it into this file
" > Some things may over time be changed or deleted

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " Switch on highlighting the last used search pattern.
  set hlsearch

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
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

let g:tex_flavor='latex'
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_DefaultTargetFormat = 'pdf'

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Setting my leader and local leader key
let mapleader = "-"
nnoremap - <nop>
let maplocalleader = "ö"
nnoremap ö <nop>

" My keymappings - Normal mode
nnoremap <leader>- ddp
nnoremap <leader>_ ddkkp
nnoremap <leader>U viwUe
nnoremap <leader>u viwue
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" My keymappings - Insert mode
inoremap <leader>u <esc>viwUea
inoremap <leader>l -------------------------------------------------------------------------------<cr>
inoremap :w <esc>:w<cr>a
inoremap jk <esc>

" My keymappings - Visual mode
vnoremap <leader>" di""<esc>hpl
vnoremap <leader>l" di\glqq{}<esc>pa\grqq{}<esc>

" Abbreviations - insert mode
" Typos
iabbrev adn and
iabbrev waht what
" Shortcuts
iabbrev @@ mail@julianbelz.com
iabbrev ccopy Copyright 2020 Julian Belz, all rights reserved.

" Operator-pending commands
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap in" :<c-u>normal! f"vi"<cr>

" autocmd section
augroup filetype_python
    au!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<space><esc>
    autocmd Filetype python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_matlab
    au!
    autocmd Filetype matlab nnoremap <buffer> <localleader>c I%<space><esc>
augroup END

augroup filetype_markdown
    au!
    autocmd Filetype markdown nnoremap <buffer> <localleader>c I%<space><esc>
augroup END

augroup filetype_vim
    au!
    autocmd Filetype vim nnoremap <buffer> <localleader>c I"<space><esc>
augroup END


augroup filetype_tex
    au!

    autocmd Filetype tex nnoremap <buffer> <localleader>c I%<space><esc>
    autocmd Filetype tex :inoremap <buffer> l"" \glqq{}
    autocmd Filetype tex :inoremap <buffer> r"" \grqq{}

    autocmd Filetype tex :iabbrev <buffer> aalpha \alpha
    autocmd Filetype tex :iabbrev <buffer> bbeta \beta
    autocmd Filetype tex :iabbrev <buffer> ggamma \gamma
    autocmd Filetype tex :iabbrev <buffer> ddelta \delta
    autocmd Filetype tex :iabbrev <buffer> mmu \mu
    autocmd Filetype tex :iabbrev <buffer> rrho \rho
    autocmd Filetype tex :iabbrev <buffer> Aalpha \Alpha
    autocmd Filetype tex :iabbrev <buffer> Bbeta \Beta
    autocmd Filetype tex :iabbrev <buffer> Ggamma \Gamma
    autocmd Filetype tex :iabbrev <buffer> Ddelta \Delta
    autocmd Filetype tex :iabbrev <buffer> Rrho \Rho
augroup END

augroup filetype_html
    au!
    autocmd Filetype html nnoremap <buffer> <localleader>f Vatzf
augroup END

" Possibility to add local configuration adjustments
if filereadable($HOME . "/.vim/.vimrc.local")
	source ~/.vim/.vimrc.local
endif

