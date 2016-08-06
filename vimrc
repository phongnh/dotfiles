" No Vi Compatibility
if &compatible
    set nocompatible
endif

if &shell =~# 'fish$'
    set shell=bash
endif

" Use true color feature
" if exists('+termguicolors')
"     set termguicolors
" endif

" Set augroup
augroup MyAutoCmd
    autocmd!
augroup END

" Disable system plugins
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_logipath          = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
" let g:loaded_spellfile_plugin  = 1
let g:loaded_rrhelper          = 1
let g:myscriptsfile            = 1
let g:load_doxygen_syntax      = 0
let g:loaded_less              = 1

" Disable sql completion and mappings
let g:loaded_sql_completion    = 1
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key    = ''

" Disable syntax completion
let g:loaded_syntax_completion = 1

if has('gui_running')
    " Disable menu
    let g:did_install_default_menus = 1
    let g:did_install_syntax_menu   = 1

    if has('gui_macvim')
        set guioptions+=M
    else
        " System menu is not sourced
        set guioptions-=M
    endif
endif

call plug#begin()

" rsi.vim: Readline style insertion
Plug 'tpope/vim-rsi'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Interactive command execution
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Set vim cursor for iTerm
Plug 'phongnh/vim-iterm-cursor'

" A fancy start screen
Plug 'mhinz/vim-startify'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" projectionist.vim: project configuration
Plug 'tpope/vim-projectionist'

" CtrlP
if has('python')
    Plug 'FelikZ/ctrlp-py-matcher'

    if executable('cmake')
        Plug 'nixprime/cpsm', { 'do': './install.sh' }
    endif
endif
Plug 'ctrlpvim/ctrlp.vim'
Plug 'phongnh/ctrlp-finder'
Plug 'h14i/vim-ctrlp-buftab'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'tacahiroy/ctrlp-funky'
Plug 'https://bitbucket.org/slimane/ctrlp-locationlist'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'ompugao/ctrlp-history'
Plug 'mattn/ctrlp-register'

" logging registers and reusing them
Plug 'LeafCage/yankround.vim'

if executable('ctags')
    " A class outline viewer for Vim
    Plug 'majutsushi/tagbar'
    Plug 'phongnh/vim-tagbar-settings'
endif

if has('python')
    " Visualize your Vim undo tree
    Plug 'sjl/gundo.vim'
else
    " The ultimate undo history visualizer for VIM
    Plug 'mbbill/undotree'
endif

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

if has('python')
    " Provide easy code formatting in Vim by integrating existing code formatters.
    Plug 'Chiel92/vim-autoformat'
endif

" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer'

" Maximize current buffer
Plug 'regedarek/ZoomWin'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

if has('conceal')
    " A vim plugin to display the indention levels with thin vertical lines
    Plug 'Yggdroot/indentLine'
else
    " A Vim plugin for visually displaying indent levels in code
    Plug 'nathanaelkane/vim-indent-guides'
endif

" Delete buffers and close files in Vim without closing your windows or messing up your layout
Plug 'moll/vim-bbye'

" Delete unwanted whitespace at the end of lines
Plug 'vim-scripts/DeleteTrailingWhitespace'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'
" Phong's vim command helpers
Plug 'phongnh/vim-command-helpers'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Toggle useful settings
Plug 'phongnh/vim-toggler'

" Vim plugin to copy current editing file path to clipboard (if support)
Plug 'phongnh/vim-copypath'

" Simple highlight plugin
Plug 'phongnh/vim-simple-highlight'

" extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'
" Vim search status
Plug 'osyo-manga/vim-anzu'

" My vim functions for search and substitue
Plug 'phongnh/vim-search-helpers'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug 'chrisbra/NrrwRgn'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Plugin to move lines and selections up and down
Plug 'matze/vim-move'

" A vim plugin that simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'

" Smart selection of the closest text object
Plug 'gcmt/wildfire.vim'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'                  " l
Plug 'kana/vim-textobj-indent'                " i
Plug 'kana/vim-textobj-entire'                " e
Plug 'glts/vim-textobj-comment'               " c
Plug 'mattn/vim-textobj-url'                  " u
Plug 'Julian/vim-textobj-variable-segment'    " v
Plug 'rhysd/vim-textobj-anyblock'             " b
Plug 'rhysd/vim-textobj-conflict'             " =
Plug 'thinca/vim-textobj-between'             " f{char}, remapped to n{char}
Plug 'sgur/vim-textobj-parameter'             " ,
Plug 'whatyouhide/vim-textobj-xmlattr'        " x
Plug 'rhysd/vim-textobj-ruby'                 " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
Plug 'whatyouhide/vim-textobj-erb'            " E, remapped to y
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript' " f
Plug 'poetic/vim-textobj-javascript'          " c, remapped to j

" A Vim plugin that provides a completion function for Unicode glyphs
Plug 'chrisbra/unicode.vim'

" Code completion and Snippets
if has('lua')
    Plug 'Shougo/context_filetype.vim'
    Plug 'Shougo/neocomplete.vim'
    Plug 'justmao945/vim-clang'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'
elseif has('python')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
else
    Plug 'ajh17/VimCompletesMe'
endif

" SCM
" An awesome Git wrapper so awesome
Plug 'tpope/vim-fugitive'

" A powerful Git log viewer
Plug 'cohama/agit.vim'

" Show a diff via Vim sign column
Plug 'mhinz/vim-signify'

" Tmux
if exists("$TMUX")
    Plug 'jebaum/vim-tmuxify'
endif

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Ruby / Rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-turbux'

" Web
Plug 'mattn/emmet-vim'
Plug 'gregsexton/MatchTag'

" JavaScript / NodeJS
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/vim-go-stdlib'  " go standard library syntax highlighting
Plug 'garyburd/go-explorer' " go get github.com/garyburd/go-explorer/src/getool

" An implementation of Sublime's PlainTasks plugin for Vim
Plug 'elentok/plaintasks.vim'

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" Zeal for Vim
Plug 'KabbAmine/zeavim.vim'

" Color schemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'

call plug#end()

" Make ESC respond faster
set ttimeout
set ttimeoutlen=50

set visualbell               " Use visual bell instead of beeping

set nomodeline               " Don't parse modelines because of vim modeline vulnerability

set lazyredraw               " Do not redraw while macro executing
set ttyfast

set mouse=a                  " Enable mouse in every mode
set mousehide                " Hide mouse pointer while typing
set mousemodel=popup         " Right mouse button pops up a menu

set encoding=utf-8           " Default encoding for saving and reading file
set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac
set nrformats=hex

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=1000

" Enable virtualedit in visual block mode
set virtualedit=block

set backspace=indent,eol,start  " Enable backspace delete indent and newline

set hidden      " Allow buffer switching without saving
set autoread    " Auto-reload if file is saved externally

set showmatch       " Automatically highlight matching braces/brackets/etc
set cpoptions-=m    " Highlight when CursorMoved
set matchpairs+=<:> " Highlight <>
set matchtime=1

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters
set incsearch   " Enable incremental search
set hlsearch    " Highlight searche result

" Default indent settings
set tabstop=4 shiftwidth=4

