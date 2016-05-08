" No Vi Compatibility
if &compatible
    set nocompatible
endif

if &shell =~# 'fish$'
    set shell=bash
endif

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

" Disable sql completion
let g:loaded_sql_completion    = 1
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

" rsi.vim: Readline style insertion
Plug 'tpope/vim-rsi'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Set vim cursor for iTerm
Plug 'phongnh/vim-iterm-cursor'

" Asynchronous build and test dispatcher
Plug 'tpope/vim-dispatch'

" Interactive command execution
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

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
Plug 'kaneshin/ctrlp-tabbed'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'ompugao/ctrlp-history'
Plug 'mattn/ctrlp-register'
Plug 'tacahiroy/ctrlp-funky'
Plug 'https://bitbucket.org/slimane/ctrlp-locationlist'

" logging registers and reusing them
Plug 'LeafCage/yankround.vim'

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

" A fancy start screen
Plug 'mhinz/vim-startify'

" Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

if has('python')
    " Visualize your Vim undo tree
    Plug 'sjl/gundo.vim'
else
    " The ultimate undo history visualizer for VIM
    Plug 'mbbill/undotree'
endif

if executable('ctags')
    " A class outline viewer for Vim
    Plug 'majutsushi/tagbar'
    Plug 'phongnh/vim-tagbar-settings'
endif

" projectionist.vim: project configuration
Plug 'tpope/vim-projectionist'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" BufExplorer Plugin for Vim
Plug 'jlanzarotta/bufexplorer'

" Delete buffers and close files in Vim without closing your windows or messing up your layout
Plug 'moll/vim-bbye'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
" Toggle useful settings
Plug 'phongnh/vim-toggler'

" Simple highlight plugin
Plug 'phongnh/vim-simple-highlight'

" extended % matching for HTML, LaTeX, and many other languages
Plug 'vim-scripts/matchit.zip'

" My vim functions for search and substitue
Plug 'phongnh/vim-search-helpers'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'
" Vim search status
Plug 'osyo-manga/vim-anzu'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" Helpers for UNIX
Plug 'tpope/vim-eunuch'
" Phong's vim command helpers
Plug 'phongnh/vim-command-helpers'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'                  " l
Plug 'kana/vim-textobj-indent'                " i
Plug 'kana/vim-textobj-entire'                " e
Plug 'glts/vim-textobj-comment'               " c
Plug 'mattn/vim-textobj-url'                  " u
Plug 'Julian/vim-textobj-variable-segment'    " v
Plug 'rhysd/vim-textobj-anyblock'             " b
Plug 'thinca/vim-textobj-between'             " f{char}, remapped to n{char}
Plug 'sgur/vim-textobj-parameter'             " ,
Plug 'whatyouhide/vim-textobj-xmlattr'        " x
Plug 'rhysd/vim-textobj-ruby'                 " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
Plug 'whatyouhide/vim-textobj-erb'            " E, remapped to y
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript' " f
Plug 'poetic/vim-textobj-javascript'          " c, remapped to j

" Vim plugin to copy current editing file path to clipboard (if support)
Plug 'phongnh/vim-copypath'

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

" Delete unwanted whitespace at the end of lines
Plug 'vim-scripts/DeleteTrailingWhitespace'

" A vim plugin that simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'

" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" Smart selection of the closest text object
Plug 'gcmt/wildfire.vim'

" Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
Plug 'terryma/vim-expand-region'
" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug 'chrisbra/NrrwRgn'

" Code completion and Snippets
if has('lua')
    Plug 'Shougo/neocomplete.vim'
else
    Plug 'Shougo/neocomplcache.vim'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" SCM
" A awesome Git wrapper so awesome
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
Plug 'rhysd/vim-go-impl'    " go get github.com/josharian/impl
Plug 'garyburd/go-explorer' " go get github.com/garyburd/go-explorer/src/getool

if has('python')
    " Provide easy code formatting in Vim by integrating existing code formatters.
    Plug 'Chiel92/vim-autoformat'
endif

