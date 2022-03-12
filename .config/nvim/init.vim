set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/autoload')
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'RRethy/nvim-base16'
Plug 'itchyny/lightline.vim'
" Plug 'junegunn/rainbow-parentheses.vim'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'
call plug#end()


if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
 endif

" set background=dark

" set termguicolors
colorscheme base16-default-dark
" colorscheme base16-ẗomorrow-night

""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set wildignore+=**/.git/*

set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number relativenumber 
set title

syntax on
set termguicolors

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/nvim/init.vim
" https://github.com/Optixal/neovim-init.vim/blob/master/init.vim
" https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/init.vim






" Swedish qwerty mapping
noremap j h
noremap k j
noremap l k
noremap ö l
noremap h /

" Y yanks from cursor to the EOL
nnoremap Y yg$

" Center curcor when joining lines
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" replace visual selection without yanking it
xnoremap p "_dP

" set undo break points while typing
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u


" cycle buffers with tab and shift-tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR> 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Want a different map leader than backslash 
let leader = ","
let mapleader = ","
let maplocalleader = ","

" ,-l inserts Numbered list in visual block
vnoremap <leader>l :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR><CR>
" ,-ö inserts alphabetized list in visual block
set nrformats+=alpha 
vnoremap <leader>ö :s/^\s*\zs/\=nr2char(char2nr('a')+(line('.') - line("'<"))).'. '<CR><CR>
" Press ,-f to turn off highlighting and clear any message already displayed.
nmap <silent><leader>f :silent :nohlsearch<CR>
" Fast saving
nmap <leader>w :w!<cr>
" Open Netrw in new window
nmap <leader>- :Vexplore<CR>
" autocmd filetype netrw noremap <buffer> o :Explore

" text mode: Make a list with ,-a
" autocmd FileType text nmap <leader>a :call AutoList()<CR>

""""""""""""""""""""""""""""""
" => Insert mode bindings
""""""""""""""""""""""""""""""
" Substitute the escape button for entering normal mode
inoremap jk <esc>
" kl = something
" inoremap kl <Enter>

" Paste from clipboard
noremap mk "+p
inoremap mkm <C-r>+

" calculate number (which is entered in command mode)
inoremap <leader>n <C-r>= 


inoremap jl <esc>o
inoremap möjl <esc>imöjl
inoremap mejl <esc>imejl

" inoremap JJ <esc>O<esc>O
inoremap JL <esc>O

" ,-z quits, saving file if buffer has been modified
noremap <leader>z :x<CR>

""""""""""""""""""""""""""""""
" => Normal mode bindings
"""""""""""""""""""""""""""""" 
" window navigation inot working very well - using <C-w><C-w> for now)
" nnoremap <C-j> <C-W><C-H>
" nnoremap <C-k> <C-W><C-J>
" nnoremap <C-l> <C-W><C-K>
" nnoremap <C-ö> <c-W><C-L>
" nnoremap <C-j> <C-W>h  
" nnoremap <C-k> <C-W>j  
" nnoremap <C-l> <C-W>k  
" nnoremap <C-ö> <c-W>l  
" noremap <C-w>j <C-w>h
" noremap <C-w>k <C-w>j
" noremap <C-w>l <C-w>k
" noremap <c-w>ö <c-w>l

" noremap Ö H " goto first line on screen
" noremap H ? " H searches backwards
" ()=? navigates sentences/blocks 
noremap = )
noremap ) (
noremap ( {
noremap ? }

" Commenting blocks of code.
" ,c comments while ,cc uncomments
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab,R     let b:comment_leader = '# '
autocmd filetype tex              let b:comment_leader = '% '
autocmd filetype mail             let b:comment_leader = '> '
autocmd filetype vim              let b:comment_leader = '" '
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"Saves time; maps the spacebar to colon
nmap <space> :

" K is opposite of J (split lines at cursor)
nmap K i<Enter><Esc>

" for coding, fold by indentation
" autocmd FileType sh,ruby,python,R,Rmd setlocal foldmethod=indent

" text mode: oo and OO starts a new paragraph below and above respectively
noremap oo o<cr>
noremap OO O<cr><up>

" L creates a fold by zf{motion} or {Visual}zf
"     - allows folding an arbitrary number of lines in visual mode!
" Ö opens a fold
" Å folds paragraph in the entire document
" _ resets to manual foldmethod and eliminates all folds
" Ä folds a single paragraph when fdm=manual
vnoremap L zf
noremap Ö zo
nmap Å :call ForceFoldExpr()<CR>
noremap _ :set foldmethod=manual<CR>zE
nmap Ä zfap

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" augroup netrw_configuration
"   autocmd!
"   autocmd FileType netrw call s:ConfigureNetrw()
" augroup end

" W to paste the current working directory with forward slashes
noremap W :exe ":normal i" . substitute(getcwd(),"\\","/","g") <CR>

" ,-e reopens the last closed window (vertical split alternate file)
noremap <leader>e :vs#<CR>

""""""""""""""""""""""""""""""
" => Visual mode bindings
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" mk yanks to clipboard in visual mode
vnoremap mk "+y


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Appearance
" set transparency=0

" Keep a longer history
set history=1000

" Enable extended % matching
runtime macros/matchit.vim

" C style indentation
:set cindent
 
" Intuitive backspacing in insert mode
" set backspace=indent,eol,start