set autoindent
set smartindent
set shiftround  " Round indent by shiftwidth
set smarttab    " Smart insert / delete tab
set expandtab   " Expand tab to space

set foldmethod=indent   " Fold by indent
set foldlevel=1         " Starting fold level
set foldnestmax=99      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default

set fillchars=diff:⣿,vert:│

set grepformat=%f:%l:%c:%m,%f:%l:%m

" Turn off swapfile and backup
set noswapfile
set nobackup
set nowritebackup
set directory=~/.cache/swap
set backupdir=~/.cache/backup

if has('persistent_undo')
    set undofile
    set undodir=~/.cache/undo
endif

set scrolloff=0                 " Minimal number of screen lines to keep above and below the cursor
set sidescroll=1                " The minimal number of columns to scroll horizontally
set sidescrolloff=15            " The minimal number of screen columns to keep to the left and to the right of the cursor

" Display tabs and trailing spaces
set listchars=tab:>\ ,trail:-,nbsp:+,extends:>,precedes:<

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=2 concealcursor=i
endif

set display+=lastline           " When a line is long, do not omit it in @

" Wrap conditions
set whichwrap+=h,l,<,>,[,],b,s,~

if has('linebreak')
    set linebreak                   " Wrap lines at convenient point
    let &showbreak='↪ '
    set breakat=\ \	;:,!?
    if exists('+breakindent')
        set breakindent
    endif
endif

set formatoptions+=1            " Don't break a line after a one-letter word
if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j        " Delete comment character when joining commented lines
endif

set laststatus=2                " Always display statusline

" set showcmd                     " Show (partial) command in the last line of the screen
set cmdheight=2                 " Height of command-line (easy-readable)

set undolevels=1000             " Maximum number of changes that can be undone
set history=1000                " Store lots of command lines in history

" Completion settings
set completeopt=menuone,noselect
set complete=.,w,b,u,t
set pumheight=20                " Set popup menu max height

set wildmenu
set wildmode=list:longest,full
" Ingore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.dat

" Adjust window size of preview and help
set previewheight=12
set helpheight=12

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new window right the current one

set t_Co=256                    " Enable 256 colors

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Remember where we are, support yankring
set viminfo^=!

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Map leader
let g:mapleader      = ' '
let g:maplocalleader = '\'

" Disable arrows
nnoremap <Left>  <Nop>
nnoremap <Down>  <Nop>
nnoremap <Up>    <Nop>
nnoremap <Right> <Nop>

" F1: Help
nnoremap <F1> :help<Space>
imap     <F1> <Esc><F1>

" CTRL-Space: Show history
cnoremap <C-@> <C-f>

" CTRL-V: Paste from clipboard
cnoremap <C-v> <C-r>+

" Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" CTRL-T: Insert tab
inoremap <silent> <C-t> <C-v><Tab>

" Jump to last active buffer
inoremap <C-^> <C-c><C-^>
" inoremap <C-^> <C-c>:update<CR><C-^>

" Q: Disable Ex-mode. qq to record, Q to replay (remapped)
nmap Q @q

" gQ: Q (remapped)
nnoremap gQ Q

" .: repeats the last command on every line
xnoremap . :normal .<CR>

" @: repeats macro on every line
xnoremap @ :normal @

" After indenting code, does not exit Visual mode
xnoremap > >gv
xnoremap < <gv

xmap <Tab>   >
xmap <S-Tab> <

" Indent whole file
nnoremap g= gg=G``

" gi already moves to "last place you exited insert mode"
" gI: Move to last change (remapped)
nnoremap gI `.`

" gV: Select the text that was last edited/pasted (remapped)
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" U: Redo (remapped)
nnoremap U :redo<CR>

" Y: Yank to end line (remapped)
nnoremap Y y$

" Folding
" If press h on head, fold close
"nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'

" If press h on head, range fold close
"xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press l on fold, range fold open
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

nnoremap <silent> zr zr:echo 'foldlevel = ' . &foldlevel<CR>
nnoremap <silent> zm zm:echo 'foldlevel = ' . &foldlevel<CR>
nnoremap <silent> zR zR:echo 'foldlevel = ' . &foldlevel<CR>
nnoremap <silent> zM zM:echo 'foldlevel = ' . &foldlevel<CR>

nnoremap <silent> z] :let &foldcolumn = &foldcolumn + 1<CR>:echo 'foldcolumn = ' . &foldcolumn<CR>
nnoremap <silent> z[ :let &foldcolumn = &foldcolumn - 1<CR>:echo 'foldcolumn = ' . &foldcolumn<CR>

" Next/previous window
nnoremap <silent> ]w :wincmd w<CR>
nnoremap <silent> [w :wincmd W<CR>

nmap <Tab>   <C-w>w
nmap <S-Tab> <C-w>W

" Buffer-related mappings
" gl: Go to Last buffer
nnoremap <silent> gl :buffer#<CR>

" Reload buffer
nnoremap <silent> <Leader>br :edit<CR>
nnoremap <silent> <Leader>bR :edit!<CR>

" Unload and Delete buffer
nnoremap <silent> <Leader>bq :bdelete<CR>
nnoremap <silent> <Leader>bQ :bdelete!<CR>

" Save buffer
nnoremap <silent> <C-s> :update<CR>
vmap              <C-s> <Esc><C-s>gv
imap              <C-s> <Esc><C-s>

nnoremap <silent> <Leader>bw :update<CR>
vmap              <Leader>bw <Esc><Leader>bwgv

" Exit Vim. Bring up a prompt when some buffers have been changed
nnoremap <silent> ZC :confirm qall<CR>

" Use <C-\><C-\> to do <C-]> but open it in a new split
nmap <C-\><C-\> <C-w>v<C-]>zvzz

" Quickfix
nnoremap <silent> <Leader>qo :copen<CR>
nnoremap <silent> <Leader>qc :cclose<CR>
nnoremap <silent> <Leader>qn :cnext<CR>
nnoremap <silent> <Leader>qp :cprevious<CR>
nnoremap <silent> <Leader>qf :cfirst<CR>
nnoremap <silent> <Leader>ql :clast<CR>

" Location List
nnoremap <silent> <Leader>lo :lopen<CR>
nnoremap <silent> <Leader>lc :lclose<CR>
nnoremap <silent> <Leader>ln :lnext<CR>
nnoremap <silent> <Leader>lp :lprevious<CR>
nnoremap <silent> <Leader>lf :lfirst<CR>
nnoremap <silent> <Leader>ll :llast<CR>

" Search and Replace
nnoremap <Leader>R  :%s//gc<Left><Left><Left>
nnoremap <Leader>sr :%s/<C-r>=GetWordForSubstitute()<CR>/gc<Left><Left><Left>

xnoremap <Leader>R  :s/\%V/gc<Left><Left><Left>
xnoremap <Leader>sr <Esc>:%s/<C-r>=GetSelectedTextForSubstitute()<CR>//gc<Left><Left><Left>

" Copy / cut to clipboard
nmap cy "+y
nmap cx "+d

" Copy yanked text to clipboard
nnoremap <silent> cY :let [@+, @*] = [@", @"]<CR>

