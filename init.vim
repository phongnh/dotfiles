" Helpers
let s:python2 = has('python')
let s:python3 = has('python3')
let s:python  = s:python3 || s:python2
let s:vim8    = v:version >= 800

function! s:Source(vimrc) abort
    let vimrc = findfile(a:vimrc, ';')
    if strlen(vimrc)
        execute 'source ' . fnamemodify(vimrc, ':p')
    endif
endfunction

function! s:Use(group) abort
    return index(get(g:, 'zero_vim_groups', []), a:group) > - 1
endfunction

function! s:IsPlugged(plugin) abort
    return has_key(g:plugs, a:plugin)
endfunction

function! s:PlugDir(plugin) abort
    return g:plugs[a:plugin]['dir']
endfunction

if &shell =~# 'fish$'
    set shell=bash
endif

if executable('python3')
    let g:python3_host_prog = substitute(system('which python3'), '\n\+$', '', '')
endif

if executable('python2')
    let g:python_host_prog = substitute(system('which python2'), '\n\+$', '', '')
endif

" Disable system plugins
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_logiPat           = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:myscriptsfile            = 1
let g:loaded_less              = 1

" Disable highlighting matching parens in 'matchpairs' option like (), {}, and []
let g:loaded_matchparen = 1

" Disable Netrw plugin
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" Disable sql completion and mappings
let g:loaded_sql_completion    = 1
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key    = ''

" Disable syntax completion
let g:loaded_syntax_completion = 1

" Set augroup
augroup MyAutoCmd
    autocmd!

    " Share the histories
    autocmd CursorHold * rshada | wshada

    " " Start insert when entering in term buffer
    " autocmd BufWinEnter,WinEnter term://* startinsert
    " " Stop insert when leaving in term buffer
    " autocmd BufLeave term://* stopinsert
augroup END

" Default zero settings
let g:zero_vim_solarized         = !empty($SOLARIZED)
let g:zero_vim_autocomplete      = 1
let g:zero_vim_autolint          = 0
let g:zero_vim_git_gutter        = 1
let g:zero_vim_indent_char       = '┊'
let g:zero_vim_indent_first_char = '│'

" Find .init.vim.before from current folder up to root.
" If found, source it
call s:Source('.init.vim.before')

" Default nvim plugins
if !exists('g:zero_vim_groups')
    let g:zero_vim_groups = [
                \ 'grep',
                \ 'nerdtree',
                \ 'fzf',
                \ 'neosnippet',
                \ 'deoplete',
                \ 'airline',
                \ 'distraction-free',
                \ 'startify',
                \ 'lint',
                \ 'format',
                \ 'tagbar',
                \ 'undo',
                \ 'indent',
                \ 'ruby',
                \ 'web',
                \ 'go',
                \ 'git',
                \ 'gitgutter',
                \ 'diff-enhanced',
                \ 'writing',
                \ 'tasks',
                \ ]
endif

call plug#begin()

" Core {
    if exists("$TMUX")
        " Vim plugin for handling tmux panes.
        Plug 'jebaum/vim-tmuxify'
    endif

    " Asynchronous build and test dispatcher
    Plug 'tpope/vim-dispatch'

    " Interactive command execution
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    " EditorConfig plugin for Vim
    Plug 'editorconfig/editorconfig-vim'

    " rsi.vim: Readline style insertion
    Plug 'tpope/vim-rsi'

    " sleuth.vim: Heuristically set buffer options
    Plug 'tpope/vim-sleuth'

    " My vim functions for search and substitute
    Plug 'phongnh/vim-search-helpers'

    " Phong's vim command helpers
    Plug 'phongnh/vim-command-helpers'

    " Helpers for UNIX
    Plug 'tpope/vim-eunuch'

    " Delete unwanted whitespace at the end of lines
    Plug 'vim-scripts/DeleteTrailingWhitespace'

    " Enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'

    " Pairs of handy bracket mappings
    Plug 'tpope/vim-unimpaired'

    " Toggle useful settings
    Plug 'phongnh/vim-toggler'
    Plug 'phongnh/vim-toggle-quickfix'

    " Maximize current buffer
    Plug 'regedarek/ZoomWin'

    " Delete buffers and close files in Vim without closing your windows or messing up your layout
    Plug 'moll/vim-bbye'

    " A Narrow Region Plugin for vim (like Emacs Narrow Region)
    Plug 'chrisbra/NrrwRgn'
" }

" Search {
    if s:Use('grep')
        " Open a Quickfix item in a window you choose. (Vim plugin)
        Plug 'yssl/QFEnter'

        " Helps you win at grep.
        Plug 'mhinz/vim-grepper'

        " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
        Plug 'dyng/ctrlsf.vim'
    endif
" }

" Motion {
    " The missing motion for Vim
    Plug 'justinmk/vim-sneak'
" }

" Editing {
    " Vim plugin for intensely orgasmic commenting
    Plug 'scrooloose/nerdcommenter'

    " commentary.vim: comment stuff out
    Plug 'tpope/vim-commentary'

    " A Vim alignment plugin
    Plug 'junegunn/vim-easy-align'

    " Vim script for text filtering and alignment
    Plug 'godlygeek/tabular'

    " Plugin to move lines and selections up and down
    Plug 'matze/vim-move'

    " quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'

    " easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " Easy text exchange operator for Vim
    Plug 'tommcdo/vim-exchange'

    " use CTRL-A/CTRL-X to increment dates, times, and more
    Plug 'tpope/vim-speeddating'

    " insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'

    " True Sublime Text style multiple selections for Vim
    Plug 'terryma/vim-multiple-cursors'

    " emmet for vim: http://emmet.io
    Plug 'mattn/emmet-vim'

    " ragtag.vim: ghetto HTML/XML mappings
    Plug 'tpope/vim-ragtag'

    " A vim plugin that simplifies the transition between multiline and single-line code
    Plug 'AndrewRadev/splitjoin.vim'

    " A simple Vim plugin to switch segments of text with predefined replacements
    Plug 'AndrewRadev/switch.vim'
" }

" Text Objects {
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'                " e
    Plug 'kana/vim-textobj-line'                  " l
    Plug 'kana/vim-textobj-indent'                " i
    Plug 'glts/vim-textobj-comment'               " c
    Plug 'mattn/vim-textobj-url'                  " u
    Plug 'rhysd/vim-textobj-conflict'             " =
    Plug 'rhysd/vim-textobj-ruby'                 " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
    Plug 'whatyouhide/vim-textobj-erb'            " E, remapped to y (rub[y])
    Plug 'inside/vim-textobj-jsxattr'             " x
    Plug 'kana/vim-textobj-function'
    Plug 'thinca/vim-textobj-function-javascript' " f

    " A Vim plugin to move function arguments (and other delimited-by-something items) left and right.
    Plug 'AndrewRadev/sideways.vim'               " a

    " Vim plugin that provides additional text objects
    Plug 'wellle/targets.vim'

    " Smart selection of the closest text object
    Plug 'gcmt/wildfire.vim'
" }

" Appearance {
    if s:Use('airline')
        " My airline settings
        Plug 'phongnh/airline-settings.vim'
        " lean & mean status/tabline for vim that's light as air
        Plug 'vim-airline/vim-airline'
        " A collection of themes for vim-airline
        Plug 'vim-airline/vim-airline-themes'
    elseif s:Use('lightline')
        " My lightline settings
        Plug 'phongnh/lightline-settings.vim'
        " A light and configurable statusline/tabline plugin for Vim
        Plug 'itchyny/lightline.vim'
    else
        " Configure tabs within Terminal Vim
        Plug 'mkitt/tabline.vim'
        " My vim statusline
        Plug 'phongnh/vim-statusline'
    endif

    " Setup VIM's cursor and True Color for iTerm2
    Plug 'phongnh/vim-iterm-settings'

    " Show "Match 123 of 456 /search term/" in Vim searches
    Plug 'henrik/vim-indexed-search'

    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
    Plug 'luochen1990/rainbow'

    " Fancy fold texts
    Plug 'Konfekt/FoldText'
" }

" Explorer {
    " BufExplorer Plugin for Vim
    Plug 'jlanzarotta/bufexplorer'

    if s:Use('nerdtree')
        " A tree explorer plugin for vim
        Plug 'scrooloose/nerdtree'
    elseif s:Use('vaffle')
        " Lightweight file manager for Vim
        Plug 'cocopon/vaffle.vim'
    endif
" }

