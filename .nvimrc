" ██╗   ██╗██╗███╗   ███╗ 
" ██║   ██║██║████╗ ████║ 
" ██║   ██║██║██╔████╔██║ 
" ╚██╗ ██╔╝██║██║╚██╔╝██║ 
"  ╚████╔╝ ██║██║ ╚═╝ ██║ 
"   ╚═══╝  ╚═╝╚═╝     ╚═╝  

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set splitbelow
set splitright

"  " Required:
 set runtimepath+=/home/sage/.config/nvim/repos/github.com/Shougo/dein.vim
"
"  " Required:
if dein#load_state('/home/sage/.config/nvim/./')
	call dein#begin('/home/sage/.config/nvim/./')

	" Let dein manage dein
	" Required:
	call dein#add('/home/sage/.config/nvim/.//repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here like this:
	" call dein#add('Shougo/neosnippet.vim')
	" call dein#add('Shougo/neosnippet-snippets')
	" call dein#add('Shougo/deoplete.nvim')
	call dein#add('neomake/neomake')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	" let g:deoplete#enable_at_startup = 1

	" Required:
	call dein#end()
	call dein#save_state()
endif
" autocmd! BufWritePost,BufEnter * Neomake

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

syntax on
set conceallevel=2
" The ArchLinux global vimrc - setting only a few sane defaults
"
" Maintainer:      Thomas Dziedzic [gostrc@gmail.com]
"
" NEVER EDIT THIS FILE, IT'S OVERWRITTEN UPON UPGRADES, GLOBAL CONFIGURATION
" SHALL BE DONE IN /etc/vimrc, USER SPECIFIC CONFIGURATION IN ~/.vimrc

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

set number
set relativenumber

" MAPPING
inoremap jj <Esc>
map <F4> :!c++ % && ./a.out<CR>
set tabstop=4
set shiftwidth=4

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap :: m`A;<Esc>``
" nnoremap PP :! make && ./Ass*<CR>
autocmd BufRead *.c nnoremap PP :! gcc % && ./a.out<CR>
autocmd BufRead *.rs nnoremap PP :! cargo run && cargo build<CR>
autocmd BufRead *.lisp nnoremap PP :! clisp %<CR>
autocmd BufRead *.java nnoremap PP :! javac % && java SimBois<CR>
autocmd BufRead *.py nnoremap PP :w<CR>:! xfce4-terminal -e "python %"<CR>
" nnoremap -- i-<Esc>:s/./-/g<CR>:noh<CR>
nnoremap -- I\| <Esc>A \|<Esc>yyp:s/./-/g<CR>yykkp:noh<CR>
nnoremap WW :w<CR>
nnoremap WQ :wq<CR>
" nnoremap git :w<CR>:! git add %<CR>:! git commit -m "
" nnoremap git :call GitCommit()<CR>
" nnoremap gtp :!xfce4-terminal -e "git push"<CR>
" nnoremap gtp :call GitPush()<CR>
nnoremap git :call GitPush()<CR>

" Execute current file
nnoremap !! :!./%<CR>

function! GitPush()
  call inputsave()
  let name = input('Commit : ')
  call inputrestore()
  exe "w"
  exe "!git add %"
  exe "!git commit -m \"". name. "\""
  exe "!xfce4-terminal --minimize -e \"git push\""
  " exe "!git push"
endfunction

function! GitCommit()
  call inputsave()
  let name = input('CommitMsg : ')
  call inputrestore()
  exe "w"
  exe "!git add %"
  exe "!git commit -m \"". name. "\""
endfunction

" Jump down amount copied and auto paste
" nnoremap yyy yy<CR>

" adds color bindings to ~/TODO
autocmd BufRead /home/sage/TODO inoremap green ${GREEN}
autocmd BufRead /home/sage/TODO inoremap gren ${GREEN}
autocmd BufRead /home/sage/TODO inoremap grn ${GREEN}
autocmd BufRead /home/sage/TODO inoremap red ${RED}
autocmd BufRead /home/sage/TODO inoremap blue ${BLUE}
autocmd BufRead /home/sage/TODO inoremap blu ${BLUE}

" // adds comment formatting to C-style files
autocmd BufRead *.cpp nnoremap // m`I//<Esc>``
autocmd BufRead *.hpp nnoremap // m`I//<Esc>``
autocmd BufRead *.c nnoremap // m`I//<Esc>``
autocmd BufRead *.h nnoremap // m`I//<Esc>``

" And the web
autocmd BufRead *.js nnoremap <buffer> // m`I//<Esc>``
autocmd BufRead *.html nnoremap <buffer> // m`I<!-- <Esc>``A --><Esc>``
autocmd BufRead *.css nnoremap <buffer> // m`I/* <Esc>``A */<Esc>``