xmap gy "+y
" Overwrite netrw-gx behavior
xmap gx "+d

" Paste from clipboard
nnoremap <silent> cp  "+p
nnoremap <silent> cP  "+P
nnoremap <silent> cgp "+gp
nnoremap <silent> cgP "+gP
nnoremap <silent> c=p o<Esc>"+pm``[=`]``^
nnoremap <silent> c=P O<Esc>"+Pm``[=`]``^
nnoremap <silent> c=v :set paste<CR>"+p:set nopaste<CR>
nnoremap <silent> c=V :set paste<CR>"+P:set nopaste<CR>

inoremap <silent> <C-v> <C-g>u<C-o>"+gP

" Redraw
nnoremap <silent> <C-l> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>

" Meta workround
if !has('gui_running') && !has('nvim')
    " jiangmiao/auto-pairs
    execute "set <M-a>=\<Esc>a"
    execute "set <M-g>=\<Esc>g"
    execute "set <M-w>=\<Esc>w"
    execute "set <M-i>=\<Esc>i"

    " matze/vim-move
    execute "set <M-j>=\<Esc>j"
    execute "set <M-k>=\<Esc>k"

    " gcmt/wildfire.vim
    execute "set <M-h>=\<Esc>h"
    execute "set <M-l>=\<Esc>l"
    execute "set <M-s>=\<Esc>s"

    " Shougo/neocomplete.vim
    execute "set <M-/>=\<Esc>\/"
endif

" junegunn/vim-plug
nnoremap <silent> <Leader>ua :PlugUpgrade<CR>:PlugUpdate<CR>
nnoremap <silent> <Leader>up :PlugUpdate<CR>

" vim-airline/vim-airline
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tmuxline#enabled   = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#windowswap#enabled = 0
let g:airline#extensions#anzu#enabled       = 0

let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#tab_nr_type    = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod       = ':t'

let g:airline_powerline_fonts = 0

let g:airline_left_sep                        = ''
let g:airline_left_alt_sep                    = '|'
let g:airline_right_sep                       = ''
let g:airline_right_alt_sep                   = '|'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.readonly   = 'RO'
let g:airline_symbols.paste      = 'PASTE'
let g:airline_symbols.whitespace = '*'

call airline#parts#define('mode', {
            \ 'function': 'AirlineModeAndClipboard',
            \ 'accent':   'bold'
            \ })

function! AirlineModeAndClipboard() abort
    return airline#parts#mode() . (match(&clipboard, 'unnamed') > -1 ? ' @' : '')
endfunction

autocmd MyAutoCmd VimEnter * set showtabline=1 noshowmode

" mhinz/vim-startify
let g:startify_skiplist = [
            \ '.git/index',
            \ '.git/config',
            \ 'COMMIT_EDITMSG',
            \ 'git-rebase-todo',
            \ escape(fnamemodify($VIMRUNTIME, ':p'), '\') . 'doc',
            \ ]

let g:startify_enable_special     = 0
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 0
let g:startify_relative_path      = 1
let g:startify_update_oldfiles    = 1
let g:startify_show_sessions      = 1
let g:startify_custom_header      = [] " Disable random quotes header

nnoremap <silent> <F5> :Startify<CR>
imap              <F5> <Esc><F5>

nnoremap <silent> <Leader>us :Startify<CR>

augroup MyAutoCmd
    autocmd FileType startify setlocal nofoldenable foldcolumn=0
    autocmd User Startified setlocal buftype=
augroup END

" scrooloose/nerdtree
let g:NERDTreeWinSize       = 35
let g:NERDTreeMouseMode     = 2
let g:NERDTreeMapChangeRoot = '.' " Map . for changing root in NERDTree
let g:NERDTreeQuitOnOpen    = 0
let g:NERDTreeChDirMode     = 0
let g:NERDTreeShowBookmarks = 1

nnoremap <silent> <F9> :NERDTreeToggle<CR>
imap              <F9> <Esc><F9>

nnoremap <silent> <F10> :NERDTreeFind<CR>
imap              <F10> <Esc><F10>

nnoremap <silent> <Leader>fo :NERDTreeToggle<CR>
nmap              <Leader>bp <Leader>fo
nnoremap <silent> <Leader>bf :NERDTreeFind<CR>

if has_key(g:plugs, 'ctrlp-py-matcher')
    " FelikZ/ctrlp-py-matcher
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_max_files           = 0
    let g:ctrlp_match_func          = { 'match': 'pymatcher#PyMatch' }

    if has_key(g:plugs, 'cpsm') && filereadable(g:plugs['cpsm']['dir'] + 'autoload/cpsm_py.so')
        " nixprime/cpsm
        let g:cpsm_highlight_mode = 'basic'
        let g:ctrlp_match_func    = { 'match': 'cpsm#CtrlPMatch' }
    endif
endif

" ctrlpvim/ctrlp.vim
let g:ctrlp_match_window      = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_map               = ''
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window      = 'startify'
let g:ctrlp_prompt_mappings   = { 'MarkToOpen()': ['<C-z>', '<C-@>'], }
let g:ctrlp_custom_ignore     = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc'
            \ }

if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif has('win32') || has('win64')
    let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif

