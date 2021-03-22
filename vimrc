let mapleader =","

set encoding=utf-8
set confirm
set hidden
" Enable mouse
"set mouse=a

" Set Formatting options to format C/C++ comments easily.
set fo+=rocql

" --------------- Intendation and hilighting settings -------------
set hlsearch
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set cindent
set wrap

" ----------------- backup, swap, undo settings --------------------
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*
set backup
set writebackup
set noswapfile
set undofile
set history=100
set undolevels=100

" --------- TABS settings ----------
map  <C-n> :tabnew<CR>
map  <C-c> :tabclose<CR>
map  <C-h> :tabprevious<CR>
map  <C-j> :tabnext<CR>
map  <C-S-,> :tabprevious<CR>
map  <C-S-.>> :tabnext<CR>
"map  <S-RIGHT> :tabnext<CR>
"map  <S-LEFT> :tabprevious<CR>

"--------------- Buffer settings ----------------
map <C-k> :bn<CR>
map <C-l> :bp<CR>
map <C-x> :Bdelete<CR>
"nnoremap <silent> + :bn<CR>
"nnoremap <silent> _ :bp<CR>
"map ,d :Bdelete<CR>
"map ,d ::bd<CR>

"-----------  Mapping for ESC in home row -----------
inoremap <Leader>e <Esc>

"----------------- Zoom ------------
" zoom a split window
noremap <Leader>z <c-w>_ \| <c-w>\|
" unzoom
noremap <Leader>u <c-w>=

" ------------- TAG settings -----------
noremap  g 
"set tags=${SRCROOT}/tags-${FLAVOR}\ ${ROOT}/tags\ /sandbox/misc/b-tcdmedia-mainline4/srcroot/netflix/nrdp-gibbon/4.0/tags
set tags=${SRCROOT}/tags-${FLAVOR}\ ${ROOT}/tags\ ${SRCROOT}/tags
set tagrelative
"map <C-s> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-v> :vsp <CR><TAB>:exec("tag ".expand("<cword>"))<CR>


"------------------ Status line settings
"set statusline=%t\ %y\ [L:%l,C:%c]

" Display status line always
set laststatus=2

set wildignore="*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg.,*.po,*.so,*.a,*.po.d,*.d,*.o,*.nm"

"-------------- VIMDIFF colors ----------------
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Other color settings
"hi Search cterm=NONE ctermfg=white ctermbg=blue

"------------------------------- VundleVim settings: START ----------------------
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundleplugins')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'genutils'
Plugin 'idbrii/vim-perforce'
Plugin 'wincent/command-t'
Plugin 'majutsushi/tagbar'
"Plugin 'sickill/vim-monokai'
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'sjbach/lusty'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-bbye'
Plugin 'easymotion/vim-easymotion'
Plugin 'jdonaldson/vaxe'
Plugin 'scrooloose/nerdtree'
Plugin 'gkjgh/cobalt'
" All the  Vundle Plugins must be added before the following line
call vundle#end()
filetype plugin indent on 
" To ignore plugin indent changes, instead use:
"filetype plugin on
" ---------------- Tagbar settings
map <C-F10> :NERDTreeToggle<CR>
map <C-F11> :TagbarToggle<CR> 

" -------------------------- Command-T settings --------------
map <Leader>l ::CommandT<CR>
map <Leader>d ::CommandT <C-d> 
map <Leader>b  ::CommandTBuffer<CR>
map <Leader>m  ::CommandTMRU<CR>
map <Leader>ss  ::CommandTSearch<CR>
let g:CommandTMaxCachedDirectories=99999
let g:CommandTIgnoreCase=1
let g:CommandTMaxFiles=99999999
let g:CommandTMaxDepth=99999999
let g:CommandTMaxHeight=40
let g:CommandTAcceptSelectionSplitMap='<C-CR>'
let g:CommandTMatchWindowReverse=1
let g:CommandTHighlightColor="DiffAdd"
let g:CommandTSmartCase="true"
let g:CommandTFileScanner='find'
let g:CommandTWildIgnore=&wildignore
let g:CommandTTraverseSCM='pwd'

" -------------------------- Lusty settings -----------------------
map <Leader>e  ::LustyFilesystemExplorer<CR>
map <Leader>sb ::LustyBufferGrep<CR><C-W>

" -------------------------- Ack search settings ------------------
map <Leader>c  :silent Ack! --cc --cpp -s <C-R><C-W><CR>
map <Leader>w  :silent Ack! --cc --cpp -s 
map <Leader>f  :silent AckFile! -s 
map <Leader>ch  :silent Ack! -s <C-R><C-W><CR>
map <Leader>sh  :silent Ack! -s 

" Gundo plugin settings
if &diff
    "colorscheme monokai-phoenix
    colorscheme cobalt
else
    colorscheme cobalt
endif

set guifont=Monospace\ 16

" ----------------------- clipboard and global copy settings ---------------
map <Leader>g "+y
map .g viw,g
set clipboard=unnamed
"set clipboard^=unnamedplus

" ------------------------- GVIM settings -------------------
if has('gui_running')
    set guifont=Monospace\ 16
    "colorscheme monokai-phoenix
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set mouse=""
else
    " For transparent background
    hi Normal guibg=NONE ctermbg=NONE
endif


"---------------- J K mappings in command mode ---------------
cmap <C-j> <Down>
cmap <C-k> <Up>

" --------- Split -----------
map <Leader>v ::vsplit<CR><Tab>
map <Leader>h ::split<CR><Tab>
" Window navigation mapping
" map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
"map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
map <Tab> <C-W>W

" Setting rnu
set rnu
set nu

" ------------------ MISC settings ------------
let $P4DIFF="meld"
set noautochdir
" Display an incomplete command in the lower right corner of the Vim window
set showcmd
" Avoid Q bringing Ex mode
map Q gq
" nocompatible is not needed when vimrc is present
set nocompatible
"set backspace=2
syntax enable
"syntax on

" shellpipe to =>, to avoid leaking the output on terminal, for ex when using
" ack-grep
set shellpipe=>
set ttyfast "faster redrawing
set nolazyredraw " don't redraw while executing macros
map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Splitting windows and/or moving to the already split window.
"nmap <C-h> :call WinMove('h')<cr>
"nmap <C-j> :call WinMove('j')<cr>
"nmap <C-k> :call WinMove('k')<cr>
"nmap <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
"function! WinMove(key)
"    let t:curwin = winnr()
"    exec "wincmd ".a:key
"    if (t:curwin == winnr())
"        if (match(a:key,'[jk]'))
"            wincmd v
"        else
"            wincmd s
"        endif
"        exec "wincmd ".a:key
"    endif
"endfunction


function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

nnoremap <silent> qq :call QuickFix_toggle()<cr>

" to keep the clipboard content when exited
autocmd VimLeave * call system("xsel -ib", getreg('+'))

"hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
"hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi StatusLine cterm=bold ctermfg=blue ctermbg=none
hi StatusLineNC ctermfg=none ctermbg=none