" Fuzzy finder {
    if s:Use('leaderf') && s:python
        " An asynchronous fuzzy finder which is used to quickly locate files, buffers, mrus, tags, etc. in large project.
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh'  }
    else
        if s:python
            Plug 'FelikZ/ctrlp-py-matcher'
        endif

        if s:python && executable('cmake')
            execute printf("Plug 'nixprime/cpsm', { 'do': 'env %s ./install.sh' }", s:python3 ? 'PY3=ON' : 'PY3=OFF')
        endif

        " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'DavidEGx/ctrlp-smarttabs'
        Plug 'tacahiroy/ctrlp-funky'
        Plug 'mattn/ctrlp-register'
        Plug 'LeafCage/yankround.vim'
    endif

    if s:Use('fzf')
        " A command-line fuzzy finder written in Go
        Plug 'junegunn/fzf', { 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'
        Plug 'phongnh/fzf-settings.vim'
    endif
" }

" Snippets and Autocomplete {
    if s:Use('ultisnips') && s:python
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
    elseif s:Use('neosnippet')
        Plug 'honza/vim-snippets'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'Shougo/neosnippet.vim'
    elseif s:Use('snipmate')
        Plug 'honza/vim-snippets'
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'
        Plug 'garbas/vim-snipmate'
    endif

    if s:Use('deoplete') && s:python3
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-go', { 'do': 'make' }
        Plug 'zchee/deoplete-clang'
        Plug 'wokalski/autocomplete-flow'
    elseif s:Use('YouCompleteMe') && s:python3 && executable('python3') && executable('cmake')
        Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --go-completer --js-completer' }
    elseif s:Use('asyncomplete') && s:vim8
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-buffer.vim'
        Plug 'yami-beta/asyncomplete-omni.vim'
        Plug 'prabirshrestha/asyncomplete-gocode.vim'
        Plug 'prabirshrestha/asyncomplete-flow.vim'

        if s:Use('ultisnips') && s:python
            Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
        elseif s:Use('neosnippet')
            Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
        endif
    elseif s:Use('supertab')
        Plug 'ervandew/supertab'
        Plug 'tpope/vim-endwise'
    endif
" }

" Startify {
    if s:Use('startify')
        " A fancy start screen
        Plug 'mhinz/vim-startify'
    endif
" }

" Distraction-free {
    if s:Use('distraction-free')
        " Distraction-free writing
        Plug 'junegunn/goyo.vim'

        " Hyperfocus-writing
        Plug 'junegunn/limelight.vim'
    endif
" }

" Project Configuration {
    if s:Use('projectionist')
        " projectionist.vim: project configuration
        Plug 'tpope/vim-projectionist'
    elseif s:Use('portkey')
        " Navigate files at the speed of Vim.
        Plug 'dsawardekar/portkey'
    endif
" }

" Syntax Checking/Linting {
    if s:Use('syntastic ')
        " Syntax checking hacks for vim
        Plug 'vim-syntastic/syntastic'
    elseif s:Use('lint')
        " Asynchronous Lint Engine
        Plug 'w0rp/ale'
    endif
" }

" Format {
    if s:Use('format')
        if s:python
            " Provide easy code formatting in Vim by integrating existing code formatters.
            Plug 'Chiel92/vim-autoformat'
        endif

        if executable('clang-format')
            " Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, TypeScript and ProtoBuf.
            Plug 'rhysd/vim-clang-format'
        endif

        " A Vim plugin for Prettier
        Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    endif
" }

" Ctags {
    if s:Use('ctags') && executable('ctags')
        " A Vim plugin that manages your tag files
        Plug 'ludovicchabant/vim-gutentags'
    endif
" }

" Tagbar {
    if s:Use('tagbar') && executable('ctags')
        " A class outline viewer for Vim
        Plug 'majutsushi/tagbar'
        Plug 'phongnh/vim-tagbar-settings'
    endif
" }

" Undo history {
    if s:Use('undo')
        if s:python
            " Visualize your Vim undo tree
            Plug 'sjl/gundo.vim'
        else
            " The ultimate undo history visualizer for VIM
            Plug 'mbbill/undotree'
        endif
    endif
" }

" Indent {
    if s:Use('indent')
        if has('conceal')
            " A vim plugin to display the indention levels with thin vertical lines
            Plug 'Yggdroot/indentLine'
        else
            " A Vim plugin for visually displaying indent levels in code
            Plug 'nathanaelkane/vim-indent-guides'
        endif
    endif
" }

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

if s:Use('syntax')
    " A solid language pack for Vim
    Plug 'sheerun/vim-polyglot'
endif

" Ruby {
    if s:Use('ruby')
        Plug 'keith/rspec.vim'
        Plug 'phongnh/vim-rubocop'
        Plug 'ecomba/vim-ruby-refactoring'
        Plug 'tpope/vim-bundler'
        Plug 'tpope/vim-rake'
        Plug 'tpope/vim-rails'
    endif
" }

" Web {
    if s:Use('web')
        Plug 'moll/vim-node'
        Plug 'pangloss/vim-javascript'
        Plug 'othree/es.next.syntax.vim'
        Plug 'othree/javascript-libraries-syntax.vim'
        Plug 'heavenshell/vim-jsdoc'
        Plug 'neoclide/vim-jsx-improve'
        Plug 'kchmck/vim-coffee-script'
        Plug 'elzr/vim-json'
        Plug 'tpope/vim-jdaddy'
        Plug 'hail2u/vim-css3-syntax'
        Plug 'phongnh/vim-coloresque'
        Plug 'othree/html5.vim'
        Plug 'joukevandermaas/vim-ember-hbs'
    endif
" }

" Go {
    if s:Use('go')
        Plug 'fatih/vim-go'
        Plug 'zchee/vim-go-stdlib'          " go standard library syntax highlighting
        Plug 'garyburd/go-explorer'         " go get github.com/garyburd/go-explorer/src/getool
        Plug 'tweekmonster/hl-goimport.vim' " Highlights imported packages in Go
    endif
" }

" Fish Shell {
    Plug 'dag/vim-fish'
" }

" Git {
    if s:Use('git')
        " An awesome Git wrapper so awesome
        Plug 'tpope/vim-fugitive'

        " Fugitive extension to manage and merge Git branches
        Plug 'idanarye/vim-merginal'

        " A git commit browser in Vim
        Plug 'junegunn/gv.vim'

        " A Vim plugin for more pleasant editing on commit messages
        Plug 'rhysd/committia.vim'
    endif

    if s:Use('gitgutter')
        " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
        Plug 'airblade/vim-gitgutter'
    elseif s:Use('signify')
        " Show a diff via Vim sign column
        Plug 'mhinz/vim-signify'
    endif

    if s:Use('diff-enhanced')
        " Better Diff options for Vim
        Plug 'chrisbra/vim-diff-enhanced'
    endif
" }

" Writing {
    if s:Use('writing')
        " A Vim plugin that provides a completion function for Unicode glyphs
        Plug 'chrisbra/unicode.vim'

        " Rethinking Vim as a tool for writing
        Plug 'reedes/vim-pencil'
        Plug 'reedes/vim-lexical'
        Plug 'reedes/vim-litecorrect'
        Plug 'reedes/vim-wordy'
        Plug 'reedes/vim-textobj-quote'
        Plug 'reedes/vim-textobj-sentence'
    endif
" }

" Tasks {
    if s:Use('tasks')
        " An implementation of Sublime's PlainTasks plugin for Vim
        Plug 'elentok/plaintasks.vim'

        " Text outlining and task management for Vim based on Emacs' Org-Mode
        Plug 'jceb/vim-orgmode'
    endif
" }

" Hard Time {
    if s:Use('hardtime')
        " Plugin to help you stop repeating the basic movement keys
        Plug 'takac/vim-hardtime'
    endif
" }

" Color schemes {
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'rakr/vim-one'
    Plug 'whatyouhide/vim-gotham'
    Plug 'yuttie/hydrangea-vim'

    " True Color schemes
    Plug 'lifepillar/vim-solarized8'
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'mhartington/oceanic-next'
    Plug 'arcticicestudio/nord-vim'
    Plug 'ayu-theme/ayu-vim'

    " Distraction-free color schemes
    Plug 'pbrisbin/vim-colors-off'
" }

" DevIcons {
    if s:Use('devicons')
        " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
        Plug 'ryanoasis/vim-devicons'
    endif
" }

" My default filetype settings
Plug 'phongnh/filetype-settings.vim'

call plug#end()

" Make ESC respond faster
set ttimeout
set ttimeoutlen=50

set visualbell               " Use visual bell instead of beeping
set t_vb=                    " Disable screen flash

set nomodeline               " Don't parse modelines because of vim modeline vulnerability

set lazyredraw               " Do not redraw while macro executing

set mouse=a                  " Enable mouse in every mode
set mousehide                " Hide mouse pointer while typing
set mousemodel=popup         " Right mouse button pops up a menu

set encoding=utf-8           " Default encoding for saving and reading file
set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac

" Don't try to highlight lines longer than 1000 characters
set synmaxcol=1000

" Enable virtualedit in visual block mode
set virtualedit=block

set hidden      " Allow buffer switching without saving

set showmatch       " Automatically highlight matching braces/brackets/etc
set cpoptions-=m    " Highlight when CursorMoved
set matchpairs+=<:> " Highlight <>
set matchtime=1

set infercase   " Ignore case on insert completion
set ignorecase  " Ignore case search for normal letters
set smartcase   " Do case-sensitive search if pattern contains upper case letters

" Default indent settings
set tabstop=4 shiftwidth=4

set smartindent
set shiftround  " Round indent by shiftwidth
set expandtab   " Expand tab to space

set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldmethod=indent     " Fold by indent
set foldlevel=1           " Starting fold at level 1
set foldlevelstart=20     " Open all folds by default"
set foldnestmax=20        " Deepest fold is 20 levels
set nofoldenable          " Disable fold by default

set fillchars=diff:⣿,vert:│

set grepformat=%f:%l:%c:%m,%f:%l:%m

" Turn off swapfile and backup
set noswapfile nobackup nowritebackup
set directory=~/.cache/swap
set backupdir=~/.cache/backup

if has('persistent_undo')
    set undofile
    set undodir=~/.cache/undo
endif

set updatetime=100              " 100ms

set scrolloff=0                 " Minimal number of screen lines to keep above and below the cursor
set scrolljump=5                " Lines to scroll when cursor leaves screen
set sidescroll=1                " The minimal number of columns to scroll horizontally
set sidescrolloff=20            " The minimal number of screen columns to keep to the left and to the right of the cursor

" Display tabs and trailing spaces
set listchars+=extends:>,precedes:<

if has('conceal')
    set listchars+=conceal:^
    set conceallevel=2 concealcursor=i
endif

set shortmess=aiToO                 " Print current file name, cursor position and file status (press C-g)

" Wrap conditions
set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

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

" set showcmd                     " Show (partial) command in the last line of the screen
set noshowcmd
set cmdheight=2                 " Height of command-line (easy-readable)

set undolevels=1000             " Maximum number of changes that can be undone

" Completion settings
set completeopt=menuone,noselect
set complete=.,w,b,u,t,k
set complete-=t
set pumheight=20                " Set popup menu max height

set wildmode=list:longest,full
" Ingore the following stuff when tab completing
set wildignore+=*/.built/*,*/node_modules/*,*/cache/*,*/.sass-cache/*
set wildignore+=*/vendor/gems/*,*/vendor/cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.o,*.obj,*.pyc,*.rbc,*.rbo,*.luac,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.pdf,*.class,*.gem
set wildignore+=*.zip,*.rar,*.7z,*.tar.gz,*.tar.bz2,*.tar.xz
set wildignore+=*.DS_Store,*.dmg,*.pkg,*dll,*.exe,*.lnk,*.ini,*.dat
set wildignore+=*.swp,*~,._*

" Adjust window size of preview and help
set previewheight=12
set helpheight=12

set nostartofline               " The cursor is kept in the same column (if possible)

set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new window right the current one

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Map leader
let g:mapleader      = ' '
let g:maplocalleader = '\'

" F1: Help
nnoremap <F1> :help<Space>
imap     <F1> <Esc><F1>

" F2: Paste Toggle
set pastetoggle=<F2>

" CTRL-Space: Show history
cnoremap <C-@> <C-f>

" CTRL-V: Paste from clipboard
cnoremap <C-v> <C-r>+

" Reset Esc
inoremap <Esc> <Esc>

" Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" CTRL-T: Insert tab
inoremap <silent> <C-t> <C-v><Tab>

" CTRL-L: Redraw
nnoremap <silent> <C-l> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>

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

" Copy / cut to clipboard
nmap cy "+y
nmap cd "+d

xmap gy "+y
xmap gd "+d

" Copy yanked text to clipboard
nnoremap <silent> cY :let [@+, @*] = [@", @"]<CR>

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

" Folding
nnoremap <silent> zr zr:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zm zm:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zR zR:<C-u>setlocal foldlevel?<CR>
nnoremap <silent> zM zM:<C-u>setlocal foldlevel?<CR>

nnoremap <silent> z] :let &foldcolumn = &foldcolumn + 1<CR>:<C-u>setlocal foldcolumn?<CR>
nnoremap <silent> z[ :let &foldcolumn = &foldcolumn - 1<CR>:<C-u>setlocal foldcolumn?<CR>

" Next/previous window
nnoremap <silent> ]w :wincmd w<CR>
nnoremap <silent> [w :wincmd W<CR>

" Search and Replace
nnoremap <Leader>R  :%s//gc<Left><Left><Left>
nnoremap <Leader>sr :%s/<C-r>=GetWordForSubstitute()<CR>/gc<Left><Left><Left>

xnoremap <Leader>R  :s/\%V/gc<Left><Left><Left>
xnoremap <Leader>sr <Esc>:%s/<C-r>=GetSelectedTextForSubstitute()<CR>//gc<Left><Left><Left>

" Buffer-related mappings
" gl: Go to Last buffer
nnoremap <silent> gl :buffer#<CR>

" Edit file from buffer folder
nnoremap <C-w><C-e> :edit <C-r>=fnameescape(expand('%:~:.:h')) . '/'<CR>

" Yank whole buffer (use previous gy mapping)
nmap <Leader>by ggVGgy``

" Reload buffer
nnoremap <silent> <Leader>be :confirm edit<CR>

" Save/Write buffer
nnoremap <silent> <Leader>w :update<CR>
vnoremap <silent> <Leader>w <Esc><Leader>wgv

nnoremap <silent> <Leader>bw :update<CR>
vmap              <Leader>bw <Esc><Leader>bwgv

nnoremap <silent> <C-s> :update<CR>
vmap              <C-s> <Esc><C-s>gv
imap              <C-s> <Esc><C-s>

" Save and Quit buffer
nnoremap <silent> <Leader>x :x<CR>
vmap              <Leader>x <Esc><Leader>x

nnoremap <silent> <Leader>bx :x<CR>
vmap              <Leader>bx <Esc><Leader>bx

" Unload buffer and delete it from the buffer list
nnoremap <silent> <Leader>bd :confirm bdelete<CR>
nnoremap <silent> <Leader>bq :confirm bdelete<CR>
" Like :bdelete, but really delete the buffer. Everything related to the buffer is lost
nnoremap <silent> <Leader>bk :confirm bwipeout<CR>
nnoremap <silent> <Leader>b- :confirm bwipeout<CR>

" Exit Vim. Bring up a prompt when some buffers have been changed
nnoremap <silent> ZE :confirm qall<CR>

" junegunn/vim-plug
nnoremap <silent> <Leader>vv :PlugUpdate<CR>

if s:IsPlugged('vim-tmuxify')
    " jebaum/vim-tmuxify
    let g:tmuxify_custom_command = 'tmux split-window -d -p 30'
    " Disable default mappings
    let g:tmuxify_map_prefix     = ''
    let g:tmuxify_global_maps    = 1

    " Update TxClear command
    command! -nargs=0 -bar -bang TxClear call tmuxify#pane_send_raw('C-u C-l C-u', <q-bang>)

    function! s:SetupTmuxifyMappings(prefix, suffix) abort
        execute 'nnoremap <silent> ' . a:prefix . 'b :TxSigInt'    . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'c :TxClear'     . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'n :TxCreate'    . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'p :TxSetPane'   . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'q :TxKill'      . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'r :TxRun'       . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 't :TxSetRunCmd' . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'i :TxSend'      . a:suffix . '<CR>'
        execute 'xnoremap <silent> ' . a:prefix . 's "my:TxSend'   . a:suffix . '(@m)<CR>'
        execute 'nmap     <silent> ' . a:prefix . 's mmvip'        . a:prefix . 's`m'
        execute 'nmap     <silent> ' . a:prefix . 'S mmggVG'       . a:prefix . 's`m'
        execute 'nnoremap <silent> ' . a:prefix . 'l :TxSend'      . a:suffix . '(@m)<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'k :TxSendKey'   . a:suffix . '<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'u :TxSendKey'   . a:suffix . " 'C-u q C-u'<CR>"
        execute 'nnoremap <silent> ' . a:prefix . 'm :TxSendKey'   . a:suffix . " 'Enter'<CR>"
        execute 'nnoremap <silent> ' . a:prefix . 'd :TxSendKey'   . a:suffix . " 'C-d'<CR>"
    endfunction

    " Global mappings
    call s:SetupTmuxifyMappings('<Leader>m', '!')
    " Local mappings
    call s:SetupTmuxifyMappings('<Leader>v', '')

    " Runner for janko-m/vim-test
    function! TmuxifyRunner(command) abort
        if empty(a:command)
            return
        endif
        TxSendKey! 'C-u q C-u'
        TxSendKey! 'C-u C-l C-u'
        execute 'TxRun! ' . shellescape(a:command)
    endfunction
endif

" tpope/vim-dispatch
let g:dispatch_quickfix_height = 10
let g:dispatch_tmux_height     = 1

" phongnh/vim-command-helpers
nnoremap          <Leader>S  :Grep<Space>
nnoremap <silent> <Leader>ss :GrepCword<CR>
xnoremap <silent> <Leader>ss <Esc>:Grep <C-r>=GetSelectedTextForAg()<CR><CR>

nnoremap          <Leader>L  :LGrep<Space>
nnoremap <silent> <Leader>sl :LGrepCword<CR>
xnoremap <silent> <Leader>sl <Esc>:LGrep <C-r>=GetSelectedTextForAg()<CR><CR>

nnoremap          <Leader>B  :BGrep<Space>
nnoremap <silent> <Leader>sb :BGrepCword<CR>
xnoremap <silent> <Leader>sb <Esc>:BGrep <C-r>=GetSelectedTextForAg()<CR><CR>
nmap              <Leader>bs <Leader>sb
xmap              <Leader>bs <Leader>sb

" vim-scripts/DeleteTrailingWhitespace
nnoremap <silent> <Leader>bw :update<CR>:DeleteTrailingWhitespace<CR>
vnoremap <silent> <Leader>bw :DeleteTrailingWhitespace<CR>

" tpope/vim-unimpaired
" Back-compatibility
nmap co =o

" regedarek/ZoomWin
let g:zoomwin_localoptlist = [
            \ 'ai', 'ar',
            \ 'bh', 'bin', 'bl', 'bomb', 'bt',
            \ 'cfu', 'ci', 'cin', 'cink', 'cino', 'cinw', 'cms', 'com', 'cpt',
            \ 'diff',
            \ 'efm', 'eol', 'ep', 'et',
            \ 'fenc', 'fex', 'ff', 'flp', 'fo', 'ft',
            \ 'gp',
            \ 'imi', 'ims', 'inde', 'inex', 'indk', 'inf', 'isk',
            \ 'kmp',
            \ 'lisp',
            \ 'mps', 'ml', 'ma', 'mod',
            \ 'nf',
            \ 'ofu',
            \ 'pi',
            \ 'qe',
            \ 'ro',
            \ 'sw', 'si', 'sts', 'spc', 'spf', 'spl', 'sua', 'swf', 'smc', 'syn',
            \ 'ts', 'tw',
            \ 'udf',
            \ 'wfh', 'wfw', 'wm',
            \ ]

nmap <silent> <Leader>bm <Plug>ZoomWin
vmap          <Leader>bm <Esc><Leader>bmgv

" moll/vim-bbye
nnoremap <silent> <Leader>bd :Bdelete<CR>
nnoremap <silent> <Leader>bk :Bwipeout<CR>

" chrisbra/NrrwRgn
let g:nrrw_topbot_leftright  = 'belowright'
let g:nrrw_rgn_nomap_nr      = 1
let g:nrrw_rgn_nomap_Nr      = 1
let g:nrrw_rgn_resize_window = 'relative'
let g:nrrw_rgn_rel_min       = 50
let g:nrrw_rgn_rel_max       = 50

nmap <unique> <Leader>bn <Plug>NrrwrgnDo
xmap <unique> <Leader>bn <Plug>NrrwrgnDo

nmap <Leader>n <Leader>bn
xmap <Leader>n <Leader>bn

augroup MyAutoCmd
    " TODO: Find a better way to setup NrrwRgn buffer mapping
    autocmd FileType * let b:nrrw_aucmd_create = 'nnoremap <buffer> <silent> <Leader>bn :WidenRegion!<CR>'
augroup END

if s:IsPlugged('QFEnter')
    " yssl/QFEnter
    let g:qfenter_enable_autoquickfix = 0

    let g:qfenter_keymap = {}
    let g:qfenter_keymap.vopen = ['<C-v>']
    let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
    let g:qfenter_keymap.topen = ['<C-t>']
endif

if s:IsPlugged('vim-grepper')
    " mhinz/vim-grepper
    let g:grepper = {
                \ 'open':      1,
                \ 'switch':    1,
                \ 'jump':      0,
                \ 'next_tool': '<C-\>',
                \ 'tools':     ['rg', 'ag', 'git', 'ack', 'grep', 'findstr'],
                \ }

    command! -nargs=* -complete=customlist,grepper#complete LGrepper Grepper -noquickfix <args>
    command! -nargs=* -complete=customlist,grepper#complete BGrepper LGrepper -buffer <args>

    nnoremap <silent> <Leader>S  :Grepper<CR>
    nnoremap <silent> <Leader>ss :Grepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>ss <Esc>:Grepper -query <C-r>=GetSelectedTextForGrepper()<CR><CR>

    nnoremap <silent> <Leader>L  :LGrepper<CR>
    nnoremap <silent> <Leader>sl :LGrepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>sl <Esc>:LGrepper -query <C-r>=GetSelectedTextForGrepper()<CR><CR>

    nnoremap          <Leader>B  :BGrepper<CR>
    nnoremap <silent> <Leader>sb :BGrepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>sb <Esc>:BGrepper -query <C-r>=GetSelectedTextForGrepper()<CR><CR>
    nmap              <Leader>bs <Leader>sb
    xmap              <Leader>bs <Leader>sb
endif

if s:IsPlugged('ctrlsf.vim')
    " dyng/ctrlsf.vim
    let g:ctrlsf_populate_qflist = 1

    nmap              <Leader>sp <Plug>CtrlSFPrompt
    nmap              <Leader>sf <Plug>CtrlSFCwordExec
    vmap              <Leader>sf <Plug>CtrlSFVwordExec
    nnoremap          <Leader>s/ :CtrlSF <C-r>=GetSearchTextForCtrlSF()<CR><CR>
    nnoremap <silent> <Leader>su :CtrlSFUpdate<CR>
    nnoremap <silent> <Leader>so :CtrlSFToggle<CR>
endif

" justinmk/vim-sneak
let g:sneak#streak = 1

" scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" godlygeek/tabular
" Overwrite ga behavior - call :ascii instead
nnoremap ga :Tabularize<Space>/
xnoremap ga :Tabularize<Space>/

" tpope/vim-surround
let g:surround_indent             = 1
let g:surround_no_insert_mappings = 1

nmap <Leader>sw ysiw
nmap <Leader>sW ysiW
nmap <Leader>s` ysiw`
nmap <Leader>s' ysiw'
nmap <Leader>s" ysiw"
nmap <Leader>s# ysiw#
nmap <Leader>s> ysiw>
nmap <Leader>s[ ysiw[
nmap <Leader>s] ysiw]
nmap <Leader>s( ysiw(
nmap <Leader>s) ysiw)
nmap <Leader>s{ ysiw{
nmap <Leader>s} ysiw}
nmap <Leader>c' cs"'
nmap <Leader>c" cs'"
nmap <Leader>c[ cs][
nmap <Leader>c] cs[]
nmap <Leader>c( cs)(
nmap <Leader>c) cs()
nmap <Leader>c{ cs}{
nmap <Leader>c} cs{}

" tpope/vim-abolish
nnoremap <Leader>ab :%Abolish<Space>
xnoremap <Leader>ab :Abolish<Space>
nnoremap <Leader>sv :%Subvert//gc<Left><Left><Left>
xnoremap <Leader>sv :Subvert//gc<Left><Left><Left>

" jiangmiao/auto-pairs
let g:AutoPairsFlyMode            = 0
let g:AutoPairsShortcutToggle     = '<M-p>'
let g:AutoPairsShortcutFastWrap   = ''
let g:AutoPairsShortcutJump       = '<M-n>'
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsMoveCharacter      = ''

" terryma/vim-multiple-cursors
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before() abort
    " let b:autopairs_enabled = 0

    let g:deoplete#disable_auto_complete = 1

    let b:cm_enabled = 0

    if exists(':MUcompleteAutoOff') == 2
        silent! MUcompleteAutoOff
    endif

    let b:SuperTabDisabled = 1
endfunction

" Called once only when the multiple selection is cancelled (default <Esc>)
function! Multiple_cursors_after() abort
    " let b:autopairs_enabled = 1

    let g:deoplete#disable_auto_complete = 0

    let b:cm_enabled = 1

    if exists(':MUcompleteAutoOn') == 2
        silent! MUcompleteAutoOn
    endif

    let b:SuperTabDisabled = 0
endfunction

" mattn/emmet-vim
let g:user_emmet_leader_key = '<C-\>'
let g:user_emmet_settings = {
            \ 'javascript.jsx': {
            \   'extends': 'jsx',
            \ },
            \ }

" rhysd/vim-textobj-ruby
let g:textobj_ruby_more_mappings = 0

" whatyouhide/vim-textobj-erb
let g:textobj_erb_no_default_key_mappings = 1

" Remap from 'E' to 'y'
omap ay <Plug>(textobj-erb-a)
xmap ay <Plug>(textobj-erb-a)
omap iy <Plug>(textobj-erb-i)
xmap iy <Plug>(textobj-erb-i)

" AndrewRadev/sideways.vim
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

nmap <, <Plug>SidewaysLeft
nmap >, <Plug>SidewaysRight

nnoremap <silent> [, :SidewaysJumpLeft<CR>
nnoremap <silent> ], :SidewaysJumpRight<CR>

" wellle/targets.vim
let g:targets_nl = 'nN'

" gcmt/wildfire.vim
let s:wildfire_objects = ['iw', 'iW', "i'", "a'", 'i"', 'a"', "i)", 'a)', "i]", "a]", "i}", "a}"]

let g:wildfire_objects = {
            \ '*':        extend(copy(s:wildfire_objects), ['il', 'ip']),
            \ 'html,xml': extend(copy(s:wildfire_objects), ['ix', 'it', 'at']),
            \ 'ruby':     extend(copy(s:wildfire_objects), ['ir', 'ar']),
            \ 'eruby':    extend(copy(s:wildfire_objects), ['iy', 'ay', 'ix', 'it', 'at']),
            \ 'go':       extend(copy(s:wildfire_objects), ['if', 'af']),
            \ }

map  + <Plug>(wildfire-fuel)
vmap _ <Plug>(wildfire-water)

map  <M-l> <Plug>(wildfire-fuel)
vmap <M-h> <Plug>(wildfire-water)

" luochen1990/rainbow
let g:rainbow_active = 0
nnoremap <silent> <Leader>bv :RainbowToggle<CR>

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1

nnoremap <silent> gb :ToggleBufExplorer<CR>

if s:IsPlugged('nerdtree')
    " scrooloose/nerdtree
    let g:NERDTreeWinSize             = 35
    let g:NERDTreeMouseMode           = 2
    let g:NERDTreeMapChangeRoot       = '.' " Map . for changing root in NERDTree
    let g:NERDTreeQuitOnOpen          = 0
    let g:NERDTreeChDirMode           = 0
    let g:NERDTreeShowBookmarks       = 1
    let g:NERDTreeDirArrowExpandable  = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    " let g:NERDTreeDirArrowExpandable  = '+'
    " let g:NERDTreeDirArrowCollapsible = '~'

    nnoremap <silent> <Leader>e  :NERDTreeToggle<CR>
    noremap  <silent> <Leader>E  :NERDTreeCWD<CR>
    nnoremap <silent> <Leader>bf :NERDTreeFind<CR>
endif

if s:IsPlugged('vaffle.vim')
    " cocopon/vaffle.vim
    nnoremap <silent> <Leader>e  :Vaffle<CR>
    nnoremap <silent> <Leader>bf :Vaffle <C-r>=expand("%:p:h")<CR><CR>
endif

if s:IsPlugged('LeaderF')
    " Yggdroot/LeaderF
    let g:Lf_WindowHeight  = 0.30
    let g:Lf_MruMaxFiles   = 200
    let g:Lf_CursorBlink   = 0
    " let g:Lf_PreviewCode   = 1 " Preview Tag
    let g:Lf_StlSeparator  = { 'left': '', 'right': '' }

    let g:Lf_UseCache      = 0 " rg/ag is enough fast, we don't need cache
    let g:Lf_NeedCacheTime = 5 " 5 seconds

    " These options are passed to external tools (rg, ag and pt, ...)
    let g:Lf_FollowLinks = 0
    let g:Lf_ShowHidden  = 0

    let g:Lf_WildIgnore = {
                \ 'dir': ['.svn','.git','.hg', '.node_modules', '.gems'],
                \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
                \ }

    let g:Lf_ShortcutF = '<Leader>f'
    let g:Lf_ShortcutB = '<Leader>bb'

    function! s:LeaderfRoot()
        let current = get(g:, 'Lf_WorkingDirectoryMode', 'c')
        try
            let g:Lf_WorkingDirectoryMode = 'Ac'
            call leaderf#File#startExpl(g:Lf_WindowPosition)
        finally
            let g:Lf_WorkingDirectoryMode = current
        endtry
    endfunction
    command! -bar -nargs=0 LeaderfRoot call <SID>LeaderfRoot()

    nmap <Leader><Leader> <Leader>f

    nnoremap          <Leader>F :LeaderfFile<Space>
    nnoremap <silent> <Leader>p :LeaderfRoot<CR>
    nmap              <C-p>     <Leader>p
    nnoremap <silent> <Leader>o :LeaderfMruCwd<CR>
    nnoremap <silent> <Leader>O :LeaderfMru<CR>
    nnoremap <silent> <Leader>d :LeaderfFile <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :LeaderfFile <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :LeaderfTag<CR>

    " Buffer-related mappings
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :LeaderfLine<CR>
    nnoremap <silent> <Leader>bt :LeaderfBufTag<CR>

    nnoremap <silent> <Leader><Tab> :LeaderfTabBufferAll<CR>

    nnoremap <silent> <Leader>bo :LeaderfFunction<CR>

    nnoremap <silent> <Leader>: :LeaderfHistoryCmd<CR>
    nnoremap <silent> <Leader>/ :LeaderfHistorySearch<CR>
endif

if s:IsPlugged('ctrlp.vim')
    " ctrlpvim/ctrlp.vim
    let g:ctrlp_match_window      = 'max:20'
    let g:ctrlp_working_path_mode = 'w'
    let g:ctrlp_reuse_window      = 'startify'
    let g:ctrlp_cmd               = 'CtrlPRoot'
    let g:ctrlp_prompt_mappings   = { 'MarkToOpen()': ['<C-z>', '<C-@>'], }

    let g:ctrlp_use_caching         = 0 " rg/ag is enough fast, we don't need cache
    let g:ctrlp_max_files           = 0
    let g:ctrlp_clear_cache_on_exit = 0

    if executable('rg')
        let g:ctrlp_user_command = 'rg %s --color=never --no-ignore-vcs --hidden --files'
    elseif executable('ag')
        let g:ctrlp_user_command = 'ag %s --nocolor --skip-vcs-ignores --hidden -l -g ""'
    elseif executable('fd')
        let g:ctrlp_user_command = 'fd --color=never --no-ignore-vcs --hidden --type file . %s'
    elseif has('win64') || has('win32')
        let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
    elseif executable('find')
        let ignores = '-path "*/.git/*" -o -path "*/.hg/*" -o -path "*/.svn/*"'
        let ignores .= ' -o -path "*/gems/*" -o -path "*/.gems/*"'
        let ignores .= ' -o -path "*/node_modules/*" -o -path "*/.built/*" -o -path "*.DS_Store"'
        let g:ctrlp_user_command = 'find %s ' . ignores . ' -prune -o -type f -print'
    endif

    if s:IsPlugged('cpsm') && filereadable(s:PlugDir('cpsm') . 'bin/cpsm_py.so')
        " nixprime/cpsm
        let g:cpsm_match_empty_query = 0
        let g:cpsm_highlight_mode    = 'basic'
        let g:ctrlp_match_func       = { 'match': 'cpsm#CtrlPMatch' }
    elseif s:IsPlugged('ctrlp-py-matcher')
        " FelikZ/ctrlp-py-matcher
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    endif

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f :CtrlP<CR>
    nnoremap          <Leader>F :CtrlP<Space>
    nnoremap <silent> <Leader>p :CtrlPRoot<CR>
    nnoremap <silent> <Leader>o :CtrlPCurWD<CR>
    nnoremap <silent> <Leader>O :CtrlPMRUFiles<CR>
    nnoremap <silent> <Leader>d :CtrlPCurFile<CR>
    nnoremap <silent> <Leader>D :CtrlP <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :CtrlPTag<CR>

    " Buffer-related mappings
    nnoremap <silent> <Leader>bb :CtrlPBuffer<CR>
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :CtrlPLine %<CR>
    nnoremap <silent> <Leader>bt :CtrlPBufTag<CR>

    " DavidEGx/ctrlp-smarttabs
    nnoremap <silent> <Leader><Tab> :CtrlPSmartTabs<CR>

    " tacahiroy/ctrlp-funky
    nnoremap <silent> <Leader>bo :CtrlPFunky<CR>

    " mattn/ctrlp-register
    nnoremap <silent> <Leader>Y :CtrlPRegister<CR>

    " LeafCage/yankround.vim
    let g:yankround_max_history = 100

    nnoremap <silent> <Leader>y :CtrlPYankRound<CR>
endif

if s:IsPlugged('fzf')
    " junegunn/fzf and junegunn/fzf.vim
    nnoremap          <Leader>G  :Ag!<Space>
    nnoremap <silent> <Leader>gg :Ag! <C-r><C-w><CR>
    xnoremap <silent> <Leader>gg <Esc>:FastAg! <C-r>=GetSelectedText()<CR><CR>

    nnoremap <silent> <Leader>f :FastFiles<CR>
    nnoremap          <Leader>F :Files<Space>
    nnoremap <silent> <Leader>o :Files .<CR>
    nnoremap <silent> <Leader>O :History<CR>
    nnoremap <silent> <Leader>d :Files <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :Files <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :Tags!<CR>

    nnoremap <silent> <Leader>bb :Buffers<CR>
    nnoremap <silent> <Leader>bl :BLines<CR>
    nnoremap <silent> <Leader>bt :BTags<CR>

    nnoremap <silent> <Leader>; :Commands<CR>
    nnoremap <silent> <Leader>: :History:<CR>
    nnoremap <silent> <Leader>/ :History/<CR>

    nnoremap <silent> <Leader>st :Tags! <C-r><C-w><CR>
    vnoremap <silent> <Leader>st <Esc>:Tags! <C-r>=GetSelectedText()<CR><CR>
endif

if s:IsPlugged('ultisnips')
    " SirVer/ultisnips
    let g:UltiSnipsExpandTrigger       = '<C-l>'
    let g:UltiSnipsJumpForwardTrigger  = '<C-g>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-z>'

    function! IsExpandableUltiSnips() abort
        return !empty(UltiSnips#SnippetsInCurrentScope())
    endfunction

    inoremap <silent> <expr> <Plug>(ultisnips_expand) UltiSnips#ExpandSnippet()
endif

if s:IsPlugged('neosnippet.vim')
    " Shougo/neosnippet.vim
    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#enable_complete_done          = 1
    let g:neosnippet#expand_word_boundary          = 1

    let g:neosnippet#scope_aliases = {
                \ 'ruby':   'ruby,rails',
                \ 'objc':   'objc,c',
                \ 'objcpp': 'objc,c',
                \ }

    let g:neosnippet#snippets_directory = expand('~/.vim/plugged/vim-snippets/snippets')

    function! s:NeoSnippetExpand() abort
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        endif

        if pumvisible()
            return "\<C-e>"
        endif

        return "\<C-l>"
    endfunction

    imap <silent> <expr> <C-l> <SID>NeoSnippetExpand()
    smap                 <C-l> <Plug>(neosnippet_expand_or_jump)
    xmap                 <C-l> <Plug>(neosnippet_expand_target)

    imap <C-g> <Plug>(neosnippet_jump)
    smap <C-g> <Plug>(neosnippet_jump)
    smap <Tab> <Plug>(neosnippet_jump)

    imap <silent> <expr> <C-\><C-e> <SID>NeoSnippetExpand()
    smap                 <C-\><C-e> <Plug>(neosnippet_expand_or_jump)
    xmap                 <C-\><C-e> <Plug>(neosnippet_expand_target)

    imap <C-\><C-f> <Plug>(neosnippet_jump)
    smap <C-\><C-f> <Plug>(neosnippet_jump)
    smap <Tab>      <Plug>(neosnippet_jump)
endif

if s:IsPlugged('vim-snipmate')
    " garbas/vim-snipmate
    let g:snipMate = get(g:, 'snipMate', {})
    let g:snips_no_mappings = 1
    let g:snipMate.scope_aliases = {}
    let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

    function! s:SnipMateExpand() abort
        if snipMate#CanBeTriggered()
            return "\<Plug>snipMateTrigger"
        endif

        if pumvisible()
            return "\<C-e>"
        endif

        return "\<C-l>"
    endfunction

    imap <silent> <expr> <C-l>      <SID>SnipMateExpand()
    xmap                 <C-l>      <Plug>snipMateVisual
    imap                 <C-g>      <Plug>snipMateNextOrTrigger
    smap                 <C-g>      <Plug>snipMateNextOrTrigger
    imap                 <C-z>      <Plug>snipMateBack
    smap                 <C-z>      <Plug>snipMateBack
    imap                 <C-r><Tab> <Plug>snipMateShow
endif

function! ExpandSnippet() abort
    if s:IsPlugged('ultisnips') && IsExpandableUltiSnips()
        return "\<Plug>(ultisnips_expand)"
    endif

    if s:IsPlugged('snipmate') && snipMate#CanBeTriggered()
        return "\<Plug>snipMateTrigger"
    endif

    if s:IsPlugged('neosnippet')
        if neosnippet#jumpable()
            return "\<Plug>(neosnippet_jump)"
        endif

        if neosnippet#expandable()
            return "\<Plug>(neosnippet_expand)"
        endif
    endif

    return ''
endfunction

if s:IsPlugged('deoplete.nvim')
    " Shougo/deoplete.nvim
    let g:deoplete#enable_at_startup = 1

    call deoplete#custom#option({
                \ 'auto_complete':  g:zero_vim_autocomplete,
                \ 'camel_case':     v:true,
                \ 'max_list':       100,
                \ 'refresh_always': v:true,
                \ })

    call deoplete#custom#option('keyword_patterns', { '_': '[a-zA-Z_]\k*\(?' })

    " Ignore sources
    let g:deoplete#ignore_sources = { '_': ['dictionary', 'tag', 'syntax'] }
    call deoplete#custom#option('ignore_sources', g:deoplete#ignore_sources)

    call deoplete#custom#source('_', 'converters', [
                \ 'converter_remove_paren',
                \ 'converter_remove_overlap',
                \ 'converter_truncate_abbr',
                \ 'converter_truncate_menu',
                \ 'converter_auto_delimiter',
                \ ])

    " CTRL-H, <BS>: close popup and delete backword char
    inoremap <expr> <C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS>  deoplete#smart_close_popup()."\<C-h>"

    " <Tab>: completion
    function! s:CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~ '\s'
    endfunction

    function! s:CleverTab() abort
        if pumvisible()
            return "\<C-n>"
        endif

        if s:CheckBackSpace()
            return "\<Tab>"
        endif

        let expand = ExpandSnippet()
        if strlen(expand)
            return expand
        endif

        return deoplete#manual_complete()
    endfunction

    imap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " <CR>: close popup and insert newline
    function! s:CleverCR() abort
        return deoplete#close_popup() . "\<CR>"
    endfunction

    inoremap <silent> <CR> <C-r>=<SID>CleverCR()<CR>

    inoremap          <expr> <C-x><C-g> deoplete#undo_completion()
    inoremap          <expr> <C-x><C-l> deoplete#complete_common_string()
    inoremap          <expr> <C-x><C-r> deoplete#refresh()
    inoremap <silent> <expr> <C-x><C-f> deoplete#manual_complete('file')
    inoremap <silent> <expr> <C-_>      deoplete#manual_complete()