" Zeal for Vim
Plug 'KabbAmine/zeavim.vim'

" Utility
" A Vim plugin that provides a completion function for Unicode glyphs
Plug 'chrisbra/unicode.vim'

" An implementation of Sublime's PlainTasks plugin for Vim
Plug 'elentok/plaintasks.vim', { 'for': 'plaintasks' }

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

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
set completeopt=menuone
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
imap <F1> <Esc><F1>

" CTRL-Space: Show history
cnoremap <C-@> <C-F>

" CTRL-V: Paste from clipboard
cnoremap <C-V> <C-R>+

" Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>

" CTRL-T: Insert tab
inoremap <silent> <C-T> <C-V><Tab>

" Jump to last active buffer
inoremap <C-^> <C-C><C-^>
" inoremap <C-^> <C-C>:update<CR><C-^>

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

nmap <Tab>   <C-W>w
nmap <S-Tab> <C-W>W

" Reload buffer
nnoremap <silent> <C-W>e     :edit<CR>
nnoremap <silent> <C-W><C-E> :edit<CR>
nnoremap <silent> <C-W>E     :edit!<CR>

" Unload buffer
nnoremap <silent> <C-W>D :bdelete<CR>

" gb: Last buffer
nnoremap <silent> gb :buffer#<CR>

" Save buffer
nmap <silent> <C-S> :update<CR>
vmap <C-S> <Esc><C-S>gv
imap <C-S> <Esc><C-S>
nmap <Leader>w <C-S>

" Exit Vim.  Bring up a prompt when some buffers have been changed
nnoremap <silent> ZC :confirm qall<CR>

" Use <C-\><C-\> to do <C-]> but open it in a new split
nmap <C-\><C-\> <C-W>v<C-]>zvzz

" Search and Replace
nnoremap <Leader>sr :%s/<C-R>=GetWordForSubstitute()<CR>/gc<Left><Left><Left>
nnoremap <Leader>sR :%s//gc<Left><Left><Left>

xnoremap <Leader>sr <Esc>:%s/<C-R>=GetSelectedTextForSubstitute()<CR>//gc<Left><Left><Left>
xnoremap <Leader>sR :s/\%V/gc<Left><Left><Left>

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

inoremap <silent> <C-V> <C-G>u<C-O>"+gP

" Redraw
nnoremap <silent> <LocalLeader><LocalLeader> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Meta workround
if !has('gui_running') && !has('nvim')
    " jiangmiao/auto-pairs
    execute "set <M-a>=\<Esc>a"
    execute "set <M-g>=\<Esc>g"
    execute "set <M-w>=\<Esc>w"
    execute "set <M-i>=\<Esc>i"

    " Shougo/neocomplete.vim and Shougo/neocomplcache.vim
    execute "set <M-/>=\<Esc>\/"

    " gcmt/wildfire.vim
    execute "set <M-h>=\<Esc>h"
    execute "set <M-l>=\<Esc>l"
    execute "set <M-s>=\<Esc>s"

    " terryma/vim-expand-region
    execute "set <M-j>=\<Esc>j"
    execute "set <M-k>=\<Esc>k"
endif