" And python
autocmd BufRead *.py nnoremap // m`I# <Esc>``

" And config/shell files
autocmd BufRead config nnoremap // m`I# <Esc>``
autocmd BufRead *.sh nnoremap // m`I# <Esc>``

" And sql files
autocmd BufRead *.sql nnoremap // m`I# <Esc>``
autocmd BufRead *.sql inoremap // <Esc>m`I# <Esc>``

" And vimrc itself
autocmd BufRead *vimrc nnoremap // m`I" <Esc>``

nnoremap ds db
nnoremap s :s/
nnoremap %s :%s/

" for assembly files, tabstop of 8
autocmd Filetype asm setlocal ts=8 
autocmd BufNewFile,BufReadPost *.c set filetype=cpp

" Spooky scary templates
if has("autocmd")
  augroup templates
	" New shell files open in insert mode
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
	autocmd BufNewFile *.sh 2
	autocmd BufNewFile *.sh start
	" New *.c and *.cpp read skeletons and jump to first real line
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
	autocmd BufNewFile *.cpp 10
    autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
	autocmd BufNewFile *.c 9

	autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
	autocmd BufNewFile *.html 11
  augroup END
endif

	
" Automatically edit *.cpp or *.c modified date on saving
" autocmd BufWritePre,FileWritePre *.cpp   ks|call LastMod()|'s
" autocmd BufWritePre,FileWritePre *.hpp   ks|call LastMod()|'s
" autocmd BufWritePre,FileWritePre *.c   ks|call LastMod()|'s
" autocmd BufWritePre,FileWritePre *.h   ks|call LastMod()|'s

" A COMMAND TO PUSH NVIMRC CHANGES TO GIT EVERY SAVE WOULD BE ///LIT///

" Update lastmod date for C style (double forward-slash) commenting
" fun LastMod()
  " if line("$") > 20
    " let l = 20
  " else
    " let l = line("$")
  " endif
  " exe "1," . l . "g-// Last modified:-s-// Last modified:.*-// Last modified:" .
  " \ strftime(" %B %d, %Y")
" endfun

" Make it look like vim did
colorscheme elflord

"Hide filename bar
set laststatus=0

"let g:deoplete#enable_at_startup = 1

set shellcmdflag=-ic
set shell=/usr/bin/zsh\ -i

set concealcursor=n                                                             
set conceallevel=3                                                              
hi Asterisks NONE
hi AsteriskItalic  cterm=italic gui=italic
syn match Asterisks contained "**" conceal                                      
syn match AsteriskItalic "\\\@<!\*\*[^"*|]\+\*\*" contains=Asterisks 

"nmap \sms :call SendSMS()<CR>
vmap \sms :call SendSMS()<CR>
function! SendSMS() range
  let a_save = @a
  silent! normal! gv"ay
  let dest = inputdialog("Recipient: ")
  exe "!kdeconnect-cli --send-sms \"" . @a . "\" --destination +1" . dest . " --device 700d680e1e3372b8"
endfunction

vmap \smsme :call Text("8504057164")<CR>
nmap \smsme :call NText("8504057164")<CR>
imap \smsme <ESC>:call NText("8504057164")<CR>

vmap \love :call Text("8502730023")<CR>
nmap \love :call NText("8502730023")<CR>
imap \love <ESC>:call NText("8502730023")<CR>

vmap \lll :call Text("8502730023")<CR>
nmap \lll :call NText("8502720023")<CR>
imap \lll <ESC>:call NText("8502730023")<CR>

nmap \wc :!wc %<CR>

function! Text(rec) range
  let a_save = @a
  silent! normal! gv"ay
  exe "!kdeconnect-cli --send-sms \"" . @a . "\" --destination +1" . a:rec . " --device 700d680e1e3372b8"
endfunction

function! NText(rec) range
  let line=getline('.')
  let line = substitute(line, "\"", '\\"', "g") 
  exe "!kdeconnect-cli --send-sms \"" . line . "\" --destination +1" . a:rec . " --device 700d680e1e3372b8"
  normal! dd
endfunction

vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let count = (line("'>") - line("'<") + 5)
  let name = inputdialog("Name of new method: ")
  '<
  " exe "normal! /^}\<CR>o\<Esc> O\<BS>void " . name ."()\<CR>{\<Esc>"
  exe "normal! O\<BS>void " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi\<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
  exe "normal! ". count . "<<"
  exe "normal! ". count . "dd/^}\<CR>o\<Esc>p"
endfunction

nnoremap cw ciw

tnoremap jj <C-\><C-n>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>