let g:ctrlp_use_caching  = 0
let g:ctrlp_user_command = {
            \ 'types': {
            \   1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
            \   2: ['.hg',  'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
            \ }

nnoremap <silent> <Leader>- :CtrlPClearAllCaches<CR>

nnoremap <silent> <Leader><Leader> :CtrlPMixed<CR>

nnoremap          <Leader>F  :CtrlP<Space>
nnoremap <silent> <Leader>ff :CtrlP<CR>
nmap              <Leader>o  <Leader>ff

nnoremap <silent> <Leader>fp :CtrlPRoot<CR>

nnoremap <silent> <Leader>fc :CtrlPCurFile<CR>
nnoremap <silent> <Leader>fC :CtrlP <C-r>=expand("%:h:h")<CR><CR>
nmap              <Leader>O  <Leader>fc

nnoremap <silent> <Leader>fr :CtrlPMRUFiles<CR>

nnoremap          <Leader>D  :CtrlPDir<Space>
nnoremap <silent> <Leader>fd :CtrlPDir<CR>

nnoremap <silent> <Leader>fb :CtrlPBuffer<CR>

nnoremap <silent> <Leader>fk :CtrlPBookmarkDir<CR>
nnoremap          <Leader>fK :CtrlPBookmarkDirAdd!<Space>

nnoremap <silent> <Leader>\ :CtrlPTag<CR>

nnoremap <silent> <Leader>fq :CtrlPQuickfix<CR>

nmap              <Leader>bb <Leader>fb
nmap              <Leader>bc <Leader>fc
nmap              <Leader>bC <Leader>fC
nnoremap <silent> <Leader>bl :CtrlPLine %<CR>
nnoremap <silent> <Leader>bL :CtrlPLine<CR>
nnoremap <silent> <Leader>bt :CtrlPBufTag<CR>
nnoremap <silent> <Leader>bT :CtrlPBufTagAll<CR>

" phongnh/ctrlp-finder
nnoremap <silent> <Leader>fe :CtrlPFinder<CR>

" h14i/vim-ctrlp-buftab
nnoremap <silent> <Leader>fB :CtrlPBufTab<CR>

" DavidEGx/ctrlp-smarttabs
nnoremap <silent> <Leader>ft :CtrlPSmartTabs<CR>

" tacahiroy/ctrlp-funky
nnoremap <silent> <Leader>bo :CtrlPFunky<CR>
nnoremap <silent> <Leader>bO :CtrlPFunkyMulti<CR>

" slimane/ctrlp-locationlist
nnoremap <silent> <Leader>fl :CtrlPLocationlist<CR>

" fisadev/vim-ctrlp-cmdpalette
nnoremap <silent> <Leader>; :CtrlPCmdPalette<CR>

" ompugao/ctrlp-history
nnoremap <silent> <Leader>: :CtrlPCmdHistory<CR>
nnoremap <silent> <Leader>/ :CtrlPSearchHistory<CR>

" mattn/ctrlp-register
nnoremap <silent> <Leader>Y :CtrlPRegister<CR>

" LeafCage/yankround.vim
let g:yankround_max_history = 100

nnoremap <silent> <Leader>y :CtrlPYankRound<CR>

if has_key(g:plugs, 'tagbar')
    " majutsushi/tagbar
    let g:tagbar_sort      = 0
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 0
    let g:tagbar_iconchars = ['▸', '▾']

    nnoremap <silent> <F8> :TagbarToggle<CR>
    imap              <F8> <Esc><F8>

    nnoremap <silent> <Leader>ut :TagbarToggle<CR>
endif

if has_key(g:plugs, 'gundo.vim')
    " sjl/gundo.vim
    let g:gundo_right          = 1
    let g:gundo_width          = 30
    let g:gundo_preview_bottom = 1
    let g:gundo_preview_height = 18
    let g:gundo_auto_preview   = 0

    nnoremap <silent> <F7> :GundoToggle<CR>
    imap              <F7> <Esc><F7>

    nnoremap <silent> <Leader>uu :GundoToggle<CR>
else
    " mbbill/undotree
    let g:undotree_WindowLayout       = 'botright'
    let g:undotree_SetFocusWhenToggle = 1

    nnoremap <silent> <F7> :UndotreeToggle<CR>
    imap              <F7> <Esc><F7>

    nnoremap <silent> <Leader>uu :UndotreeToggle<CR>
endif

" scrooloose/syntastic
let g:syntastic_mode_map                 = { 'mode': 'passive', 'active_filetypes': [], }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height          = 5
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_aggregate_errors         = 1
let g:syntastic_error_symbol             = '>>'
let g:syntastic_style_error_symbol       = 'S>'
let g:syntastic_warning_symbol           = '!!'
let g:syntastic_style_warning_symbol     = 'S!'

nnoremap <silent> <F6> :SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>
imap              <F6> <Esc><F6>

nnoremap <silent> <Leader>bs :SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>
nnoremap          <Leader>bS :SyntasticCheck<Space>

if has_key(g:plugs, 'vim-autoformat')
    " Chiel92/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    nnoremap <silent> <Leader>af :Autoformat<CR>:update<CR>
    nnoremap          <Leader>aF :Autoformat<Space>
endif

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1

nnoremap <silent> gb :ToggleBufExplorer<CR>
nnoremap <silent> <Leader>be :ToggleBufExplorer<CR>

" regedarek/ZoomWin
nnoremap <silent> <F2> :ZoomWin<CR>
vmap              <F2> <Esc><F2>gv
imap              <F2> <Esc><F2>a

nnoremap <silent> <Leader>z :ZoomWin<CR>
vnoremap          <Leader>z <Esc><Leader>zgv

" junegunn/goyo.vim
let g:goyo_width  = '80%'
let g:goyo_height = '96%'
let g:goyo_linenr = 0

nnoremap <silent> <F3> :Goyo<CR>
imap              <F3> <Esc><F3>

nnoremap <silent> <Leader><CR> :Goyo<CR>
vmap              <Leader><CR> <Leader><CR>gv

autocmd! User GoyoEnter nested call <SID>custom_goyo_enter()
autocmd! User GoyoLeave nested call <SID>custom_goyo_leave()

function! s:custom_goyo_enter() abort
    let s:goyo_settings = {
                \ 'showmode':    &showmode,
                \ 'linespace':   &linespace,
                \ 'scrolloff':   &scrolloff,
                \ }

    if has('fullscreen')
        set fullscreen
    endif

    if &linespace == 0
        set linespace=5
    endif
    set scrolloff=999
    set showmode
endfunction

function! s:custom_goyo_leave() abort
    if has('fullscreen')
        set nofullscreen
    endif

    for [k, v] in items(s:goyo_settings)
        execute printf('let &%s = %s', k, string(v))
    endfor
endfunction

if has_key(g:plugs, 'indentLine')
    " Yggdroot/indentLine
    let g:indentLine_enabled              = 0
    let g:indentLine_char                 = '│'
    let g:indentLine_first_char           = g:indentLine_char
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_noConcealCursor      = 1
    let g:indentLine_color_term           = 239
    " let g:indentLine_color_gui            = '#A4E57E'

    nnoremap <silent> <F4> :IndentLinesToggle<CR>
    vmap              <F4> <Esc><F4>gv
    imap              <F4> <Esc><F4>a

    nnoremap <silent> <Leader>bi :IndentLinesToggle<CR>
    vmap              <Leader>bi <Esc><Leader>bigv
else
    " nathanaelkane/vim-indent-guides
    let g:indent_guides_start_level           = 1
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_color_change_percent  = 3

    nnoremap <silent> <F4> :IndentGuidesToggle<CR>
    vmap              <F4> <Esc><F4>gv
    imap              <F4> <Esc><F4>a

    nnoremap <silent> <Leader>bi :IndentGuidesToggle<CR>
    vmap              <Leader>bi <Esc><Leader>bigv
endif

" moll/vim-bbye
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>

nnoremap <silent> <Leader>bd :Bdelete<CR>
nnoremap <silent> <Leader>bD :Bdelete!<CR>

" vim-scripts/DeleteTrailingWhitespace
nnoremap <silent> <Leader>dw :update<CR>:DeleteTrailingWhitespace<CR>
xnoremap <silent> <Leader>dw :DeleteTrailingWhitespace<CR>

" justinmk/vim-sneak
let g:sneak#streak = 1

" haya14busa/incsearch.vim
" let g:incsearch#magic                             = '\v'
let g:incsearch#auto_nohlsearch                   = 1
let g:incsearch#do_not_save_error_message_history = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" osyo-manga/vim-anzu
map n  <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)zzzv
map N  <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)zzzv
map *  <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)zzzv
map #  <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)zzzv

" dyng/ctrlsf.vim
let g:ctrlsf_populate_qflist = 1

nmap <Leader>sq <Plug>CtrlSFQuickfixPrompt
nmap <Leader>sp <Plug>CtrlSFPrompt
nmap <Leader>sf <Plug>CtrlSFCwordExec
vmap <Leader>sf <Plug>CtrlSFVwordExec
nmap <Leader>sF <Plug>CtrlSFCwordPath
vmap <Leader>sF <Plug>CtrlSFVwordPath
nmap <Leader>s/ <Plug>CtrlSFPwordExec
nmap <Leader>s/ <Plug>CtrlSFPwordPath
nnoremap <silent> <Leader>su :CtrlSFUpdate<CR>
nnoremap <silent> <Leader>so :CtrlSFToggle<CR>