" cscope settings
if has('cscope')
    set cscopetag
    set cscopetagorder=0
    set cscopeverbose

    " The following maps all invoke one of the following cscope search types:
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

    nnoremap <C-\>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
    xnoremap <C-\>t y:cscope find t <C-R>"<CR>
    nnoremap <C-\>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <C-\>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nnoremap <C-\>d :cscope find d <C-R>=expand("<cword>")<CR><CR>

    nnoremap <C-\><C-S> :vertical scscope find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\><C-G> :vertical scscope find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\><C-C> :vertical scscope find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\><C-T> :vertical scscope find t <C-R>=expand("<cword>")<CR><CR>
    xnoremap <C-\><C-T> y:vertical scscope find t <C-R>"<CR>
    nnoremap <C-\><C-E> :vertical scscope find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <C-\><C-F> :vertical scscope find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <C-\><C-I> :vertical scscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nnoremap <C-\><C-D> :vertical scscope find d <C-R>=expand("<cword>")<CR><CR>

    " Add cscope database
    function! s:AddCscopeDB() abort
        " Add database specified via environment variable $CSCOPE_DB
        if !empty($CSCOPE_DB)
            silent cscope reset
            silent! execute 'cscope add' $CSCOPE_DB
        else
            " Add any database in current directory
            let db = findfile('cscope.out', '.;')
            if !empty(db)
                silent cscope reset
                silent! execute 'cscope add' db
            end
        endif
    endfunction

    call s:AddCscopeDB()

    command! -nargs=+ -complete=custom,<SID>CscopeSearchTypes CsFind  cscope find <args>
    command! -nargs=+ -complete=custom,<SID>CscopeSearchTypes ScsFind scscope find <args>
    command! -nargs=+ -complete=custom,<SID>CscopeSearchTypes VcsFind vertical scscope find <args>

    function! s:CscopeSearchTypes(A, L, P) abort
        let parts = split(a:L, '\s\+')
        if len(parts) == 1
            return join(['s', 'g', 'c', 't', 'e', 'f', 'i', 'd'], "\n")
        endif
        return ""
    endfunction
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

if has_key(g:plugs, 'ctrlp-py-matcher')
    " FelikZ/ctrlp-py-matcher
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_max_files           = 0
    let g:ctrlp_match_func          = { 'match': 'pymatcher#PyMatch' }

    if has_key(g:plugs, 'cpsm') && filereadable(g:plugs['cpsm']['dir'] + 'autoload/cpsm_py.so')
        " nixprime/cpsm
        let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
    endif
endif

" ctrlpvim/ctrlp.vim
let g:ctrlp_match_window      = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_map               = ''
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_reuse_window      = 'startify'
let g:ctrlp_prompt_mappings   = { 'MarkToOpen()': ['<C-Z>', '<C-@>'], }
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

nnoremap <silent> <Leader>d :CtrlPDir<CR>

nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap          <Leader>F :CtrlP<Space>

nnoremap <silent> <Leader>e :CtrlPRoot<CR>

nnoremap <silent> <Leader>c :CtrlPCurFile<CR>
nnoremap <silent> <Leader>C :CtrlP <C-R>=expand("%:h:h")<CR><CR>

nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

nnoremap <silent> <Leader>l :CtrlPLine %<CR>
nnoremap <silent> <Leader>L :CtrlPLine<CR>

nnoremap <silent> <Leader>k :CtrlPBookmarkDir<CR>
nnoremap          <Leader>K :CtrlPBookmarkDirAdd!<Space>

nnoremap <silent> <Leader>r :CtrlPMRUFiles<CR>
nnoremap <silent> <Leader>R :CtrlPMRUFiles<CR>

nnoremap <silent> <Leader>[ :CtrlPBufTag<CR>
nnoremap <silent> <Leader>] :CtrlPBufTagAll<CR>

nnoremap <silent> <Leader>\ :CtrlPTag<CR>

nnoremap <silent> <Leader>q :CtrlPQuickfix<CR>

" phongnh/ctrlp-finder
nnoremap <silent> <Leader>E :CtrlPFinder<CR>

" h14i/vim-ctrlp-buftab
nnoremap <silent> <Leader>B :CtrlPBufTab<CR>

" DavidEGx/ctrlp-smarttabs
nnoremap <silent> <Leader>t :CtrlPSmartTabs<CR>

" kaneshin/ctrlp-tabbed
nnoremap <silent> <Leader>T :CtrlPTabbed<CR>

" fisadev/vim-ctrlp-cmdpalette
nnoremap <silent> <Leader>; :CtrlPCmdPalette<CR>

" ompugao/ctrlp-history
nnoremap <silent> <Leader>: :CtrlPCmdHistory<CR>
nnoremap <silent> <Leader>/ :CtrlPSearchHistory<CR>

" mattn/ctrlp-register
nnoremap <silent> <Leader>i :CtrlPRegister<CR>

