" No Vi Compatibility
if &compatible
    set nocompatible
endif

if &shell =~# 'fish$'
    set shell=bash
endif

" if executable('zsh')
"     set shell=zsh
" else
"     set shell=bash
" endif

" Set augroup
augroup MyAutoCmd
    autocmd!
augroup END

" Disable system plugins
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_matchparen        = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let loaded_gzip                = 1
let loaded_remote_plugins      = 1
let loaded_rrhelper            = 1
let loaded_spellfile_plugin    = 1
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key    = ''

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

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" lean & mean status/tabline
Plug 'bling/vim-airline'

" Set vim cursor for iTerm
Plug 'phongnh/vim-iterm-cursor'

" CtrlP
Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/ctrlp-git'
" Plug 'h2ero/ctrlp-hg'
Plug 'h14i/vim-ctrlp-buftab'
Plug 'DavidEGx/ctrlp-smarttabs'
" Plug 'kaneshin/ctrlp-tabbed'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'ompugao/ctrlp-history'
Plug 'mattn/ctrlp-register'
Plug 'tacahiroy/ctrlp-funky'
" Plug 'mattn/ctrlp-mark'
" Plug 'mattn/ctrlp-launcher'
Plug 'https://bitbucket.org/slimane/ctrlp-locationlist'

" logging registers and reusing them
Plug 'LeafCage/yankround.vim'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" A fancy start screen
Plug 'mhinz/vim-startify'

" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer'

" Visualize your Vim undo tree
Plug 'sjl/gundo.vim'

" A class/symbol outline viewer
Plug 'majutsushi/tagbar'

" Maximize current buffer
Plug 'regedarek/ZoomWin'

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Hyperfocus-writing
Plug 'junegunn/limelight.vim'

" Delete buffers and close files in Vim without closing your windows or messing up your layout
Plug 'moll/vim-bbye'

" Display the indention levels
Plug 'Yggdroot/indentLine'

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

" Toggle useful settings
Plug 'phongnh/vim-toggler'

" extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'

" My vim functions for search and substitue
Plug 'phongnh/vim-search-helpers'

" Extended f, F, t and T key mappings for Vim.
Plug 'rhysd/clever-f.vim'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'

" Vim search status
Plug 'osyo-manga/vim-anzu'

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'
" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" Auto close parentheses and repeat by dot dot dot...
" Plug 'cohama/lexima.vim'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'               " l
Plug 'kana/vim-textobj-indent'             " i
Plug 'kana/vim-textobj-entire'             " e
Plug 'glts/vim-textobj-comment'            " c
Plug 'mattn/vim-textobj-url'               " u
Plug 'Julian/vim-textobj-variable-segment' " v
Plug 'rhysd/vim-textobj-anyblock'          " b
Plug 'thinca/vim-textobj-between'          " f{char}, remapped to n{char}
Plug 'sgur/vim-textobj-parameter'          " ,
Plug 'whatyouhide/vim-textobj-xmlattr'     " x

" Plug 'tek/vim-textobj-ruby', { 'for': 'ruby' }        " r: block, f: function, c: class/module, n: name
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }        " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
Plug 'whatyouhide/vim-textobj-erb', { 'for': 'eruby' }  " E, remapped to y

Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' } " f
Plug 'poetic/vim-textobj-javascript', { 'for': 'javascript' } " c, remapped to j

" Delete unwanted whitespace at the end of lines
Plug 'vim-scripts/DeleteTrailingWhitespace'
" Plug 'ntpeters/vim-better-whitespace'

" Comment code out
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'

" SCM
" Show a diff via Vim sign column
Plug 'mhinz/vim-signify'
" A awesome Git wrapper so awesome
Plug 'tpope/vim-fugitive'
" A Mercurial wrapper for Vim
" Plug 'ludovicchabant/vim-lawrencium'

" Code completion and Snippets
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Utility
" An implementation of Sublime's PlainTasks plugin for Vim
Plug 'elentok/plaintasks.vim', { 'for': 'plaintasks' }

" Tmux
if exists("$TMUX")
    Plug 'benmills/vimux'
    Plug 'jebaum/vim-tmuxify'
endif

" A solid language pack for Vim
Plug 'sheerun/vim-polyglot'

" Web
Plug 'mattn/emmet-vim'
Plug 'gregsexton/MatchTag' " Markup Language (HTML, Markdown, Stylus, Jade and Mustache)

" Others
Plug 'vim-scripts/fish-syntax'

" Color schemes
" Dark and light themes
Plug 'morhetz/gruvbox'

call plug#end()

" set ttimeout ttimeoutlen=1000

" Make ESC respond faster
set timeoutlen=1000
set ttimeoutlen=0

set lazyredraw               " Do not redraw while macro executing
set ttyfast

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
set foldnestmax=20      " Deepest fold is 20 levels
set foldlevelstart=99   " Open all folds by default
set nofoldenable        " Disable fold by default

set fillchars=diff:⣿,vert:│

" Turn off swapfile and backup
set noswapfile
set nobackup
set nowritebackup
set directory=~/.vim/cache/swap
set backupdir=~/.vim/cache/backup

if has('persistent_undo')
    set undofile
    set undodir=~/.vim/cache/undo
endif

set scrolloff=10                " Minimal number of screen lines to keep above and below the cursor
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
set completeopt=menuone
set complete=.,w,b,u,t
set pumheight=20                " Set popup menu max height