" mhinz/vim-grepper
let g:grepper = {
            \ 'open': 1,
            \ 'switch': 1,
            \ 'jump': 0,
            \ 'next_tool': '<C-j>',
            \ 'tools': ['ag', 'pt', 'git', 'ack', 'grep', 'findstr'],
            \ }

nmap <silent> gs <Plug>(GrepperOperator)
xmap <silent> gs <Plug>(GrepperOperator)

nnoremap <silent> <Leader>S  :Grepper<CR>
nnoremap <silent> <Leader>ss :echo 'Searching...'<CR>:Grepper -cword -noprompt<CR>
xnoremap <silent> <Leader>ss <Esc>:echo 'Searching...'<CR>:Grepper -noprompt -query <C-r>=GetSelectedTextForGrepper()<CR><CR>

nnoremap <silent> <Leader>G  :Grepper -noquickfix<CR>
nnoremap <silent> <Leader>sg :echo 'Searching...'<CR>:Grepper -noquickfix -cword -noprompt<CR>
xnoremap <silent> <Leader>sg <Esc>:echo 'Searching...'<CR>:Grepper -noquickfix -noprompt -query <C-r>=GetSelectedTextForGrepper()<CR><CR>

nmap <Leader>Q  <Leader>S
nmap <Leader>qs <Leader>ss
xmap <Leader>qs <Leader>ss

nmap <Leader>L  <Leader>G
nmap <Leader>ls <Leader>sg
xmap <Leader>ls <Leader>sg

" chrisbra/NrrwRgn
let g:nrrw_topbot_leftright  = 'belowright'
let g:nrrw_rgn_nomap_Nr      = 1
let g:nrrw_rgn_resize_window = 'relative'
let g:nrrw_rgn_rel_min       = 50
let g:nrrw_rgn_rel_max       = 50

nnoremap <silent> <Leader>ns :WidenRegion!<CR>

" tpope/vim-commentary
let g:commentary_map_backslash = 0

" junegunn/vim-easy-align
xnoremap <silent> <Enter> :EasyAlign<CR>

" Overwrite ga behavior - call :ascii instead
nmap     ga <Plug>(EasyAlign)
xmap     ga <Plug>(EasyAlign)
xnoremap gA :EasyAlign<Space>

" godlygeek/tabular
nnoremap          <Leader>aa     :Tabularize /
xnoremap          <Leader>aa     :Tabularize /
nnoremap <silent> <Leader>a=     :Tabularize /=<CR>
xnoremap <silent> <Leader>a=     :Tabularize /=<CR>
nnoremap <silent> <Leader>a:     :Tabularize /:<CR>
xnoremap <silent> <Leader>a:     :Tabularize /:<CR>
nnoremap <silent> <Leader>a,     :Tabularize /,<CR>
xnoremap <silent> <Leader>a,     :Tabularize /,<CR>
nnoremap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR>
xnoremap <silent> <Leader>a<Bar> :Tabularize /<Bar><CR>
nnoremap <silent> <Leader>ah     :Tabularize /=><CR>
xnoremap <silent> <Leader>ah     :Tabularize /=><CR>
nnoremap <silent> <Leader>aj     :Tabularize /^[^:]*:/<CR>
xnoremap <silent> <Leader>aj     :Tabularize /^[^:]*:/<CR>

command! -nargs=1 -range AlignFirst execute <line1> . ',' . <line2> . 'Tabularize /^[^' . escape(<q-args>, '\^$.[?*~') . ']*\zs' . escape(<q-args>, '\^$.[?*~')

nnoremap <Leader>A :AlignFirst<Space>
xnoremap <Leader>A :AlignFirst<Space>

autocmd MyAutoCmd FileType cucumber inoremap <silent> <buffer> <Bar> <Bar><Esc>:call <SID>BarAlign()<CR>a

function! s:BarAlign() abort
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

command! -nargs=0 ToggleBarAlign call <SID>ToggleBarAlign()

function! s:ToggleBarAlign() abort
    if mapcheck('<Bar>', 'i') == ''
        inoremap <silent> <buffer> <Bar> <Bar><Esc>:call <SID>BarAlign()<CR>a
        echo "Enabled Bar Align!"
    else
        iunmap <buffer> <Bar>
        echo "Disabled Bar Align!"
    endif
endfunction

nnoremap <silent> <Leader>al :ToggleBarAlign<CR>

" terryma/vim-multiple-cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before() abort
    if exists(':NeoCompleteLock') == 2
        silent! NeoCompleteLock
    endif
endfunction

" Called once only when the multiple selection is cancelled (default <Esc>)
function! Multiple_cursors_after() abort
    if exists(':NeoCompleteUnlock') == 2
        silent! NeoCompleteUnlock
    endif
endfunction

" tpope/vim-surround
let g:surround_indent             = 1
let g:surround_no_insert_mappings = 1

nmap <Leader>sw ysiw
nmap <Leader>sW ysiW

" tpope/vim-abolish
nnoremap <Leader>ab :%Abolish
xnoremap <Leader>ab :Abolish
nnoremap <Leader>sv :%Subvert//gc<Left><Left><Left>
xnoremap <Leader>sv :Subvert//gc<Left><Left><Left>

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode            = 0
let g:AutoPairsShortcutToggle     = '<M-a>'
let g:AutoPairsShortcutJump       = '<M-g>'
let g:AutoPairsShortcutFastWrap   = '<M-w>'
let g:AutoPairsShortcutBackInsert = '<M-i>'

" gcmt/wildfire.vim
map  <M-l> <Plug>(wildfire-fuel)
vmap <M-h> <Plug>(wildfire-water)

let g:wildfire_objects = ["i'", "a'", 'i"', 'a"', "i)", 'a)', "i]", "a]", "i}", "a}", 'il', 'al', 'ip']

cal wildfire#triggers#Add('<Plug>(wildfire-fuel)', {
            \ 'html,xml' : ['at', 'it'],
            \ 'ruby'     : ['ir', 'im', 'am', 'iM', 'aM'],
            \ 'eruby'    : ['iy', 'ay'],
            \ 'go'       : ['if', 'af'],
            \ })

nmap <M-s> <Plug>(wildfire-quick-select)

" thinca/vim-textobj-between
let g:textobj_between_no_default_key_mappings = 1

omap an <Plug>(textobj-between-a)
omap in <Plug>(textobj-between-i)
xmap an <Plug>(textobj-between-a)
xmap in <Plug>(textobj-between-i)

" Replace 'lucapette/vim-textobj-underscore'
omap a_ <Plug>(textobj-between-a)_
omap i_ <Plug>(textobj-between-i)_
xmap a_ <Plug>(textobj-between-a)_
xmap i_ <Plug>(textobj-between-i)_

" rhysd/vim-textobj-ruby
let g:textobj_ruby_more_mappings = 0