" tacahiroy/ctrlp-funky
nnoremap <silent> <Leader>o :CtrlPFunky<CR>
nnoremap <silent> <Leader>O :CtrlPFunkyMulti<CR>

" slimane/ctrlp-locationlist
nnoremap <silent> <Leader>Q :CtrlPLocationlist<CR>

" LeafCage/yankround.vim
let g:yankround_max_history = 100

nnoremap <silent> <Leader>y :CtrlPYankRound<CR>

" regedarek/ZoomWin
nnoremap <silent> <F2> :ZoomWin<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <Esc><F2>a
nmap <silent> <Leader>z <F2>

" junegunn/goyo.vim
let g:goyo_width  = '80%'
let g:goyo_height = '96%'
let g:goyo_linenr = 0

nnoremap <silent> <F3> :Goyo<CR>
imap <silent> <F3> <Esc><F3>
nmap <silent> <Leader><CR> <F3>

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
    imap <silent> <F4> <Esc><F4>
    nmap <silent> <Leader>ui <F4>
else
    " nathanaelkane/vim-indent-guides
    let g:indent_guides_start_level           = 1
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_color_change_percent  = 3

    nnoremap <silent> <F4> :IndentGuidesToggle<CR>
    imap <silent> <F4> <Esc><F4>
    nmap <silent> <Leader>ui <F4>
endif

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
imap <silent> <F5> <Esc><F5>
nmap <silent> <Leader>us <F5>

augroup MyAutoCmd
    autocmd FileType startify setlocal nofoldenable foldcolumn=0
    autocmd User Startified setlocal buftype=
augroup END

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
imap <silent> <F6> <Esc><F6>
nmap <silent> <Leader>uc <F6>
nnoremap <silent> <Leader>uC :SyntasticCheck<Space>

if has('python')
    " sjl/gundo.vim
    let g:gundo_right          = 1
    let g:gundo_width          = 30
    let g:gundo_preview_bottom = 1
    let g:gundo_preview_height = 18
    let g:gundo_auto_preview   = 0

    nnoremap <silent> <F7> :GundoToggle<CR>
    imap <silent> <F7> <Esc><F7>
    nmap <silent> <Leader>uu <F7>
else
    " mbbill/undotree
    let g:undotree_WindowLayout       = 'botright'
    let g:undotree_SetFocusWhenToggle = 1

    nnoremap <silent> <F7> :UndotreeToggle<CR>
    imap <silent> <F7> <Esc><F7>
    nmap <silent> <Leader>uu <F7>
endif

if has_key(g:plugs, 'tagbar')
    " majutsushi/tagbar
    let g:tagbar_sort      = 0
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 0
    let g:tagbar_iconchars = ['▸', '▾']

    nnoremap <silent> <F8> :TagbarToggle<CR>
    imap <silent> <F8> <Esc><F8>
    nmap <silent> <Leader>ut <F8>
endif

" scrooloose/nerdtree
let g:NERDTreeWinSize       = 35
let g:NERDTreeMouseMode     = 2
let g:NERDTreeMapChangeRoot = '.' " Map . for changing root in NERDTree
let g:NERDTreeQuitOnOpen    = 0
let g:NERDTreeChDirMode     = 0
let g:NERDTreeShowBookmarks = 1

nnoremap <silent> <F9> :NERDTreeToggle<CR>
imap <silent> <F9> <Esc><F9>
nmap <silent> <Leader>uo <F9>

nnoremap <silent> <F10> :NERDTreeFind<CR>
imap <silent> <F10> <Esc><F10>
nmap <silent> <Leader>uf <F10>

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1

nnoremap <silent> gl :ToggleBufExplorer<CR>

" moll/vim-bbye
command! -bang -complete=buffer -nargs=? BD Bdelete<bang> <args>

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
nmap <Leader>sf <Plug>CtrlSFPrompt
nmap <Leader>sc <Plug>CtrlSFCwordExec
nmap <Leader>sC <Plug>CtrlSFCwordPath
vmap <Leader>sc <Plug>CtrlSFVwordExec
vmap <Leader>sC <Plug>CtrlSFVwordPath
nmap <Leader>sp <Plug>CtrlSFPwordExec
nmap <Leader>sP <Plug>CtrlSFPwordPath
nnoremap <silent> <Leader>su :CtrlSFUpdate<CR>
nnoremap <silent> <Leader>so :CtrlSFToggle<CR>

