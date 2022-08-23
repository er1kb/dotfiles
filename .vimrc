" call plug#begin('C:/Program Files (x86)/Vim/vimfiles/plugged')

call plug#begin('.vim/pack/')
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/csv.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'frazrepo/vim-rainbow' 
Plug 'chriskempson/base16-vim'
Plug 'junegunn/rainbow-parentheses.vim' 
" Plug 'Yggdroot/indentLine' 
" Plug 'sheerun/vim-wombat-scheme'
" Plug 'jalvesaq/Nvim-R'
" Plug 'tpope/vim-surround'
" Plug 'mikewootc/vim-gtd'
" Plug 'junegunn/vim-easy-align' 
" Plug 'michaeljsmith/vim-indent-object'

" Plug 'tpope/vim-vinegar'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" " ncm2 completion sources:  
" Plug 'gaalcaras/ncm-R'
" Plug 'sirver/UltiSnips'
" " Vim 8 only (ncm-R)
" if !has('nvim')
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'

call plug#end() 

" Plug 'dracula/vim', { 'as': 'dracula' }
" :PlugInstall

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
    source ~/.vimrc_background
 endif

" set background=dark

" set termguicolors
colorscheme base16-default-dark

" set background=light
" colorscheme solarized

set encoding=utf-8
" let g:python3_host_prog = 'C:\Users\eribro\AppData\Local\Programs\Python\Python38-32\python.exe'
" let g:python3_host_prog = 'C:\WINDOWS\py.exe'

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

" lightline
let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\     }
\ }
 
" KEY BINDINGS

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
autocmd FileType text nmap <leader>a :call AutoList()<CR>

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




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General / UI settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" R-vim
" helptags ~/.vim/doc

set nocp
filetype plugin on 
" Tab specific option
set tabstop=4                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs

"Enable code folding
set foldenable
set foldmethod=manual

" Stifle many interruptive prompts & turn off sound 
set shortmess=atI 
" set visualbell

set backup
set backupdir=~/.vim/.backups

" Maintain more context around the cursor when scrolling
set scrolloff=3

"Forget compatibility with Vi. Who cares.
set nocompatible

" disable swap files
set noswapfile

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
" set ruler

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Menlo:h14


"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Relative line numbering
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch
highlight Search cterm=bold 
highlight Search term=bold 
highlight Search ctermfg=black
highlight Search ctermbg=white

" case insensitive search
set ignorecase
set smartcase

"show matching brackets
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw 

"Hide MacVim toolbar by default
" set go-=T

set cursorline

"Hide mouse when typing
set mousehide

" Create dictionary for custom expansions
" set dictionary+=/Users/jeff_way/.vim/dict.txt

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Load the current buffer in Firefox - Mac specific.
abbrev ff :! open -a firefox.app %:p<cr>

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

let g:vim_json_syntax_conceal = 0

" always split windows vertically
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif

" Netrw settings
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" NVim-R remapping
autocmd FileType R,Rmd nmap ,l <Plug>RDSendLines
autocmd FileType R,Rmd vmap ,l <Plug>RDSendSelection
vmap ,d <Plug>RESendSelection  " with echo


" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


function ForceFoldExpr()
   set foldenable
   set fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
   set foldmethod=expr
endfunction


function AutoList()
   let cur_line = line(".")
   let cur_ind = indent(cur_line)
   let new_ind = cur_ind
   let line = cur_line
   let sw = &shiftwidth
   let incr_alp = 'a'
   let ind_nr = []
   let ind_alp = []
   let ind_ast = []
   let ind_hyp = []
   while indent(line) >= cur_ind
      if new_ind == cur_ind
         :call add(ind_nr, line)
      elseif new_ind == (cur_ind + sw)
         :call add(ind_alp, line)
      elseif new_ind == (cur_ind + (sw * 2))
         :call add(ind_ast, line)
      elseif new_ind == (cur_ind + (sw * 3))
         :call add(ind_hyp, line)
      endif
      let line = line + 1
      let new_ind = indent(line)
   endw
   for i in range(len(ind_nr))
      exe "normal " . ind_nr[i] . "GI" . (i+1) . ". \<esc>"
   endfor
   for i in range(len(ind_alp))
      exe "normal " . ind_alp[i] . "GI" . incr_alp . ". \<esc>"
      let incr_alp = nr2char(char2nr(incr_alp) + 1)
   endfor
   for i in range(len(ind_ast))
      exe "normal " . ind_ast[i] . "GI" . "* \<esc>"
   endfor
   for i in range(len(ind_hyp))
      exe "normal " . ind_hyp[i] . "GI" . "- \<esc>"
   endfor
endfunction


" function! NetrwMapping()
"     noremap <buffer> o <CR>
" endfunction

" Extending VIM's text object
" https://www.youtube.com/watch?v=0F4FgiVWvB8
let pairs = { ":" : ":", 
            \ "." : ".",
            \ "<bar>" : "<bar>" }
for [key, value] in items(pairs)
      exe "nnoremap ci".key." T".key."ct".value
      exe "nnoremap ca".key." T".key."cf".value
      exe "nnoremap vi".key." T".key."vt".value
      exe "nnoremap va".key." T".key."vf".value
      exe "nnoremap di".key." T".key."dt".value
      exe "nnoremap da".key." T".key."df".value
      exe "nnoremap yi".key." T".key."yt".value
      exe "nnoremap ya".key." T".key."yf".value
endfor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Helpful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:gtd_gtdfiles = ["C:\Program Files (x86)\Vim\vimfiles\plugged\vim-gtd\test", "~/my.gtd", "~/my2.gtd"]
"     Set the gtd file list so you can open them all by command :Gtdo
"     default: ["~/.my_vimgtd.gtd"]
let g:gtd_auto_check_overdue = 0
"     If set to 1, then the plugin will check if task overdue automatically
"     when opening gtd file.
"     default: 0
let g:gtd_check_overdue_auto_save = 0
"     If set to 1, then gtd file will automatically be saved after check-overdue.
"     default: 0
let g:task_list_with_parents = 1
"     If set to 1, then task list would show with its parents.
"     If set to 0, then task list would only show the task itself.
"     default: 1
let g:gtd_emergency_days = 7
"     Set the days that would considered as emergency if the interval
"     from today to the planned date is less than this value.
"     default: 7

" Alphabetically sort CSS properties in file with :SortCSS
" :command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Saves file when Vim window loses focus
" au FocusLost * :wa

" No more stretching for navigating files
"noremap h ;
"noremap j h
"noremap k gj
"noremap l gk
"noremap ; l

" print empty <a> tag
" map! ;h <a href=""></a><ESC>5hi

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menuone
" noremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