set wildmenu
set wildmode=list:longest,full
" Ingore the following stuff when tab completing
set wildignore+=.hg,.git,.svn,*.o,*.obj,*.pyc,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store

" Adjust window size of preview and help
set previewheight=8
set helpheight=12

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new window right the current one

set t_Co=256                    " Enable 256 colors

" Remember where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.vim/cache/viminfo

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Map leader
let g:mapleader = ','

" Release keymappings for plug-in
nnoremap , <Nop>
xnoremap , <Nop>

nnoremap m <Nop>
xnoremap m <Nop>

" m: App key
nnoremap [App] <Nop>
xnoremap [App] <Nop>
nmap     m     [App]
xmap     m     [App]

nnoremap [App], ,
nnoremap [App]; ;
nnoremap [App]m m

" [Space]: Other useful commands
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>
nmap     <Space> [Space]
xmap     <Space> [Space]

" F1: Help
nnoremap <F1> :help<Space>
inoremap <F1> <Esc>:help<Space>

" Command-line Mode Mappings
" Ctrl-[ae]: Move to Home/End
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Ctrl-[fb]: Next/Previous char
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

" Ctrl-[hl]: Move left/right by word
cnoremap <C-h> <S-Left>
cnoremap <C-l> <S-Right>

" Ctrl-Space: Show history
cnoremap <C-@> <C-f>

" Ctrl-[np]: Next/Previous history
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" <C-d>: Delete char
cnoremap <C-d> <Del>

" <C-k>: Delete to end
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" Ctrl-v: Paste from clipboard
cnoremap <C-v> <C-r>*

" Ctrl-y: Paste from register "
cnoremap <C-y> <C-r>"

" Insert Mode Mappings
" Enable undo <C-w> (Delete word) and <C-u> (Delete line)
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Ctrl-/: Undo
inoremap <C-_> <C-o>u

" Ctrl-[ae]: Move to Home/End
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

" Ctrl-d: Delete char
inoremap <C-d> <Del>

" Ctrl-b: Move cursor left
inoremap <C-b> <Left>
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>"   : "\<Left>"
" inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>"   : "\<C-b>"

" Ctrl-f: Move cursor right
inoremap <C-f> <Right>
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
" inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"

" Ctrl-h: Move word left
inoremap <C-h> <C-o>b

" Ctrl-j: Move cursor down
inoremap <expr> <C-j> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-p>" : "\<Down>"

" Ctrl-k: Move cursor up
inoremap <expr> <C-k> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-n>" : "\<Up>"

" Ctrl-l: Move word right
inoremap <C-l> <C-o>w

" Ctrl-t: Insert tab
inoremap <silent> <C-t> <C-v><Tab>

" Jump to last active buffer
inoremap <C-^> <C-c><C-^>
" inoremap <C-^> <C-c>:update<CR><C-^>

" Normal Mode Mappings
" Use sane regular expressions
" nnoremap / /\v
" xnoremap / /\v

" Useless command
nnoremap M m

" Q: qq to record, Q to replay and Disable Ex-mode
nmap     Q  @q
nnoremap gQ gq

" .: repeats the last command on every line
xnoremap . :normal.<CR>

" @: repeats macro on every line
xnoremap @ :normal@

" Disable ZZ, ZQ, Ctrl-z
nnoremap ZZ    <Nop>
nnoremap ZQ    <Nop>
nnoremap <C-z> <Nop>

" Indent
nnoremap >       >>
nnoremap <       <<
xnoremap >       >gv
xnoremap <       <gv
xnoremap <Tab>   >gv
xnoremap <S-Tab> <gv

" Indent whole file
nnoremap g= gg=G``

" H: Move to Home
noremap  H ^
" L: Move to End
noremap  L $
xnoremap L g_

" Select until end of current line in visual mode
xnoremap v $h
" Select rectangle - Visual Block
xnoremap r <C-v>

" gi already moves to "last place you exited insert mode"
" gI: Move to last change
nnoremap gI `.`

" gV: Select the text that was last edited/pasted
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" D: Delete to end line
nnoremap D  d$

" U: Redo
nnoremap U :redo<CR>

" Yank to end line
nnoremap Y y$

" Copy to clipboard
function! s:CopyToClipboard(msg)
    try
        let [@*, @+] = [@", @"]
        echo a:msg
    catch
    endtry
endfunction

xnoremap <silent> Y         ""y:call <SID>CopyToClipboard('Copied to clipboard!')<CR>
xnoremap <silent> <Leader>y ""y:call <SID>CopyToClipboard('Copied to clipboard!')<CR>
xnoremap <silent> <Leader>Y ""y$:call <SID>CopyToClipboard('Copied line to clipboard!')<CR>

" Cut to clipboard
xnoremap <silent> X         ""x:call <SID>CopyToClipboard('Cut to clipboard!')<CR>
xnoremap <silent> <Leader>x ""x:call <SID>CopyToClipboard('Cut to clipboard!')<CR>
nnoremap <silent> <Leader>X ""d$:call <SID>CopyToClipboard('Cut line to clipboard!')<CR>