" mhinz/vim-grepper
let g:grepper = {
            \ 'open': 1,
            \ 'switch': 0,
            \ 'jump': 0,
            \ 'next_tool': '<C-J>',
            \ 'tools': ['ag', 'pt', 'sift', 'git', 'grep', 'findstr'],
            \ 'sift': {
            \   'grepprg': 'sift --binary-skip --git --err-skip-line-length -n -i $*'
            \ },
            \ }

nmap <silent> gs <Plug>(GrepperOperator)
xmap <silent> gs <Plug>(GrepperOperator)

nnoremap <silent> <Leader>ss :echo 'Searching...'<CR>:Grepper -cword -noprompt<CR>
xmap     <silent> <Leader>ss <Plug>(GrepperOperator)
nnoremap <silent> <Leader>S  :Grepper<CR>

nnoremap <silent> <Leader>sg :echo 'Searching...'<CR>:Grepper -noquickfix -switch -cword -noprompt<CR>
nnoremap <silent> <Leader>G  :Grepper -noquickfix -switch<CR>

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

" tpope/vim-surround
let g:surround_indent             = 1
let g:surround_no_insert_mappings = 1

nmap <Leader>sw ysiw
nmap <Leader>sW ysiW

" tpope/vim-abolish
nnoremap <Leader>ab :%Abolish
xnoremap <Leader>ab :Abolish
nnoremap <Leader>ar :%Subvert
xnoremap <Leader>ar :Subvert

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode            = 0
let g:AutoPairsShortcutToggle     = '<M-a>'
let g:AutoPairsShortcutJump       = '<M-g>'
let g:AutoPairsShortcutFastWrap   = '<M-w>'
let g:AutoPairsShortcutBackInsert = '<M-i>'

" vim-scripts/DeleteTrailingWhitespace
nnoremap <silent> <Leader>W :update<CR>:DeleteTrailingWhitespace<CR>

" tpope/vim-commentary
let g:commentary_map_backslash = 0

" junegunn/vim-easy-align
xnoremap <silent> <Enter> :EasyAlign<Enter>

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

" terryma/vim-expand-region
" Default settings
let g:expand_region_text_objects = {
            \ 'iw' : 0,
            \ 'iW' : 0,
            \ "i'" : 0,
            \ "a'" : 0,
            \ 'i"' : 0,
            \ 'a"' : 0,
            \ }

for s:char in split(") ] } b B")
    call extend(g:expand_region_text_objects, { "i".s:char : 1, "a".s:char : 1 })
endfor

call extend(g:expand_region_text_objects, {
            \ 'il' : 0,
            \ 'ip' : 0,
            \ 'ie' : 0,
            \ })

" Customize it further for ruby
call expand_region#custom_text_objects('ruby', {
            \ 'ir' : 1,
            \ 'ar' : 1,
            \ 'im' : 0,
            \ 'am' : 0,
            \ 'iM' : 1,
            \ 'aM' : 1,
            \ })

call expand_region#custom_text_objects('eruby', {
            \ 'iy' : 0,
            \ 'ay' : 0,
            \ })

" Customize it further for go
call expand_region#custom_text_objects('go', {
            \ 'if' : 0,
            \ 'af' : 0,
            \ })

" Customize it further for html
call expand_region#custom_text_objects('html', {
            \ 'it' : 1,
            \ 'at' : 1,
            \ })

call expand_region#custom_text_objects('xml', {
            \ 'it' : 1,
            \ 'at' : 1,
            \ })

map <M-k> <Plug>(expand_region_expand)
map <M-j> <Plug>(expand_region_shrink)