endif

if s:IsPlugged('deoplete-clang')
    " zchee/deoplete-clang
    let g:deoplete#ignore_sources.c            = ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag', 'syntax']
    let g:deoplete#ignore_sources.cpp          = g:deoplete#ignore_sources.c
    let g:deoplete#ignore_sources.objc         = g:deoplete#ignore_sources.c
    let g:deoplete#ignore_sources.objcpp       = g:deoplete#ignore_sources.c
    " let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
    " let g:deoplete#sources#clang#clang_header  = '/usr/local/opt/llvm/include/clang'
endif

if s:IsPlugged('deoplete-go')
    " zchee/deoplete-go
    let g:deoplete#ignore_sources.go            = ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag', 'syntax']
    let g:deoplete#sources#go#sort_class        = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache         = 1
    " let g:deoplete#sources#go#gocode_binary     = $GOPATH . '/bin/gocode'
    " let g:deoplete#sources#go#cgo               = 1
    " let g:deoplete#sources#go#cgo#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
endif

if s:IsPlugged('YouCompleteMe')
    " Valloric/YouCompleteMe
    if s:python3 && executable('python3')
        let g:ycm_server_python_interprete = 'python3'
    endif
    let g:ycm_auto_trigger                        = g:zero_vim_autocomplete
    let g:ycm_confirm_extra_conf                  = 0
    let g:ycm_complete_in_comments_and_strings    = 1
    let g:ycm_always_populate_location_list       = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_use_ultisnips_completer             = 1
    let g:ycm_key_detailed_diagnostics            = ''
    let g:ycm_extra_conf_vim_data                 = ['&filetype']
    let g:ycm_global_ycm_extra_conf               = filereadable(expand('~/.ycm_extra_conf.py')) ? expand('~/.ycm_extra_conf') : ''
    let g:ycm_filetype_blacklist                  = { 'unite': 1, 'ctrlp': 1, 'tagbar' : 1, 'qf': 1, 'nerdtree': 1 }