" whatyouhide/vim-textobj-erb
let g:textobj_erb_no_default_key_mappings = 1

" Remap from 'E' to 'y'
omap ay <Plug>(textobj-erb-a)
omap iy <Plug>(textobj-erb-i)
xmap ay <Plug>(textobj-erb-a)
xmap iy <Plug>(textobj-erb-i)

" poetic/vim-textobj-javascript
let g:textobj_chunkblock_no_default_key_mappings = 1

" Remap from 'c' to 'j'
omap aj <Plug>(textobj-chunkblock-a)
omap ij <Plug>(textobj-chunkblock-i)
xmap aj <Plug>(textobj-chunkblock-a)
xmap ij <Plug>(textobj-chunkblock-i)

" chrisbra/unicode.vim
nmap <Leader>ud <Plug>(MakeDigraph)
vmap <Leader>ud <Plug>(MakeDigraph)

if has_key(g:plugs, 'neocomplete.vim')
    " Shougo/neocomplete.vim
    let g:neocomplete#enable_at_startup                 = 1 " Use neocomplete
    let g:neocomplete#disable_auto_complete             = 0
    let g:neocomplete#enable_smart_case                 = 1 " Use smartcase
    let g:neocomplete#enable_camel_case                 = 1
    let g:neocomplete#enable_fuzzy_completion           = 1
    let g:neocomplete#min_keyword_length                = 3 " Set minimum keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
    let g:neocomplete#ignore_source_files               = []
    let g:neocomplete#force_overwrite_completefunc      = 1
    let g:neocomplete#enable_cursor_hold_i              = 0
    let g:neocomplete#enable_auto_select                = 1
    let g:neocomplete#enable_auto_delimiter             = 1
    let g:neocomplete#enable_auto_close_preview         = 1

    let g:neocomplete#disable_auto_select_buffer_name_pattern = '\[Command Line\]'

    " Disable tag completion
    let g:neocomplete#ignore_source_files = ['tag.vim']

    call neocomplete#custom#source('look', 'min_pattern_length', 4)
    call neocomplete#custom#source('_', 'converters', [
                \ 'converter_add_paren',
                \ 'converter_remove_overlap',
                \ 'converter_delimiter',
                \ 'converter_abbr'
                \ ])

    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default'  : '',
                \ 'vimshell' : $HOME . '/.vimshell_history',
                \ }

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\k*(\?'

    " Enable heavy omni completion
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif

    if !exists('g:neocomplete#sources#omni#functions')
        let g:neocomplete#sources#omni#functions = {}
    endif

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif

    " let g:neocomplete#sources#omni#input_patterns.c      = '[^.[:digit:] *\t]\%(\.\|->\)'
    " let g:neocomplete#sources#omni#input_patterns.cpp    = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.python = '[^. *\t]\.\w*\|\h\w*'
    " let g:neocomplete#sources#omni#input_patterns.ruby   = '[^. *\t]\.\w*\|\h\w*::\w*'
    " let g:neocomplete#force_omni_input_patterns.ruby     = '[^. *\t]\.\w*\|\h\w*::\w*'

    let g:neocomplete#force_omni_input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

    let g:neocomplete#sources#omni#functions.go = 'go#complete#Complete'

    let g:neocomplete#sources#vim#complete_functions = {
                \ 'Unite'    : 'unite#complete_source',
                \ 'VimShell' : 'vimshell#complete',
                \ 'VimFiler' : 'vimfiler#complete',
                \ }

    let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

    " <CR>: close popup
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key
        " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction

    " CTRL-H, <BS>: close popup and delete backword char
    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"

    inoremap          <expr> <C-g>      neocomplete#undo_completion()
    inoremap          <expr> <C-x><C-g> neocomplete#undo_completion()
    inoremap          <expr> <C-x><C-@> neocomplete#complete_common_string()
    inoremap <silent> <expr> <C-x><C-f> neocomplete#start_manual_complete('file')

    " <Tab>: completion
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
    " Clever Tab
    imap <expr> <Tab> <SID>CleverTab()
    function! s:CleverTab() abort
        if pumvisible()
            return "\<C-n>"
        endif
        let substr = strpart(getline('.'), 0, col('.') - 1)
        let substr = matchstr(substr, '[^ \t]*$')
        if strlen(substr) == 0
            return "\<Tab>"
        else
            if neosnippet#expandable_or_jumpable()
                return "\<Plug>(neosnippet_expand_or_jump)"
            else
                return neocomplete#start_manual_complete()
            endif
        endif
    endfunction

    nnoremap <silent> <M-/> :NeoCompleteToggle<CR>

    " justmao945/vim-clang
    let g:clang_auto            = 0
    let g:clang_c_completeopt   = 'menuone'
    let g:clang_cpp_completeopt = 'menuone'
    " let g:clang_c_options       = '-std=gnu11'
    " let g:clang_cpp_options     = '-std=c++11 -stdlib=libc++'
endif