" terryma/vim-multiple-cursors
xnoremap <F6> :MultipleCursorsFind<Space>

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before() abort
    if exists(':NeoCompleteLock') == 2
        silent! NeoCompleteLock
    elseif exists(':NeoComplCacheLock') == 2
        silent! NeoComplCacheLock
    endif
endfunction

" Called once only when the multiple selection is cancelled (default <Esc>)
function! Multiple_cursors_after() abort
    if exists(':NeoCompleteUnlock') == 2
        silent! NeoCompleteUnlock
    elseif exists(':NeoComplCacheUnlock') == 2
        silent! NeoComplCacheUnlock
    endif
endfunction

" chrisbra/NrrwRgn
let g:nrrw_topbot_leftright = 'botright'
let g:nrrw_rgn_nomap_nr     = 1
let g:nrrw_rgn_nomap_Nr     = 1

nmap <Leader>n <Plug>NrrwrgnDo
xmap <Leader>n <Plug>NrrwrgnDo
xmap <Leader>N <Plug>NrrwrgnBangDo

if has_key(g:plugs, 'neocomplete.vim')
    " Shougo/neocomplete.vim
    let g:neocomplete#enable_at_startup                 = 1 " Use neocomplete
    let g:neocomplete#enable_smart_case                 = 1 " Use smartcase
    let g:neocomplete#min_keyword_length                = 3 " Set minimum keyword length
    let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length
    let g:neocomplete#ignore_source_files               = []
    let g:neocomplete#force_overwrite_completefunc      = 1
    let g:neocomplete#enable_auto_select                = 0
    let g:neocomplete#enable_auto_delimiter             = 1

    " Disable tag completion
    let g:neocomplete#ignore_source_files = ['tag.vim']

    call neocomplete#custom#source('look', 'min_pattern_length', 4)
    call neocomplete#custom#source('_', 'converters',
                \ [ 'converter_add_paren', 'converter_remove_overlap', 'converter_delimiter', 'converter_abbr' ])

    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default'  : '',
                \ 'vimshell' : $HOME . '/.vimshell_history',
                \ }

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\k*(\?'

    " Enable omni completion
    augroup MyAutoCmd
        autocmd FileType sql setlocal omnifunc=
    augroup END

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

    let g:neocomplete#sources#omni#input_patterns.c      = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp    = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.python = '[^. *\t]\.\w*\|\h\w*'
    let g:neocomplete#sources#omni#input_patterns.ruby   = '[^. *\t]\.\w*\|\h\w*::\w*'
    " let g:neocomplete#force_omni_input_patterns.ruby     = '[^. *\t]\.\w*\|\h\w*::\w*'

    let g:neocomplete#sources#omni#functions.go = 'go#complete#Complete'

    let g:neocomplete#sources#vim#complete_functions = {
                \ 'Unite'    : 'unite#complete_source',
                \ 'VimShell' : 'vimshell#complete',
                \ 'VimFiler' : 'vimfiler#complete',
                \ }

    let g:neocomplete#fallback_mappings = ["\<C-X>\<C-O>", "\<C-X>\<C-N>"]

    " <CR>: close popup
    inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return neocomplete#close_popup() . "\<CR>"
    endfunction

    " CTRL-H, <BS>: close popup and delete backword char
    inoremap <expr> <C-H> neocomplete#close_popup()."\<C-H>"
    inoremap <expr> <BS>  neocomplete#close_popup()."\<C-H>"

    inoremap          <expr> <C-X><C-G> neocomplete#undo_completion()
    inoremap          <expr> <C-X><C-@> neocomplete#complete_common_string()
    inoremap <silent> <expr> <C-X><C-F> neocomplete#start_manual_complete('file')

    " <Tab>: completion
    inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
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
endif