endif

if s:IsPlugged('asyncomplete.vim')
    " prabirshrestha/asyncomplete.vim
    let g:asyncomplete_auto_popup = g:zero_vim_autocomplete

    " Show autocomplete popup manually
    imap <C-_> <Plug>(asyncomplete_force_refresh)

    " <CR>: close popup and insert newline
    inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

    " <Tab>: completion
    function! s:CheckBackSpace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~ '\s'
    endfunction

    function! s:CleverTab() abort
        if pumvisible()
            return "\<C-n>"
        endif

        if s:CheckBackSpace()
            return "\<Tab>"
        endif

        return asyncomplete#force_refresh()
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " prabirshrestha/asyncomplete-buffer.vim
    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                \ 'name':      'buffer',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['go'],
                \ 'completor': function('asyncomplete#sources#buffer#completor'),
                \ }))

    " yami-beta/asyncomplete-omni.vim
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                \ 'name':      'omni',
                \ 'whitelist': ['*'],
                \ 'completor': function('asyncomplete#sources#omni#completor')
                \ }))

    if s:IsPlugged('asyncomplete-neosnippet.vim')
        call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
                    \ 'name':      'neosnippet',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
                    \ }))
    endif

    if s:IsPlugged('asyncomplete-ultisnips.vim')
        call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                    \ 'name':      'ultisnips',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                    \ }))
    endif

    if s:IsPlugged('asyncomplete-gocode.vim')
        call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
                    \ 'name':      'gocode',
                    \ 'whitelist': ['go'],
                    \ 'completor': function('asyncomplete#sources#gocode#completor'),
                    \ 'config':    {
                    \   'gocode_path': 'gocode'
                    \ },
                    \ }))
    endif

    if s:IsPlugged('asyncomplete-flow.vim')
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
                    \ 'name':      'flow',
                    \ 'whitelist': ['javascript'],
                    \ 'completor': function('asyncomplete#sources#flow#completor'),
                    \ 'config':    {
                    \   'prefer_local': 1,
                    \   'flowbin_path': 'flow'
                    \ },
                    \ }))
    endif