" Copy current yanked text to clipboard
function! s:CopyYankedText()
    try
        let [@*, @+] = [@", @"]
        let yanked_text = substitute(@", "\n", '^@', 'g')
        if yanked_text ==? strpart(yanked_text, 0, 30)
            echo 'Copied: ' . yanked_text
        else
            echo 'Copied: ' . strpart(yanked_text, 0, 30) . '...'
        endif
    catch
    endtry
endfunction

nnoremap <silent> <Leader>y :call <SID>CopyYankedText()<CR>

" Paste from clipboard
inoremap <silent> <C-v>     <C-g>u<C-o>"*gP
nnoremap <silent> <Leader>p "*gP
nnoremap <silent> <Leader>P :set paste<CR>"*gP:set nopaste<CR>

" Paste from clipboard with indent
nnoremap <silent> <Leader>v o<Esc>"*pm``[=`]``^
nnoremap <silent> <Leader>V o<Esc>"*gpm``[=`]``^

" Middle mouse to paste from clipboard
nnoremap <MiddleMouse> "*P
xnoremap <MiddleMouse> "*P
inoremap <MiddleMouse> <C-o><C-r>*
cnoremap <MiddleMouse> <C-r>*

" Paste with indent
nnoremap <silent> ]v o<Esc>pm``[=`]``^
nnoremap <silent> [v O<esc>pm``[=`]``^

" Redraw
nnoremap <silent> <Plug>(clear-and-redraw) :<C-u>echo<CR>:nohlsearch<CR>:match<CR>:redraw!<CR>
nmap <silent> <Leader><Space> <Plug>(clear-and-redraw)

" Use <C-\> to do <C-]> but open it in a new split
nnoremap <C-\> <C-w>v<C-]>zvzz

" Search and Replace
nnoremap <Leader>r :%s//gc<Left><Left><Left>
nnoremap <Leader>R :%s/<C-r>=GetWordForSubstitute()<CR>/gc<Left><Left><Left>

xnoremap <Leader>r :s/\%V/gc<Left><Left><Left>
xnoremap <Leader>R <Esc>:%s/<C-r>=GetSelectedTextForSubstitute()<CR>//gc<Left><Left><Left>

" Folding
" If press h on head, fold close
"nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" If press l on fold, fold open
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'

" If press h on head, range fold close
"xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press l on fold, range fold open
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" Toggle Fold
noremap za zazz

" Next / previous fold
noremap zj zjzz
noremap zk zkzz

" Invert 'foldenable'
noremap zi zizz

noremap zr zr :echo 'foldlevel = ' . &foldlevel<CR>
noremap zm zm :echo 'foldlevel = ' . &foldlevel<CR>
noremap zR zR :echo 'foldlevel = ' . &foldlevel<CR>
noremap zM zM :echo 'foldlevel = ' . &foldlevel<CR>