if has_key(g:plugs, 'neocomplcache.vim')
    " Shougo/neocomplcache.vim
    let g:neocomplcache_enable_at_startup            = 1 " Use neocomplcache
    let g:neocomplcache_enable_smart_case            = 1 " Use smartcase
    let g:neocomplcache_min_keyword_length           = 3 " Set minimum keyword length
    let g:neocomplcache_min_syntax_length            = 3 " Set minimum syntax keyword length
    let g:neocomplcache_force_overwrite_completefunc = 1
    let g:neocomplcache_enable_prefetch              = 1
    let g:neocomplcache_skip_auto_completion_time    = '0.6'
    let g:neocomplcache_enable_auto_select           = 0
    let g:neocomplcache_enable_auto_delimiter        = 1

    " Disable tag completion
    if !exists('g:neocomplcache_disabled_sources_list')
        let g:neocomplcache_disabled_sources_list = {}
    endif
    let g:neocomplcache_disabled_sources_list._ = ['tags_complete']

    call neocomplcache#custom_source('look', 'min_pattern_length', 4)

    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default'  : '',
                \ 'vimshell' : $HOME . '/.vimshell_history',
                \ }

    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    " let g:neocomplcache_keyword_patterns._ = '[0-9a-zA-Z:#_]\+'
    let g:neocomplcache_keyword_patterns._ = '\h\k*(\?'

    " Enable omni completion
    augroup MyAutoCmd
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType sql setlocal omnifunc=
        autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    augroup END

    " Enable heavy omni completion
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif

    if !exists('g:neocomplcache_omni_functions')
        let g:neocomplcache_omni_functions = {}
    endif

    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif

    let g:neocomplcache_force_omni_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.go  = '\h\w*\.\?'
    " let g:neocomplcache_omni_patterns.ruby      = '[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby      = '[^. *\t]\.\w*\|\h\w*::\w*'

    let g:neocomplcache_omni_functions.go = 'go#complete#Complete'

    let g:neocomplcache_vim_completefuncs = {
                \ 'Unite'    : 'unite#complete_source',
                \ 'VimShell' : 'vimshell#complete',
                \ 'VimFiler' : 'vimfiler#complete',
                \ }

    let g:neocomplcache#fallback_mappings = ["\<C-X>\<C-O>", "\<C-X>\<C-N>"]

    " <CR>: close popup
    inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return neocomplcache#close_popup() . "\<CR>"
    endfunction

    " CTRL-H, <BS>: close popup and delete backword char
    inoremap <expr> <C-H> neocomplcache#close_popup()."\<C-H>"
    inoremap <expr> <BS>  neocomplcache#close_popup()."\<C-H>"

    inoremap          <expr> <C-X><C-G> neocomplcache#undo_completion()
    inoremap          <expr> <C-X><C-@> neocomplcache#complete_common_string()
    inoremap <silent> <expr> <C-X><C-F> neocomplcache#start_manual_complete('file')

    " <Tab>: completion
    inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
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
                return neocomplcache#start_manual_complete()
            endif
        endif
    endfunction

    nnoremap <silent> <M-/> :NeoComplCacheToggle<CR>
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

    imap <silent> <expr> <C-L> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" :
                \ (pumvisible() ? "\<C-E>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <C-L> <Plug>(neosnippet_expand_or_jump)
    xmap <C-L> <Plug>(neosnippet_expand_target)

    imap <C-J> <Plug>(neosnippet_jump_or_expand)
    smap <C-J> <Plug>(neosnippet_jump_or_expand)
    xmap <C-J> <Plug>(neosnippet_expand_target)

    smap <Tab> <Plug>(neosnippet_jump)
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
    autocmd FileType gitcommit nmap <silent> <buffer> U :Git checkout -- <C-R><C-G><CR>
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

    nnoremap <silent> <Leader>mu :TxSendKey! 'q C-u'<CR>
    nnoremap <silent> <Leader>mm :TxSendKey! 'Enter'<CR>
    nnoremap <silent> <Leader>md :TxSendKey! 'C-d'<CR>

    augroup MyAutoCmd
        autocmd VimEnter * nnoremap <silent> <Leader>mi :TxSend!<CR>
        autocmd VimEnter * nmap     <silent> <Leader>ms mmvip<Leader>ms`m
        autocmd VimEnter * nmap     <silent> <Leader>mS mmggVG<Leader>ms`m
        autocmd VimEnter * xnoremap <silent> <Leader>ms "my:TxSend!(@m)<CR>
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

nmap <silent> <Leader>rt :TestFile<CR>
nmap <silent> <Leader>rf :TestNearest<CR>
nmap <silent> <Leader>rl :TestLast<CR>
nmap <silent> <Leader>ra :TestSuite<CR>
nmap <silent> <Leader>rg :TestVisit<CR>

" sheerun/vim-polyglot
let g:polyglot_disabled = ['go']

" tpope/vim-markdown
let g:markdown_fenced_languages = ['bash=sh', 'coffee', 'css', 'html', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'python', 'ruby', 'sass', 'sql', 'vim', 'xml']

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

autocmd MyAutoCmd FileType eruby,haml,slim,jade,html,xml,css,sass,scss,less,html.handlebars,mustache EmmetInstall

" fatih/vim-go, rhysd/vim-go-impl and garyburd/go-explorer
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
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
        nmap <LocalLeader>R <Plug>(go-run-split)
    else
        nnoremap <silent> <LocalLeader>R :GoRun!<CR>:redraw!<CR>
    endif
    nmap <LocalLeader>r <Plug>(go-run)
    nmap <LocalLeader>b <Plug>(go-build)
    nmap <LocalLeader>g <Plug>(go-generate)
    nmap <LocalLeader>i <Plug>(go-install)
    nmap <LocalLeader>I <Plug>(go-import)
    nmap <LocalLeader>t <Plug>(go-test)
    nmap <LocalLeader>F <Plug>(go-test-func)
    nmap <LocalLeader>T <Plug>(go-test-compile)
    nmap <LocalLeader>a <Plug>(go-alternate-edit)
    nmap <LocalLeader>A <Plug>(go-alternate-vertical)
    nmap <LocalLeader>c <Plug>(go-coverage)
    nmap <LocalLeader>v <Plug>(go-vet)

    nmap <LocalLeader>e <Plug>(go-rename)

    nmap <LocalLeader>n <Plug>(go-info)
    nmap <LocalLeader>s <Plug>(go-implements)

    nmap <LocalLeader>d <Plug>(go-doc-vertical)
    nmap <LocalLeader>f <Plug>(go-def-vertical)

    nmap     <LocalLeader>m <Plug>(go-metalinter)
    nnoremap <LocalLeader>M :GoMetaLinter<Space>
    nnoremap <LocalLeader>l :GoLint<Space>
    nnoremap <LocalLeader>E :GoErrCheck<Space>

    nnoremap <LocalLeader>G :GoGuruTags<Space>

    nnoremap <LocalLeader>] :GoImport<Space>
    nnoremap <LocalLeader>[ :GoDrop<Space>
endfunction

autocmd MyAutoCmd FileType go call s:VimGoSetup()

if has_key(g:plugs, 'vim-autoformat')
    " Chiel92/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    nnoremap <silent> <Leader>af :Autoformat<CR>:update<CR>
    nnoremap <Leader>aF :Autoformat<Space>
endif

" KabbAmine/zeavim.vim
let g:zv_disable_mapping = 1

if has('mac')
    let g:zv_docsets_dir = '~/Library/Application Support/Zeal/Zeal/docsets'
endif

nmap gz <Plug>ZVMotion
nmap <Leader>sd <Plug>Zeavim
vmap <Leader>sd <Plug>ZVVisSelection
nmap <Leader>sD <Plug>ZVKeyDocset
nnoremap <Leader>se :Docset<Space>

" chrisbra/unicode.vim
nmap <Leader>ud <Plug>(MakeDigraph)
vmap <Leader>ud <Plug>(MakeDigraph)

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

    " CSS / Less
    autocmd FileType css,less setlocal iskeyword+=-

    " JSON
    autocmd FileType json setlocal conceallevel=0

    " SQL
    autocmd FileType sql setlocal omnifunc= commentstring=--\ %s

    " XML
    if executable('xmllint')
        autocmd FileType xml nnoremap <silent> g=
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
augroup END

set background=dark
colorscheme gruvbox

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set secure