endif

if s:IsPlugged('supertab')
    " ervandew/supertab
    let g:SuperTabDefaultCompletionType = 'context'
endif

if s:IsPlugged('vim-startify')
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

    nnoremap <silent> <Leader>H :Startify<CR>

    augroup MyAutoCmd
        autocmd User Startified setlocal buftype= nofoldenable foldcolumn=0
    augroup END
endif

if s:IsPlugged('goyo.vim')
    " junegunn/goyo.vim
    let g:goyo_width  = '80%'
    let g:goyo_height = '85%'
    let g:goyo_linenr = 0

    nnoremap <silent> <Leader><CR> :Goyo<CR>
    vmap              <Leader><CR> <Leader><CR>gv

    function! s:OnGoyoEnter() abort
        let s:goyo_settings = {
                    \ 'showmode':  &showmode,
                    \ 'linespace': &linespace,
                    \ 'scrolloff': &scrolloff,
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

    function! s:OnGoyoLeave() abort
        if has('fullscreen')
            set nofullscreen
        endif

        for [k, v] in items(s:goyo_settings)
            execute printf('let &%s = %s', k, string(v))
        endfor
    endfunction

    autocmd! User GoyoEnter nested call <SID>OnGoyoEnter()
    autocmd! User GoyoLeave nested call <SID>OnGoyoLeave()
endif

if s:IsPlugged('limelight.vim')
    " junegunn/limelight.vim
    let g:limelight_conceal_ctermfg     = 'gray'
    let g:limelight_conceal_ctermfg     = 240
    let g:limelight_conceal_guifg       = 'DarkGray'
    let g:limelight_conceal_guifg       = '#777777'
    let g:limelight_default_coefficient = 0.7
    let g:limelight_priority            = -1

    nnoremap <silent> <Leader>z :Limelight!!<CR>
    vmap              <Leader>z <Esc><Leader>zgv

    nmap gz <Plug>(Limelight)
    xmap gz <Plug>(Limelight)
endif

if s:IsPlugged('ale')
    " w0rp/ale
    let g:ale_lint_on_filetype_changed = g:zero_vim_autolint
    let g:ale_lint_on_text_changed     = 'never'
    let g:ale_lint_on_enter            = g:zero_vim_autolint
    let g:ale_lint_on_save             = g:zero_vim_autolint
    let g:ale_set_loclist              = 1
    let g:ale_set_quickfix             = 0
    let g:ale_list_window_size         = 5
    let g:ale_keep_list_window_open    = 0
    let g:ale_open_list                = 'on_save'
    let g:ale_fix_on_save              = 1

    let g:ale_sign_error   = '●' " •
    let g:ale_sign_warning = '.'

    let g:ale_linters = {}
    let g:ale_fixers  = {}

    function! s:ale_add_program(dict, filetype, program) abort
        if executable(a:program)
            let programs = get(a:dict, a:filetype, [])
            call add(programs, a:program)
            let a:dict[a:filetype] = programs
        endif
    endfunction

    call s:ale_add_program(g:ale_linters, 'javascript', 'eslint')
    call s:ale_add_program(g:ale_fixers, 'javascript', 'eslint')
    call s:ale_add_program(g:ale_linters, 'ruby', 'rubocop')

    let g:ale_linter_aliases = { 'javascript.jsx': 'javascript', 'jsx': 'javascript' }

    nnoremap <silent> <Leader>bc :ALELint<CR>
    nnoremap <silent> <Leader>bC :ALEFix<CR>
endif

if s:IsPlugged('syntastic')
    " vim-syntastic/syntastic
    let g:syntastic_mode_map                 = { 'mode': 'passive', }
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list            = 1
    let g:syntastic_auto_jump                = 1
    let g:syntastic_loc_list_height          = 5
    let g:syntastic_check_on_open            = 0
    let g:syntastic_check_on_wq              = 0
    let g:syntastic_aggregate_errors         = 1
    let g:syntastic_echo_current_error       = 1
    let g:syntastic_error_symbol             = '●' " •
    let g:syntastic_style_error_symbol       = '.'
    let g:syntastic_warning_symbol           = '!'
    let g:syntastic_style_warning_symbol     = '*'

    function! s:syntastic_add_checker(filetype, program, ...) abort
        if executable(a:program)
            let programs = get(g:, printf('syntastic_%s_checkers', a:program), [])
            call add(programs, a:program)
            let g:syntastic_{a:filetype}_checkers = programs

            let path = get(a:, 1, '')
            if strlen(path)
                let g:syntastic_{a:filetype}_{a:program}_exec = path
            endif
        endif
    endfunction

    call s:syntastic_add_checker('javascript', 'eslint', 'npm run eslint --')
    call s:syntastic_add_checker('jsx', 'eslint', 'npm run eslint --')
    call s:syntastic_add_checker('ruby', 'rubocop')

    nnoremap <silent> <Leader>bc :SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>
endif

if s:IsPlugged('vim-autoformat')
    " Chiel92/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    nnoremap <silent> <Leader>af :Autoformat<CR>:update<CR>
    vnoremap <silent> <Leader>af :Autoformat<CR>:update<CR>
endif

if s:IsPlugged('vim-clang-format')
    " rhysd/vim-clang-format
    " Disable ClangFormat command and settings from justmao945/vim-clang
    let g:clang_enable_format_command = 0
    let g:clang_format_auto           = 0

    nnoremap <silent> <Leader>cf :ClangFormat<CR>:update<CR>
    vnoremap <silent> <Leader>cf :ClangFormat<CR>:update<CR>
endif

if s:IsPlugged('vim-prettier')
    " prettier/vim-prettier
    let g:prettier#autoformat = 0

    nmap <Leader>ap <Plug>(PrettierAsync)
endif

if s:IsPlugged('tagbar')
    " majutsushi/tagbar
    let g:tagbar_sort      = 0
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 0
    let g:tagbar_iconchars = ['▸', '▾']

    nnoremap <silent> <Leader>T :TagbarToggle<CR>
endif

if s:IsPlugged('gundo.vim')
    " sjl/gundo.vim
    let g:gundo_prefer_python3 = s:python3
    let g:gundo_right          = 1
    let g:gundo_width          = 30
    let g:gundo_preview_bottom = 1
    let g:gundo_preview_height = 18
    let g:gundo_auto_preview   = 1

    nnoremap <silent> <Leader>U :GundoToggle<CR>
endif

if s:IsPlugged('undotree')
    " mbbill/undotree
    let g:undotree_WindowLayout       = 'botright'
    let g:undotree_SetFocusWhenToggle = 1

    nnoremap <silent> <Leader>U :UndotreeToggle<CR>
endif

if s:IsPlugged('indentLine')
    " Yggdroot/indentLine
    let g:indentLine_enabled              = 0
    let g:indentLine_char                 = g:zero_vim_indent_char
    let g:indentLine_first_char           = g:zero_vim_indent_first_char
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_noConcealCursor      = 1
    let g:indentLine_color_term           = 239
    " let g:indentLine_color_gui            = '#A4E57E'

    nnoremap <silent> <Leader>bi :IndentLinesToggle<CR>
    vmap              <Leader>bi <Esc><Leader>bigv
endif

if s:IsPlugged('vim-indent-guides')
    " nathanaelkane/vim-indent-guides
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_start_level           = 1
    let g:indent_guides_guide_size            = 1
    let g:indent_guides_color_change_percent  = 3

    nnoremap <silent> <Leader>bi :IndentGuidesToggle<CR>
    vmap              <Leader>bi <Esc><Leader>bigv
endif

" janko-m/vim-test
function! Neovim2Strategy(cmd) abort
    if g:test#neovim_mode ==? 's'
        let win = 'botright new'
    elseif g:test#neovim_mode ==? 'v'
        let win = 'vertical new'
    elseif g:test#neovim_mode ==? 't'
        let win = 'tabnew'
    else
        let win = 'botright 15new'
    endif
    execute win | call termopen(a:cmd) | startinsert
endfunction

let g:test#custom_strategies = { 'neovim2': function('Neovim2Strategy') }
let g:test#strategy          = 'neovim2'
let g:test#neovim_mode       = 'd'

if s:IsPlugged('vim-tmuxify')
    let g:test#custom_strategies['tmuxify'] = function('TmuxifyRunner')
    let g:test#strategy = 'tmuxify'
endif

nnoremap <silent> <Leader>tt :TestFile<CR>
nnoremap <silent> <Leader>tf :TestNearest<CR>
nmap              <Leader>tn <Leader>tf
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

if s:IsPlugged('vim-polyglot')
    " sheerun/vim-polyglot
    let g:polyglot_disabled = ['fish', 'coffee-script', 'go']

    let g:vim_markdown_no_default_key_mappings = 1
    let g:vim_markdown_fenced_languages        = ["c++=cpp", 'bash=sh', 'erb=eruby', 'js=javascript', 'json=javascript', 'viml=vim']
endif

" Ruby speedup
let g:rubycomplete_buffer_loading    = 0
let g:rubycomplete_classes_in_global = 0
let g:rubycomplete_rails             = 0

" Disable custom rails syntax highlighting
" let g:rails_syntax = 0

" Opererator syntax highlighting
" let g:ruby_operators = 1

if s:IsPlugged('vim-ruby-refactoring')
    " ecomba/vim-ruby-refactoring
    let g:ruby_refactoring_map_keys = 0
endif

if s:IsPlugged('vim-rails')
    " tpope/vim-rails
    function! s:SetupRailsMappings() abort
        nnoremap <buffer> <silent> <Leader>ba :AE<CR>
        nnoremap <buffer> <silent> <Leader>br :RE<CR>
        xnoremap <buffer>          <Leader>x  :Extract<Space>
    endfunction

    augroup MyAutoCmd
        autocmd BufEnter * if exists('b:rails_root') | call <SID>SetupRailsMappings() | endif
    augroup END
endif

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow  = 1

" mxw/vim-jsx
let g:jsx_ext_required        = 0

" tpope/vim-markdown
let g:markdown_fenced_languages = [
            \ 'bash=sh', 'coffee', 'sass', 'scss', 'css', 'html', 'xml', 'erb=eruby', 'ruby',
            \ 'javascript', 'js=javascript', 'json=javascript', 'python', 'sql', 'vim'
            \ ]

if s:IsPlugged('vim-go')
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

    if s:IsPlugged('neosnippet.vim')
        let g:go_snippet_engine = 'neosnippet'
    endif

    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:ale_linters = get(g:, 'ale_linters', {})
    let g:ale_linters.go = g:syntastic_go_checkers

    function! s:SetupVimGo() abort
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

        nmap     <buffer> g> <Plug>(go-import)
        nmap     <buffer> g< <Plug>(go-drop)
        nnoremap <buffer> g} :GoImport<Space>
        nnoremap <buffer> g{ :GoDrop<Space>

        if s:IsPlugged('ctrlp.vim')
            nnoremap <buffer> <silent> <LocalLeader>o :GoDecls<CR>
            nnoremap <buffer> <silent> <LocalLeader>O :GoDeclsDir<CR>
            nnoremap <buffer>          <LocalLeader>p :GoDeclsDir<Space>
            nnoremap <buffer>          <LocalLeader>P :GoDecls<Space>
        endif

        " go install
        nnoremap <buffer> <silent> <LocalLeader>u :update<CR>:execute "silent! !go install"<CR>:redraw!<CR>:echo '!go install'<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType go call s:SetupVimGo()
    augroup END
endif

if s:IsPlugged('vim-fugitive')
    " tpope/vim-fugitive
    nnoremap          <Leader>gi :Git add -p %<CR><CR>
    nnoremap          <Leader>ga :Git add -p<CR><CR>
    nnoremap <silent> <Leader>gs :Gstatus<CR>
    nnoremap <silent> <Leader>gd :Gdiff<CR>
    nnoremap <silent> <Leader>gc :Gcommit<CR>
    nnoremap <silent> <Leader>gb :Gblame<CR>
    nnoremap          <Leader>ge :Gedit<Space>
    nnoremap <silent> <Leader>gr :Gread<CR>
    nnoremap <silent> <Leader>gw :Gwrite<CR>
    nnoremap <silent> <Leader>gf :Gfetch<CR>
    nnoremap <silent> <Leader>gp :Gpush<CR>
    nnoremap <silent> <Leader>gu :Gpull --rebase<CR>

    augroup MyAutoCmd
        autocmd FileType gitcommit nmap <buffer> <silent> U :Git checkout -- <C-r><C-g><CR>
        autocmd BufReadPost fugitive://* set bufhidden=delete
    augroup END
endif

if s:IsPlugged('gv.vim')
    " junegunn/gv.vim
    nnoremap <silent> <Leader>gk :GV<CR>
    nnoremap <silent> <Leader>gK :GV!<CR>
    nnoremap <silent> <Leader>gv :GV?<CR>
endif

if s:IsPlugged('vim-gitgutter')
    " airblade/vim-gitgutter
    let g:gitgutter_enabled  = g:zero_vim_git_gutter
    let g:gitgutter_map_keys = 0

    if executable('rg')
        let g:gitgutter_grep = 'rg --color=never'
        let $GREP_OPTIONS    = ''
    elseif executable('ag')
        let g:gitgutter_grep = 'ag --nocolor'
        let $GREP_OPTIONS    = ''
    endif

    nmap [c <Plug>GitGutterPrevHunk
    nmap ]c <Plug>GitGutterNextHunk

    nnoremap <silent> yog :GitGutterToggle<CR>:echo (g:gitgutter_enabled ? 'Enabled' : 'Disabled') . ' GitGutter!'<CR>
endif

if s:IsPlugged('vim-signify')
    " mhinz/vim-signify
    let g:signify_disable_by_default    = !g:zero_vim_git_gutter
    let g:signify_vcs_list              = ['git', 'hg']
    let g:signify_cursorhold_insert     = 0
    let g:signify_cursorhold_normal     = 0
    let g:signify_update_on_bufenter    = 0
    let g:signify_update_on_focusgained = 0

    nnoremap <silent> yog :SignifyToggle<CR>:echo (get(b:, 'sy', { 'active': 0 }).active ? 'Enabled' : 'Disabled') . ' Signify on buffer!'<CR>
endif

if s:IsPlugged('unicode.vim')
    " chrisbra/unicode.vim
    nmap <F3> <Plug>(UnicodeSwapCompleteName)
    nmap <F4> <Plug>(MakeDigraph)
    vmap <F4> <Plug>(MakeDigraph)
endif

if s:IsPlugged('vim-pencil')
    " reedes/vim-pencil
    let g:pencil#wrapModeDefault = 'soft' " default is 'hard'
    let g:pencil#autoformat      = 1      " 0=manual, 1=auto (def)
    let g:pencil#textwidth       = 74
    let g:pencil#joinspaces      = 0      " 0=one_space (def), 1=two_spaces
    let g:pencil#cursorwrap      = 1      " 0=disable, 1=enable (def)
    let g:pencil#conceallevel    = 3      " 0=disable, 1=onechar, 2=hidechar, 3=hideall (def)
    let g:pencil#concealcursor   = 'c'    " n=normal, v=visual, i=insert, c=command (def)
    " let g:pencil#mode_indicators = {'hard': 'H', 'auto': 'A', 'soft': 'S', 'off': '',}

    " reedes/vim-lexical
    let g:lexical#spelllang      = ['en_us',]
    let g:lexical#spell_key      = '<LocalLeader>ws'
    let g:lexical#thesaurus_key  = '<LocalLeader>wt'
    let g:lexical#dictionary_key = '<LocalLeader>wd'

    function! s:SetupPencil() abort
        call pencil#init()
        call lexical#init({ 'spell': 0, })
        call litecorrect#init()
        call textobj#sentence#init()
        call textobj#quote#init()

        nnoremap <buffer> <silent> <LocalLeader>wf :PFormatToggle<CR>

        map <buffer> <silent> <LocalLeader>wc <Plug>ReplaceWithCurly
        map <buffer> <silent> <LocalLeader>wl <Plug>ReplaceWithStraight
        map <buffer> <silent> <Localleader>w' <Plug>SurroundWithSingle
        map <buffer> <silent> <Localleader>w" <Plug>SurroundWithDouble

        nnoremap <buffer> <silent> <LocalLeader>wn :NextWordy<CR>
        nnoremap <buffer> <silent> <LocalLeader>wp :NextWordy<CR>
    endfunction

    augroup VimPencil
        autocmd!
        autocmd FileType markdown,mkd,text,mail call s:SetupPencil()
    augroup END
endif

if s:IsPlugged('vim-hardtime')
    " takac/vim-hardtime
    let g:hardtime_default_on = 1
    let g:hardtime_showmsg    = 1
    let g:list_of_visual_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
    let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
endif

" altercation/vim-colors-solarized
let g:loaded_togglebg = 1
let g:solarized_menu  = 0

if !has('gui_running')
    let g:solarized_termcolors = g:zero_vim_solarized ? 16 : 256
endif

" morhetz/gruvbox
let g:gruvbox_contrast_dark  = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_italic         = 1

" lifepillar/vim-solarized8
let g:solarized_use16        = 1
let g:solarized_term_italics = 1

" ajmwagar/vim-deus
let g:deus_contrast_dark  = 'medium'
let g:deus_contrast_light = 'medium'
let g:deus_italic         = 1

" drewtempelmeyer/palenight.vim
let g:palenight_terminal_italics = 1

" mhartington/oceanic-next
let g:oceanic_next_terminal_bold   = 1
let g:oceanic_next_terminal_italic = 1

" arcticicestudio/nord-vim
let g:nord_italic          = 1
let g:nord_italic_comments = 1

" ayu-theme/ayu-vim
let g:ayucolor = 'light'  " for light version of theme
let g:ayucolor = 'dark'   " for dark version of theme
let g:ayucolor = 'mirage' " for mirage version of theme

call s:Source('.init.vim.local')

if exists('g:zero_vim_colorscheme')
    if exists('g:zero_vim_background')
        execute 'set background=' . g:zero_vim_background
    endif
    execute 'colorscheme ' . g:zero_vim_colorscheme
else
    set background=dark
    colorscheme gruvbox
endif

set secure