if has_key(g:plugs, 'neosnippet.vim')
    " Shougo/neosnippet.vim
    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#enable_complete_done          = 1
    let g:neosnippet#expand_word_boundary          = 1

    let g:neosnippet#scope_aliases = {}
    let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'
    let g:neosnippet#scope_aliases['objc'] = 'objc,c'
    let g:neosnippet#scope_aliases['objcpp'] = 'objc,c'

    imap <silent> <expr> <C-l> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" :
                \ (pumvisible() ? "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <C-l> <Plug>(neosnippet_expand_or_jump)
    xmap <C-l> <Plug>(neosnippet_expand_target)

    imap <C-j> <Plug>(neosnippet_jump_or_expand)
    smap <C-j> <Plug>(neosnippet_jump_or_expand)
    xmap <C-j> <Plug>(neosnippet_expand_target)

    smap <Tab> <Plug>(neosnippet_jump)
endif

if has_key(g:plugs, 'YouCompleteMe')
    " Valloric/YouCompleteMe
    let g:ycm_confirm_extra_conf                  = 0
    let g:ycm_complete_in_comments_and_strings    = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_use_ultisnips_completer             = 1
    let g:ycm_key_detailed_diagnostics            = ''
    let g:ycm_extra_conf_vim_data                 = ['&filetype']
    let g:ycm_global_ycm_extra_conf               = filereadable(expand('~/.ycm_extra_conf.py')) ? expand('~/.ycm_extra_conf') : ''
    let g:ycm_filetype_blacklist                  = { 'unite': 1, 'ctrlp': 1 }

    let g:ycm_semantic_triggers = {
                \ 'objc' : [
                \   're!\@"\.*"\s',
                \   're!\@\w+\.*\w*\s',
                \   're!\@\(\w+\.*\w*\)\s',
                \   're!\@\(\s*',
                \   're!\@\[.*\]\s',
                \   're!\@\[\s*',
                \   're!\@\{.*\}\s',
                \   're!\@\{\s*',
                \   "re!\@\'.*\'\s",
                \   '#ifdef ',
                \   're!:\s*',
                \   're!=\s*',
                \   're!,\s*',
                \ ],
                \ }

    function! s:SetupClangMappings() abort
        nnoremap <buffer>          <LocalLeader>y :YcmCompleter<Space>

        nnoremap <buffer> <silent> <LocalLeader>g :YcmCompleter GoTo<CR>
        nnoremap <buffer> <silent> <LocalLeader>s :YcmCompleter GoToImprecise<CR>
        nnoremap <buffer> <silent> <LocalLeader>i :YcmCompleter GoToInclude<CR>
        nnoremap <buffer> <silent> <LocalLeader>o :YcmCompleter GoToDeclaration<CR>
        nnoremap <buffer> <silent> <LocalLeader>d :YcmCompleter GoToDefinition<CR>

        nnoremap <buffer> <silent> <LocalLeader>t :YcmCompleter GetType<CR>
        nnoremap <buffer> <silent> <LocalLeader>p :YcmCompleter GetParent<CR>
        nnoremap <buffer> <silent> <LocalLeader>h :YcmCompleter GetDoc<CR>
        nnoremap <buffer> <silent> <LocalLeader>q :YcmCompleter GetDocQuick<CR>

        nnoremap <buffer> <silent> <LocalLeader>l :YcmCompleter ClearCompilationFlagCache<CR>

        nnoremap <buffer> <silent> <LocalLeader>f :YcmCompleter FixIt<CR>

        nnoremap <buffer> <silent> <LocalLeader>v :YcmDebugInfo<CR>
        nnoremap <buffer> <silent> <LocalLeader>k :YcmShowDetailedDiagnostic<CR>
        nnoremap <buffer> <silent> <LocalLeader>c :YcmForceCompileAndDiagnostics<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType c,cpp,objc,objcpp call s:SetupClangMappings()
    augroup END

    " Enable omni completion
    augroup MyAutoCmd
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END
endif

if has_key(g:plugs, 'ultisnips')
    " SirVer/ultisnips
    let g:UltiSnipsExpandTrigger       = '<C-l>'
    let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-_>'

    inoremap <C-x><C-k> <C-x><C-k>
endif

" tpope/vim-fugitive
nnoremap          <Leader>gi :Git add -p %<CR><CR>
nnoremap          <Leader>ga :Git add -p<CR><CR>
nnoremap          <Leader>ge :Gedit<Space>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
nnoremap          <Leader>gl :Glog!<Space>
nnoremap          <Leader>gL :Gllog!<Space>

augroup MyAutoCmd
    autocmd FileType gitcommit nmap <silent> <buffer> U :Git checkout -- <C-r><C-g><CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" cohama/agit.vim
nnoremap <silent> <Leader>gk :AgitFile<CR>
nnoremap <silent> <Leader>gK :Agit<CR>

" mhinz/vim-signify
let g:signify_vcs_list              = [ 'git', 'hg' ]
let g:signify_disable_by_default    = 0
let g:signify_cursorhold_insert     = 0
let g:signify_cursorhold_normal     = 0
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 0

nnoremap <silent> cog :SignifyToggle<CR>

if has_key(g:plugs, 'vim-tmuxify')
    " jebaum/vim-tmuxify
    let g:tmuxify_custom_command = 'tmux split-window -d -p 30'
    let g:tmuxify_map_prefix     = '<Leader>m'
    let g:tmuxify_global_maps    = 1

    nnoremap <silent> <Leader>mR :TxSetRunCmd<CR>
    nnoremap <silent> <Leader>mi :TxSend!<CR>
    nmap     <silent> <Leader>mS mmggVG<Leader>ms`m
    nnoremap <silent> <Leader>mu :TxSendKey! 'q C-u'<CR>
    nnoremap <silent> <Leader>mm :TxSendKey! 'Enter'<CR>
    nnoremap <silent> <Leader>md :TxSendKey! 'C-d'<CR>

    augroup MyAutoCmd
        autocmd VimEnter * nmap <silent> <Leader>ms mmvip<Leader>ms`m
    augroup END

    nnoremap <silent> <Leader>tb :TxSigInt<CR>
    nnoremap <silent> <Leader>tc :TxClear<CR>
    nnoremap <silent> <Leader>tn :TxCreate<CR>
    nnoremap <silent> <Leader>tp :TxSetPane<CR>
    nnoremap <silent> <Leader>tq :TxKill<CR>
    nnoremap <silent> <Leader>tr :TxRun<CR>
    nnoremap <silent> <Leader>tR :TxSetRunCmd<CR>
    nnoremap <silent> <Leader>ti :TxSend<CR>
    nmap     <silent> <Leader>ts mmvip<Leader>ts`m
    nmap     <silent> <Leader>tS mmggVG<Leader>ts`m
    xnoremap <silent> <Leader>ts "my:TxSend(@m)<CR>
    nnoremap <silent> <Leader>tk :TxSendKey<CR>
    nnoremap <silent> <Leader>tu :TxSendKey 'q C-u'<CR>
    nnoremap <silent> <Leader>tm :TxSendKey 'Enter'<CR>
    nnoremap <silent> <Leader>td :TxSendKey 'C-d'<CR>

    " Runner for janko-m/vim-test or jgdavey/vim-turbux
    function! TmuxifyRunner(command) abort
        execute 'TxRun! ' . shellescape(a:command)
    endfunction
endif

" janko-m/vim-test
if has('gui_running') && has('gui_macvim')
    let g:test#strategy = 'terminal'
elseif has_key(g:plugs, 'vim-tmuxify')
    let g:test#custom_strategies = { 'tmuxify': function('TmuxifyRunner') }
    let g:test#strategy          = 'tmuxify'
elseif has_key(g:plugs, 'vim-dispatch')
    let g:test#strategy = 'dispatch'
endif

nnoremap <silent> <Leader>rt :TestFile<CR>
nnoremap <silent> <Leader>rf :TestNearest<CR>
nnoremap <silent> <Leader>rl :TestLast<CR>
nnoremap <silent> <Leader>ra :TestSuite<CR>
nnoremap <silent> <Leader>rg :TestVisit<CR>

" sheerun/vim-polyglot
let g:polyglot_disabled = ['go']

" plasticboy/vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_fenced_languages        = ["c++=cpp", 'bash=sh', 'erb=eruby', 'js=javascript', 'json=javascript', 'viml=vim']

" tpope/rails.vim
nnoremap <silent> <Leader>ae :AE<CR>
nnoremap <silent> <Leader>as :AS<CR>
nnoremap <silent> <Leader>av :AV<CR>
nnoremap <silent> <Leader>re :RE<CR>
nnoremap <silent> <Leader>rs :RS<CR>
nnoremap <silent> <Leader>rv :RV<CR>
xnoremap          <Leader>re :Rextract<Space>

" jgdavey/vim-turbux
let g:no_turbux_mappings = 1
let g:turbux_command_prefix = 'bundle exec'

nmap <Leader>tt <Plug>SendTestToTmux
nmap <Leader>tf <Plug>SendFocusedTestToTmux

if !has('gui_running') && has_key(g:plugs, 'vim-tmuxify')
    let g:turbux_custom_runner = 'TmuxifyRunner'
endif

" mattn/emmet-vim
let g:user_emmet_install_global  = 0

autocmd MyAutoCmd FileType eruby,haml,slim,jade,xhtml,html,xml,css,sass,scss,less,html.handlebars,mustache EmmetInstall

" fatih/vim-go and garyburd/go-explorer
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_structs           = 1
let g:go_highlight_interfaces        = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types       = 1

let g:go_fmt_command       = 'goimports'
let g:go_fmt_fail_silently = 1

if has_key(g:plugs, 'neosnippet.vim')
    let g:go_snippet_engine = 'neosnippet'
endif

let g:syntastic_go_checkers     = ['golint', 'govet', 'errcheck']
let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']

function! s:VimGoSetup() abort
    if has("nvim")
        nmap <buffer> <LocalLeader>R <Plug>(go-run-split)
    else
        nnoremap <buffer> <silent> <LocalLeader>R :GoRun!<CR>:redraw!<CR>
    endif
    nmap <buffer> <LocalLeader>r <Plug>(go-run)
    nmap <buffer> <LocalLeader>b <Plug>(go-build)
    nmap <buffer> <LocalLeader>g <Plug>(go-generate)
    nmap <buffer> <LocalLeader>i <Plug>(go-install)
    nmap <buffer> <LocalLeader>I <Plug>(go-import)
    nmap <buffer> <LocalLeader>t <Plug>(go-test)
    nmap <buffer> <LocalLeader>T <Plug>(go-test-func)
    nmap <buffer> <LocalLeader>C <Plug>(go-test-compile)
    nmap <buffer> <LocalLeader>a <Plug>(go-alternate-edit)
    nmap <buffer> <LocalLeader>A <Plug>(go-alternate-vertical)
    nmap <buffer> <LocalLeader>c <Plug>(go-coverage)
    nmap <buffer> <LocalLeader>v <Plug>(go-vet)

    nmap <buffer> <LocalLeader>e <Plug>(go-rename)

    nmap <buffer> <LocalLeader>n <Plug>(go-info)
    nmap <buffer> <LocalLeader>N <Plug>(go-deps)
    nmap <buffer> <LocalLeader>s <Plug>(go-implements)

    nnoremap <buffer> <LocalLeader>B :GoDocBrowser<Space>

    nmap <buffer> <LocalLeader>d <Plug>(go-doc-vertical)
    nmap <buffer> <LocalLeader>D <Plug>(go-doc-tab)

    nmap <buffer> <LocalLeader>f <Plug>(go-def-vertical)
    nmap <buffer> <LocalLeader>F <Plug>(go-def-tab)

    nmap     <buffer> <LocalLeader>m <Plug>(go-metalinter)
    nnoremap <buffer> <LocalLeader>M :GoMetaLinter<Space>
    nnoremap <buffer> <LocalLeader>l :GoLint<Space>
    nnoremap <buffer> <LocalLeader>E :GoErrCheck<Space>

    nnoremap <buffer> <LocalLeader>G :GoGuruTags<Space>

    nmap <buffer> g> <Plug>(go-import)
    nmap <buffer> g< <Plug>(go-drop)
    nmap <buffer> g} <Plug>(go-import)
    nmap <buffer> g{ <Plug>(go-drop)

    nnoremap <buffer> <LocalLeader>] :GoImport<Space>
    nnoremap <buffer> <LocalLeader>[ :GoDrop<Space>
    nnoremap <buffer> ]<LocalLeader> :GoImport<Space>
    nnoremap <buffer> [<LocalLeader> :GoDrop<Space>

    if has_key(g:plugs, 'ctrlp.vim')
        nnoremap <buffer> <silent> <LocalLeader>o :GoDecls<CR>
        nnoremap <buffer> <silent> <LocalLeader>O :GoDeclsDir<CR>
        nnoremap <buffer>          <LocalLeader>p :GoDeclsDir<Space>
        nnoremap <buffer>          <LocalLeader>P :GoDecls<Space>
    endif

    " go install
    nnoremap <buffer> <silent> <LocalLeader>u :update<CR>:execute "silent! !go install"<CR>:redraw!<CR>:echo '!go install'<CR>
endfunction

autocmd MyAutoCmd FileType go call s:VimGoSetup()

" KabbAmine/zeavim.vim
let g:zv_disable_mapping = 1

if has('mac')
    let g:zv_docsets_dir = '~/Library/Application Support/Zeal/Zeal/docsets'
endif

nnoremap <Leader>se :Docset<Space>
nmap     gz         <Plug>ZVMotion
nmap     <Leader>sd <Plug>Zeavim
vmap     <Leader>sd <Plug>ZVVisSelection
nmap     <Leader>sD <Plug>ZVKeyDocset

" morhetz/gruvbox
let g:gruvbox_contrast_dark  = 'hard'
let g:gruvbox_contrast_light = 'hard'

" junegunn/seoul256.vim
let g:seoul256_background = 235
let g:seoul256_light_background = 254

" autocmd-related settings
augroup MyAutoCmd
    " Set file type
    autocmd BufNewFile,BufRead *.nvim setlocal filetype=vim
    autocmd BufNewFile,BufRead *.fastercsv,*.prawn setlocal filetype=ruby

    " Vim
    autocmd FileType vim setlocal keywordprg=:help

    " Help
    autocmd FileType help setlocal keywordprg=:help noexpandtab

    " Quickfix
    autocmd FileType qf setlocal winheight=15 nobuflisted

    " Ruby-related
    autocmd FileType ruby,eruby,yaml,haml,markdown,less,sass,scss,coffee,html.handlebars setlocal tabstop=2 shiftwidth=2

    autocmd FileType ruby,yaml,eruby,coffee,haml let b:surround_35 = "#{\r}"
    autocmd FileType eruby let b:surround_45 = "<% \r %>"
    autocmd FileType eruby let b:surround_61 = "<%= \r %>"

    " CSS / Less
    autocmd FileType css,less setlocal iskeyword+=-

    " JSON
    autocmd FileType json setlocal conceallevel=0

    " SQL
    autocmd FileType sql setlocal omnifunc= commentstring=--\ %s

    " XML
    if executable('xmllint')
        autocmd FileType xml nnoremap <silent> <buffer> g=
                    \ :execute 'silent! %' . printf("!env XMLLINT_INDENT='%s' xmllint --format --recover - 2>/dev/null", repeat(' ', exists('*shiftwidth') ? shiftwidth() : &shiftwidth))<CR>
    endif

    " Clang
    autocmd FileType c,cpp setlocal commentstring=//\ %s

    " Go
    autocmd FileType go,godoc,gedoc setlocal noexpandtab
    autocmd FileType godoc,gedoc    setlocal tabstop=8

    " Git
    autocmd FileType gitcommit setlocal textwidth=72 winheight=20 spell
    autocmd FileType git,gitconfig setlocal tabstop=8

    " q to close
    autocmd FileType help,qf,godoc,gedoc nnoremap <silent> <buffer> q :close<CR>

    " Folding
    autocmd FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
    autocmd FileType nginx,puppet,c,javascript,go,less,css setlocal foldmethod=marker foldmarker={,}

    " nginx
    autocmd FileType nginx setlocal noexpandtab commentstring=#\ %s
augroup END

set background=dark
colorscheme gruvbox

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set secure