nnoremap <silent> z] :let &foldcolumn = &foldcolumn + 1<CR>:echo 'foldcolumn = ' . &foldcolumn<CR>
nnoremap <silent> z[ :let &foldcolumn = &foldcolumn - 1<CR>:echo 'foldcolumn = ' . &foldcolumn<CR>

" Auto center
" nnoremap <silent> n     nzzzv
" nnoremap <silent> N     Nzzzv
" nnoremap <silent> *     *zzzv
" nnoremap <silent> #     #zzzv
" nnoremap <silent> g*    g*zzzv
" nnoremap <silent> g#    g#zzzv
nnoremap <silent> g;    g;zz
nnoremap <silent> g,    g,zz
nnoremap <silent> <C-o> <C-o>zz
nnoremap <silent> <C-i> <C-i>zz


" Buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Tab
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>

" Quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Location list
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

" Empty lines
nnoremap <silent> [<Space> :<C-u>put! =<C-r>=repeat(nr2char(10), v:count1)<CR><CR>']+1
nnoremap <silent> ]<Space> :<C-u>put  =<C-r>=repeat(nr2char(10), v:count1)<CR><CR>'[-1

" Move lines
nnoremap <silent> [e :<C-u>execute 'move -1-' . v:count1<CR>
nnoremap <silent> ]e :<C-u>execute 'move +'   . v:count1<CR>
xnoremap <silent> [e :<C-u>execute "'<,'>move '<-1-" . v:count1<CR>gv
xnoremap <silent> ]e :<C-u>execute "'<,'>move '>+"   . v:count1<CR>gv

" Window navigation using arrows
nnoremap <silent> <Left>  <C-w>h
nnoremap <silent> <Down>  <C-w>j
nnoremap <silent> <Up>    <C-w>k
nnoremap <silent> <Right> <C-w>l

" gl: List buffers
nnoremap gl :buffers<CR>:edit #

" gb: Last buffer
nnoremap <silent> gb :buffer#<CR>

" Horizontal/Vertical split
nnoremap <silent> <Leader>- :sp<CR>
nnoremap <silent> <Leader>\ :vsp<CR>

" Quit Vim
nnoremap <silent> <Leader>Q :confirm qall<CR>
" Save buffer
noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>
" Close buffer
nnoremap <silent> <Leader>q :close<CR>
" Unload buffer
nnoremap <silent> <Leader><Backspace> :bdelete<CR>
" Equal size windows
nnoremap <silent> <Leader>= :wincmd =<CR>
" All other windows are closed
nnoremap <silent> <Leader>0 :only<CR>
" Swap windows
nnoremap <silent> <Leader>` :wincmd x<CR>

" Copy path to clipboard
function! s:CopyPath(path)
    try
        let @" = a:path
        let [@*, @+] = [@", @"]
        echo 'Copied: ' . @"
    catch
    endtry
endfunction

" Copy file name to clipboard
nnoremap <silent> <Leader>if :call <SID>CopyPath(expand("%"))<CR>

" Copy file name with line to clipboard
nnoremap <silent> <Leader>iF :call <SID>CopyPath(expand("%") . ':' . line('.'))<CR>

" Copy full path to clipboard
nnoremap <silent> <Leader>ip :call <SID>CopyPath(expand("%:p"))<CR>

" Copy full path with line to clipboard
nnoremap <silent> <Leader>iP :call <SID>CopyPath(expand("%:p") . ':' . line('.'))<CR>

" Copy parent folder to clipboard
nnoremap <silent> <Leader>id :call <SID>CopyPath(expand("%:h"))<CR>

" Copy folder to clipboard
nnoremap <silent> <Leader>iD :call <SID>CopyPath(expand("%:p:h"))<CR>

" Highlight current line
nnoremap <silent> <Leader>il :execute 'match Search /\%' . line('.') . 'l/'<CR>

" User-defined commands
" Sudo write
command! -bang SW w<bang> !sudo tee % >/dev/null

" Clear terminal console
command! -bar Cls execute 'silent! !clear' | redraw!

" Grep
command! -bar -nargs=+ -complete=file Grep silent! grep! <args> | cwindow | redraw!
set grepformat=%f:%l:%m

if executable('ag')
    " https://github.com/ggreer/the_silver_searcher
    let &grepprg = 'ag --vimgrep --smart-case --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('hw')
    " https://github.com/tkengo/highway
    let &grepprg = 'hw --no-color --no-group -n -i'
elseif executable('sift')
    " https://github.com/svent/sift
    let &grepprg = 'sift --no-color --no-group --binary-skip -n -i $*'
endif

" bling/vim-airline
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

function! AirlineModeAndClipboard()
    return airline#parts#mode() . (match(&clipboard, 'unnamed') > -1 ? ' @' : '')
endfunction

autocmd MyAutoCmd VimEnter * set showtabline=1 noshowmode

" FelikZ/ctrlp-py-matcher
" let g:ctrlp_lazy_update         = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files           = 0
let g:ctrlp_match_func          = { 'match': 'pymatcher#PyMatch' }

" JazzCore/ctrlp-cmatcher
" let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }

" ctrlpvim/ctrlp.vim
let g:ctrlp_match_window      = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_map               = ''
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window      = 'startify'
let g:ctrlp_cache_dir         = '~/.vim/cache/ctrlp'
let g:ctrlp_custom_ignore     = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings   = { 'MarkToOpen()': ['<C-z>', '<C-@>'], }

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --follow --hidden -g ""'
    " let g:ctrlp_use_caching  = 0
elseif executable('dir')
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
elseif executable('find')
    let g:ctrlp_user_command = 'find %s -type f' .
                \ '\( ! -path "*.git/*" -a ! -path "*.hg/*" -a ! -path "*.svn/*" -a ! -path "*.DS_Store" \)'
endif

nnoremap <silent> [Space]R :CtrlPLastMode --dir<CR>

nnoremap <silent> [Space]- :CtrlPClearAllCaches<CR>

nnoremap <silent> [Space]<Space> :CtrlPMixed<CR>

nnoremap <silent> [Space]d :CtrlPDir<CR>
nnoremap          [Space]D :CtrlPDir<Space>

nnoremap <silent> [Space]f :CtrlP<CR>
nnoremap          [Space]F :CtrlP<Space>

nnoremap <silent> [Space]c :CtrlPCurFile<CR>
nnoremap <silent> [Space]C :CtrlP <C-r>=fnamemodify(expand("%:h"), ':h')<CR><CR>

nnoremap <silent> [Space]b :CtrlPBuffer<CR>

nnoremap <silent> [Space]l :CtrlPLine %<CR>
nnoremap <silent> [Space]L :CtrlPLine<CR>

nnoremap <silent> [Space]k :CtrlPBookmarkDir<CR>
nnoremap          [Space]K :CtrlPBookmarkDirAdd!<Space>

nnoremap <silent> [Space]r :CtrlPMRUFiles<CR>

nnoremap <silent> [Space]T :CtrlPBufTag<CR>
nnoremap <silent> [Space]a :CtrlPBufTagAll<CR>
nnoremap <silent> [Space]A :CtrlPTag<CR>

nnoremap <silent> [Space]u :CtrlPUndo<CR>
nnoremap <silent> [Space]U :CtrlPChange<CR>

nnoremap <silent> [Space]q :CtrlPQuickfix<CR>

" mattn/ctrlp-git
nnoremap <silent> [Space]e :CtrlPGitFiles<CR>

" h14i/vim-ctrlp-buftab
nnoremap <silent> [Space]B :CtrlPBufTab<CR>

" DavidEGx/ctrlp-smarttabs
nnoremap <silent> [Space]t :CtrlPSmartTabs<CR>

" fisadev/vim-ctrlp-cmdpalette
" nnoremap <silent> [Space]M :CtrlPCmdPalette<CR>

" ompugao/ctrlp-history
nnoremap <silent> [Space]: :CtrlPCmdHistory<CR>
nnoremap <silent> [Space]/ :CtrlPSearchHistory<CR>

" mattn/ctrlp-register
nnoremap <silent> [Space]i :CtrlPRegister<CR>

" tacahiroy/ctrlp-funky
nnoremap <silent> [Space]o :CtrlPFunky<CR>

" mattn/ctrlp-mark
" nnoremap <silent> [Space]' :CtrlPMark<CR>

" mattn/ctrlp-launcher
" nnoremap <silent> [Space]O :CtrlPLauncher<CR>

" slimane/ctrlp-locationlist
nnoremap <silent> [Space]Q :CtrlPLocationlist<CR>

" LeafCage/yankround.vim
let g:yankround_dir         = '~/.vim/cache/yankround'
let g:yankround_max_history = 100

nnoremap <silent> [Space]y :CtrlPYankRound<CR>

" scrooloose/nerdtree
let g:NERDTreeWinSize       = 35
let g:NERDTreeMouseMode     = 2
let g:NERDTreeMapChangeRoot = '.' " Map . for changing root in NERDTree
let g:NERDTreeQuitOnOpen    = 0
let g:NERDTreeChDirMode     = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeBookmarksFile = expand('~/.vim/cache/NERDTreeBookmarks')

nnoremap <silent> <F9>  :NERDTreeToggle<CR>
inoremap <silent> <F9>  <Esc>:NERDTreeToggle<CR>
nnoremap <silent> <F10> :NERDTreeFind<CR>
inoremap <silent> <F10> <Esc>:NERDTreeFind<CR>

" mhinz/vim-startify
let g:startify_skiplist = [
            \ '.git/index',
            \ '.git/config',
            \ 'COMMIT_EDITMSG',
            \ 'git-rebase-todo',
            \ escape(fnamemodify($VIMRUNTIME, ':p'), '\') . 'doc',
            \ ]

let g:startify_session_dir        = '~/.vim/cache/sessions'
let g:startify_enable_special     = 0
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions      = 1

nnoremap <silent> <F5> :Startify<CR>
inoremap <silent> <F5> <Esc>:Startify<CR>

augroup MyAutoCmd
    autocmd FileType startify setlocal nofoldenable foldcolumn=0
    autocmd User Startified setlocal buftype=
augroup END

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1
nnoremap <silent> gl :ToggleBufExplorer<CR>

" sjl/gundo.vim
let g:gundo_right          = 1
let g:gundo_width          = 30
let g:gundo_preview_bottom = 1
let g:gundo_preview_height = 18
let g:gundo_auto_preview   = 0

nnoremap <silent> <F7> :GundoToggle<CR>
inoremap <silent> <F7> <Esc>:GundoToggle<CR>

" majutsushi/tagbar
let g:tagbar_sort      = 0
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_iconchars = ['▸', '▾']

nnoremap <silent> <F8> :TagbarToggle<CR>
inoremap <silent> <F8> <Esc>:TagbarToggle<CR>

" regedarek/ZoomWin
nnoremap <silent> <F2> :ZoomWin<CR>
inoremap <silent> <F2> <Esc>:ZoomWin<CR>

nnoremap <silent> [Space]<Enter> :ZoomWin<CR>

" junegunn/goyo.vim
let g:goyo_width  = '80%'
let g:goyo_height = '96%'
let g:goyo_linenr = 0

nnoremap <silent> <F3> :Goyo<CR>
inoremap <silent> <F3> <Esc>:Goyo<CR>

autocmd! User GoyoEnter nested call <SID>CustomGoyoEnter()
autocmd! User GoyoLeave nested call <SID>CustomGoyoLeave()

function! s:CustomGoyoEnter()
    let s:goyo_settings = {
                \ 'laststatus':  &laststatus,
                \ 'showtabline': &showtabline,
                \ 'showmode':    &showmode,
                \ 'linespace':   &linespace,
                \ 'ruler':       &ruler,
                \ 'scrolloff':   &scrolloff,
                \ }

    if has('gui_running')
        set fullscreen
        if &linespace == 0
            set linespace=5
        endif
    elseif exists("$TMUX")
        silent !tmux set -q status off
    endif

    set scrolloff=999
    set showmode
    set ruler

    if exists(':Limelight') == 2
        Limelight
    endif
endfunction

function! s:CustomGoyoLeave()
    if has('gui_running')
        set nofullscreen
    elseif exists("$TMUX")
        silent !tmux set -q status on
    endif

    for [k, v] in items(s:goyo_settings)
        execute printf('let &%s = %s', k, string(v))
    endfor

    if exists(':Limelight') == 2 || exists(':Limelight!')
        Limelight!
    endif
endfunction

" junegunn/limelight.vim
let g:limelight_conceal_ctermfg     = 'gray'
let g:limelight_conceal_ctermfg     = 240
let g:limelight_conceal_guifg       = 'DarkGray'
let g:limelight_conceal_guifg       = '#777777'
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span      = 1
let g:limelight_priority            = -1

" moll/vim-bbye
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>

" Yggdroot/indentLine
let g:indentLine_enabled              = 0
let g:indentLine_char                 = '│'
let g:indentLine_first_char           = g:indentLine_char
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_noConcealCursor      = 1
let g:indentLine_color_term           = 239
" let g:indentLine_color_gui            = '#A4E57E'

nnoremap <silent> <F4> :IndentLinesToggle<CR>
inoremap <silent> <F4> <Esc>:IndentLinesToggle<CR>

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
inoremap <silent> <F6> <Esc>:SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>

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
let g:anzu_status_format = "%p(%i/%l) %w"

map n  <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)zzzv
map N  <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)zzzv
map *  <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)zzzv
map #  <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)zzzv

" mhinz/vim-grepper
let g:grepper = {
            \ 'open': 1,
            \ 'jump': 0,
            \ 'next_tool': '<C-j>',
            \ 'tools': ['ag', 'hw', 'sift', 'git', 'grep', 'findstr'],
            \ 'hw': {
            \   'grepprg': 'hw --no-color --no-group -n -i $*',
            \   'grepformat': '%f:%l:%m',
            \   'escape': '\+*?^$%#()[]',
            \ },
            \ 'sift': {
            \   'grepprg': 'sift --no-color --no-group --binary-skip -n -i $*'
            \ },
            \ }

nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)

nnoremap [App]S :Grepper!<CR>

nnoremap [App]s :Grepper! -cword<CR>
xmap     [App]s <Plug>(GrepperOperator)

" tpope/vim-surround
let g:surround_indent             = 1
let g:surround_no_insert_mappings = 1

" nmap <C-s><C-w> ysiw

augroup MyAutoCmd
    autocmd VimEnter * silent! iunmap <C-g>s
    autocmd VimEnter * silent! iunmap <C-g>S
    autocmd BufEnter * silent! iunmap <buffer> <C-g>g
augroup END

" jiangmiao/auto-pairs
let g:AutoPairsMapBS              = 0
let g:AutoPairsFlyMode            = 0
let g:AutoPairsShortcutToggle     = '<M-p>'
let g:AutoPairsShortcutJump       = '<M-n>'
let g:AutoPairsShortcutFastWrap   = '<M-e>'
let g:AutoPairsShortcutBackInsert = '<M-b>'

autocmd BufEnter * execute 'inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>'

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

" vim-scripts/DeleteTrailingWhitespace
nnoremap <silent> <Leader>W :update<CR>:DeleteTrailingWhitespace<CR>

" tpope/vim-commentary
let g:commentary_map_backslash = 0

" junegunn/vim-easy-align
xnoremap <silent> <Enter> :EasyAlign<Enter>

" godlygeek/tabular
nnoremap [App]<Enter> :Tabularize /
xnoremap [App]<Enter> :Tabularize /

autocmd MyAutoCmd FileType cucumber inoremap <silent> <buffer> <Bar> <Bar><Esc>:call <SID>BarAlign()<CR>a

function! s:BarAlign()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" terryma/vim-expand-region
" Default settings
let g:expand_region_text_objects = {
            \ 'iw'  :0,
            \ 'iW'  :0,
            \ 'i"'  :0,
            \ 'i''' :0,
            \ 'i]'  :1,
            \ 'ib'  :1,
            \ 'iB'  :1,
            \ 'il'  :0,
            \ 'ip'  :0,
            \ 'ie'  :0,
            \ }

" Extend the global dictionary
call expand_region#custom_text_objects({
            \ "\/\\n\\n\<CR>": 1,
            \ 'a]'  :1,
            \ 'ab'  :1,
            \ 'aB'  :1,
            \ 'ii'  :0,
            \ 'ai'  :0,
            \ })

" Customize it further for ruby
call expand_region#custom_text_objects('ruby', {
            \ 'im' :0,
            \ 'am' :0,
            \ })

" Customize it further for ruby
call expand_region#custom_text_objects('go', {
            \ 'if' :0,
            \ 'af' :0,
            \ })

" Customize it further for html
call expand_region#custom_text_objects('html', {
            \ 'it' :1,
            \ })

map - <Plug>(expand_region_shrink)
map + <Plug>(expand_region_expand)

" terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

xnoremap <F6> :MultipleCursorsFind<Space>

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        execute 'NeoCompleteLock'
    endif
endfunction

" Called once only when the multiple selection is cancelled (default <Esc>)
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock') == 2
        execute 'NeoCompleteUnlock'
    endif
endfunction

" mhinz/vim-signify
let g:signify_vcs_list              = [ 'git', 'hg' ]
let g:signify_disable_by_default    = 0
let g:signify_cursorhold_insert     = 0
let g:signify_cursorhold_normal     = 0
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 0

nmap ]c <Plug>(signify-next-hunk)zz
nmap ]C 999]c
nmap [c <Plug>(signify-prev-hunk)zz
nmap [C 999[c

nnoremap <silent> cog :SignifyToggle<CR>

" tpope/vim-fugitive
augroup MyAutoCmd
    autocmd FileType gitcommit nmap <silent> <buffer> U :Git checkout -- <C-r><C-g><CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

nnoremap          <Leader>G  :Git!<Space>
nnoremap          <Leader>gi :Git<Space>
nnoremap          <Leader>gu :Git commit -m ""<Left>
nnoremap          <Leader>ga :Git add -p %<CR><CR>
nnoremap          <Leader>ge :Gedit<Space>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap          <Leader>gm :Gmerge<Space>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gB :echo fugitive#head()<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gR :Gremove<CR>
nnoremap          <Leader>gM :Gmove<Space>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap          <Leader>gC :Gcommit<Space>
nnoremap <silent> <Leader>gf :Gfetch<CR>
nnoremap <silent> <Leader>gF :Gfetch -p<CR>
nnoremap <silent> <Leader>gp :Gpush<CR>
nnoremap <silent> <Leader>gP :Gpull<CR>
nnoremap          <Leader>g/ :Ggrep!<Space>
nnoremap          <Leader>gg :Ggrep! <C-r>=GetWordForAck()<CR><Space>
xnoremap          <Leader>gg <Esc>:Ggrep! <C-r>=GetSelectedTextForAck()<CR><Space>
nnoremap          <Leader>gl :Glog!<Space>
nnoremap          <Leader>gL :Gllog!<Space>

if executable('gitk')
    command! -nargs=* -complete=dir -complete=file Gitk !gitk <args>
    nnoremap <silent> <Leader>gk :Gitk<CR><CR>
    nnoremap          <Leader>gK :Gitk<Space>
endif

if !has('gui_running') && executable('tig')
    command! -nargs=* -complete=dir -complete=file Tig !tig <args>
    nnoremap <silent> <Leader>gt :Tig<CR><CR>
    nnoremap          <Leader>gT :Tig<Space>
endif

" Shougo/neocomplete.vim
let g:acp_enableAtStartup                           = 0 " Disable AutoComplPop
let g:neocomplete#enable_at_startup                 = 1 " Use neocomplete
let g:neocomplete#enable_smart_case                 = 1 " Use smartcase
let g:neocomplete#enable_camel_case                 = 1 " Use camelcase
let g:neocomplete#auto_completion_start_length      = 2 " Set auto completion length
let g:neocomplete#manual_completion_start_length    = 0 " Set manual completion length
let g:neocomplete#min_keyword_length                = 3 " Set minimum keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
let g:neocomplete#data_directory                    = '~/.vim/cache/neocomplete'
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.ruby   = '[^. *\t]\.\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.c      = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#force_omni_input_patterns.cpp    = '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#force_omni_input_patterns.objc   = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp = '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:neocomplete#sources#vim#complete_functions = {
            \ 'Unite' : 'unite#complete_source',
            \ }
call neocomplete#custom#source('look', 'min_pattern_length', 4)

" Plugin key-mappings
" <C-y>: paste
inoremap <expr> <C-y> pumvisible() ? neocomplete#close_popup() :  "\<C-r>\""
" <C-e>: close popup
inoremap <expr> <C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-o>b"
inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
" <C-n>: neocomplete
" inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion
" inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" inoremap <expr> '     pumvisible() ? neocomplete#close_popup() : "'"

inoremap <silent> <expr> <C-x><C-f> neocomplete#start_manual_complete('file')

inoremap <expr> <C-g> neocomplete#undo_completion()
" inoremap <expr> <C-l> neocomplete#complete_common_string()
inoremap <expr> <C-l> neocomplete#smart_close_popup()."\<C-o>w"

" <Tab>: completion
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : neocomplete#start_manual_complete()
" function! s:check_back_space()
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" <S-Tab>: completion back
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" For cursor moving in insert mode
inoremap <expr> <Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr> <Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr> <Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr> <Down>  neocomplete#close_popup() . "\<Down>"

let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

" Shougo/neosnippet.vim
let g:neosnippet#snippets_directory            = '~/.vim/plugged/vim-snippets/snippets,~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1

" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)

" Ctrl-Space
imap <C-@> <Plug>(neosnippet_expand_or_jump)
smap <C-@> <Plug>(neosnippet_expand_or_jump)
xmap <C-@> <Plug>(neosnippet_expand_target)

imap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<Tab>"
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
smap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <silent> [Space]I :Unite -buffer-name=snippets neosnippet<CR>

if exists("$TMUX")
    " common tmux functions
    function! TmuxFormatCommand(text)
        let cmd = substitute(a:text, '^\s*', '', '')
        let cmd = substitute(cmd, '\s*$', '', '')
        let cmd = substitute(cmd, '^\n*', '', '')
        let cmd = substitute(cmd, '\n*$', '', '')
        let cmd = substitute(cmd, '\n\+', '\n', '')
        return cmd
    endfunction

    function! TmuxFormatKeys(text)
        let keys = substitute(a:text, '\n+', ' ', '')
        let keys = substitute(keys, '^\s*', '', '')
        let keys = substitute(keys, '\s*$', '', '')
        let keys = substitute(keys, '\s\+', ' ', '')
        return keys
    endfunction

    " jgdavey/vim-turbux
    if !has('gui_running')
        let g:turbux_runner = 'vimux'
    endif

    " benmills/vimux
    let g:VimuxUseNearest = 1
    let g:VimuxHeight     = 25

    nnoremap [vimux] <Nop>
    xnoremap [vimux] <Nop>
    nmap     [App]v  [vimux]
    xmap     [App]v  [vimux]

    xnoremap <silent> [vimux]s "my:call VimuxSlime(@m)<CR>
    nmap     <silent> [vimux]s vip[vimux]s
    nnoremap <silent> [vimux]r :VimuxPromptCommand<CR>
    nnoremap <silent> [vimux]R :VimuxRunLastCommand<CR>
    nnoremap <silent> [vimux]q :call VimuxSendManyKeys('q C-u')<CR>
    nnoremap <silent> [vimux]m :call VimuxSendManyKeys('Enter')<CR>
    nnoremap <silent> [vimux]d :call VimuxSendManyKeys('C-d')<CR>
    nnoremap <silent> [vimux]c :call VimuxSendManyKeys('C-c')<CR>
    nnoremap <silent> [vimux]l :call VimuxSendManyKeys('C-c C-l')<CR>
    nnoremap <silent> [vimux]k :call VimuxSendManyKeys(input('Keys? '))<CR>

    " Runner-related
    nnoremap <silent> [vimux]o :call VimuxOpenRunner()<CR>
    nnoremap <silent> [vimux]O :VimuxCloseRunner<CR>
    nnoremap <silent> [vimux]p :VimuxTogglePane<CR>
    nnoremap <silent> [vimux]i :VimuxInspectRunner<CR>
    nnoremap <silent> [vimux]I :VimuxInterruptRunner<CR>
    nnoremap <silent> [vimux]h :VimuxClearRunnerHistory<CR>
    nnoremap <silent> [vimux]z :VimuxZoomRunner<CR>
    nnoremap <silent> [vimux][ :VimuxScrollUpInspect<CR>
    nnoremap <silent> [vimux]] :VimuxScrollDownInspect<CR>

    function! VimuxSlime(text)
        let cmd = TmuxFormatCommand(a:text)

        if empty(cmd)
            return
        endif

        if !exists("g:VimuxRunnerIndex") || _VimuxHasRunner(g:VimuxRunnerIndex) == -1
            call VimuxOpenRunner()
        endif

        call VimuxSendText(cmd)
        call VimuxSendKeys('Enter')
    endfunction

    function! VimuxSendManyKeys(text)
        let keys = TmuxFormatKeys(a:text)

        if empty(keys)
            return
        endif

        if !exists("g:VimuxRunnerIndex") || _VimuxHasRunner(g:VimuxRunnerIndex) == -1
            call VimuxOpenRunner()
        endif

        for key in split(keys, '\s')
            call VimuxSendKeys(key)
        endfor
    endfunction

    " mhinz/vim-tmuxify
    let g:tmuxify_custom_command = 'tmux split-window -d -p 20'
    let g:tmuxify_map_prefix     = '[App]m'
    let g:tmuxify_global_maps    = 1

    nnoremap <silent> [App]mu :TxSendKey! 'q C-u'<CR>
    nnoremap <silent> [App]mm :TxSendKey! 'Enter'<CR>
    nnoremap <silent> [App]md :TxSendKey! 'C-d'<CR>

    nnoremap <silent> [App]tb :TxSigInt<CR>
    nnoremap <silent> [App]tc :TxClear<CR>
    nnoremap <silent> [App]tn :TxCreate<CR>
    nnoremap <silent> [App]tp :TxSetPane<CR>
    nnoremap <silent> [App]tq :TxKill<CR>
    nnoremap <silent> [App]tr :TxRun<CR>
    nnoremap <silent> [App]ts :TxSend<CR>
    nnoremap <silent> [App]tk :TxSendKey<CR>
    xnoremap <silent> [App]ts "my:TxSend(@m)<CR>
    nnoremap <silent> [App]tu :TxSendKey 'q C-u'<CR>
    nnoremap <silent> [App]tm :TxSendKey 'Enter'<CR>
    nnoremap <silent> [App]td :TxSendKeyl'C-d'<CR>
endif

" mattn/emmet-vim
let g:user_emmet_install_global  = 1
let g:user_emmet_install_command = 0
let g:user_emmet_mode            = 'i'

" morhetz/gruvbox
let g:gruvbox_contrast_dark  = 'hard'

function! s:xmllint_setup()
    let xmllint = 'setlocal equalprg=env\ XMLLINT_INDENT=''%s''\ xmllint\ --format\ --recover\ -\ 2>/dev/null'
    if exists('*shiftwidth')
        let xmllint = printf(xmllint, repeat('\ ', shiftwidth()))
    else
        let xmllint = printf(xmllint, repeat('\ ', &shiftwidth))
    endif
    execute xmllint
endfunction

augroup MyAutoCmd
    " Set file type
    autocmd BufNewFile,BufRead *.nvim setlocal filetype=vim
    autocmd BufNewFile,BufRead *.fastercsv,*.prawn setlocal filetype=ruby
    " autocmd FileType json setlocal syntax=javascript

    " Vim
    autocmd FileType vim setlocal keywordprg=:help

    " Help
    autocmd FileType help setlocal keywordprg=:help noexpandtab

    " Quickfix
    autocmd FileType qf setlocal winheight=15 nobuflisted

    " Ruby-related
    autocmd FileType ruby,eruby,yaml,haml,markdown,less,sass,scss,coffee,html.handlebars setlocal tabstop=2 shiftwidth=2

    " CSS / Less
    autocmd FileType css,less setlocal iskeyword+=-

    " SQL
    autocmd FileType sql setlocal omnifunc= commentstring=--\ %s

    " XML
    if executable('xmllint')
        autocmd FileType xml call s:xmllint_setup()
    endif

    " Go
    autocmd FileType go,godoc,gedoc setlocal noexpandtab
    autocmd FileType godoc,gedoc    setlocal tabstop=8

    " Git
    autocmd FileType gitcommit setlocal textwidth=72 winheight=20 spell
    autocmd FileType git,gitconfig setlocal tabstop=8

    " q to close
    autocmd FileType help,qf,godoc,gedoc nmap <silent> <buffer> q :close<CR>

    " Folding
    autocmd FileType vim setlocal foldmethod=marker foldmarker={{{,}}}
    autocmd FileType nginx,puppet,c,javascript,go,less,css setlocal foldmethod=marker foldmarker={,}
augroup END

set background=dark
colorscheme gruvbox

set secure

