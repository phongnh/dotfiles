" Helpers
let s:python2 = has('python')
let s:python3 = has('python3')
let s:python  = s:python3 || s:python2
let s:vim8    = v:version >= 800

function! s:Source(vimrc) abort
    let vimrcs = findfile(a:vimrc, ';', -1)
    for vimrc in reverse(vimrcs)
        execute 'source ' . fnamemodify(vimrc, ':p')
    endfor
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

if &shell =~# 'fish$' " && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/usr/bin/env\ bash
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

" Ruby speedup
let g:rubycomplete_buffer_loading    = 0
let g:rubycomplete_classes_in_global = 0
let g:rubycomplete_rails             = 0

" Disable custom rails syntax highlighting
" let g:rails_syntax = 0

" Opererator syntax highlighting
" let g:ruby_operators = 1

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
let g:zero_vim_true_color        = 0
let g:zero_vim_solarized         = 0
let g:zero_vim_autocomplete      = 1
let g:zero_vim_autolint          = 0
let g:zero_vim_autofix           = 0
let g:zero_vim_git_gutter        = 1
let g:zero_vim_grep_ignore_vcs   = 0
let g:zero_vim_find_tool         = 'rg'
let g:zero_vim_indent_char       = '┊'
let g:zero_vim_indent_first_char = '│'

" Find .init.vim.before from current folder up to root.
" If found, source it
call s:Source('.init.vim.before')

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

    " rsi.vim: Readline style insertion
    Plug 'tpope/vim-rsi'

    " sleuth.vim: Heuristically set buffer options
    Plug 'tpope/vim-sleuth'

    " My vim helpers
    Plug 'phongnh/vim-helpers'

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

    " Maximize current buffer
    Plug 'phongnh/ZoomWin'

    " Delete buffers and close files in Vim without closing your windows or messing up your layout
    Plug 'moll/vim-bbye'

    " A Narrow Region Plugin for vim (like Emacs Narrow Region)
    Plug 'chrisbra/NrrwRgn'

    " Open a Quickfix item in a window you choose. (Vim plugin)
    Plug 'yssl/QFEnter'
" }

" Search {
    if s:Use('grep')
        " Helps you win at grep.
        Plug 'mhinz/vim-grepper'

        " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
        Plug 'dyng/ctrlsf.vim'
    endif
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

    " A Vim plugin to move function arguments (and other delimited-by-something items) left and right.
    Plug 'AndrewRadev/sideways.vim'               " a
" }

" Text Objects {
    Plug 'kana/vim-textobj-user'

    if s:Use('text-objects')
        Plug 'kana/vim-textobj-entire'                " e
        Plug 'kana/vim-textobj-line'                  " l
        Plug 'kana/vim-textobj-indent'                " i
        Plug 'glts/vim-textobj-comment'               " c
        Plug 'mattn/vim-textobj-url'                  " u
        Plug 'rhysd/vim-textobj-conflict'             " =
        Plug 'rhysd/vim-textobj-ruby'                 " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
        Plug 'whatyouhide/vim-textobj-erb'            " E, remapped to y (rub[y])
        Plug 'inside/vim-textobj-jsxattr'             " x
        Plug 'rhysd/vim-textobj-word-column'          " v
        Plug 'kana/vim-textobj-function'
        Plug 'thinca/vim-textobj-function-javascript' " f
        Plug 'haya14busa/vim-textobj-function-syntax'

        " Vim plugin that provides additional text objects
        Plug 'wellle/targets.vim'

        " Smart selection of the closest text object
        Plug 'gcmt/wildfire.vim'
    endif
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
    elseif s:Use('crystalline')
        " My crystalline settings
        Plug 'phongnh/crystalline-settings.vim'
        " Functions for taking the monotony out of building your own fancy statusline in Vim
        Plug 'rbong/vim-crystalline'
    else
        " Configure tabs within Terminal Vim
        Plug 'mkitt/tabline.vim'
        " My vim statusline
        Plug 'phongnh/vim-statusline'
    endif

    " Show "Match 123 of 456 /search term/" in Vim searches
    Plug 'henrik/vim-indexed-search'

    " Rainbow Parentheses Improved, shorter code, no level limit, smooth and fast, powerful configuration.
    Plug 'luochen1990/rainbow'

    " Vim Fold Text
    Plug 'phongnh/vim-fold-text'
" }

" Explorer {
    " BufExplorer Plugin for Vim
    Plug 'jlanzarotta/bufexplorer'

    " A tree explorer plugin for vim
    Plug 'scrooloose/nerdtree'
" }

" Fuzzy finder {
    if s:Use('fzf')
        " A command-line fuzzy finder written in Go
        Plug 'junegunn/fzf', { 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'
        Plug 'phongnh/fzf-settings.vim'
    elseif s:Use('leaderf') && s:python
        " An asynchronous fuzzy finder which is used to quickly locate files, buffers, mrus, tags, etc. in large project.
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
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
        Plug 'fisadev/vim-ctrlp-cmdpalette'
        Plug 'ompugao/ctrlp-history'
        Plug 'https://bitbucket.org/slimane/ctrlp-locationlist'
        Plug 'phongnh/ctrlp-settings.vim'
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
    endif

    if s:Use('deoplete') && s:python3
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        if s:Use('lsp')
            Plug 'prabirshrestha/async.vim'
            Plug 'prabirshrestha/vim-lsp'
            Plug 'lighttiger2505/deoplete-vim-lsp'
        else
            Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
            Plug 'deoplete-plugins/deoplete-clang'
            Plug 'deoplete-plugins/deoplete-jedi'
            Plug 'wokalski/autocomplete-flow'
        endif
    elseif s:Use('YouCompleteMe') && s:python3 && executable('python3') && executable('cmake')
        Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --go-completer --js-completer' }
    elseif s:Use('coc') && executable('yarn')
        Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    elseif s:Use('asyncomplete') && s:vim8
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-buffer.vim'
        Plug 'yami-beta/asyncomplete-omni.vim'
        if s:IsPlugged('ultisnips')
            Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
        elseif s:IsPlugged('neosnippet.vim')
            Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
        endif
        if s:Use('lsp')
            Plug 'prabirshrestha/vim-lsp'
            Plug 'prabirshrestha/asyncomplete-lsp.vim'
        else
            Plug 'prabirshrestha/asyncomplete-gocode.vim'
            Plug 'prabirshrestha/asyncomplete-flow.vim'
        endif
    elseif s:python
        Plug 'maralla/completor.vim'

        if s:Use('neosnippet')
            Plug 'maralla/completor-neosnippet'
        endif
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
    " Find out which project a file belongs to, easy to use in scripts/mappings
    Plug 'dbakker/vim-projectroot'

    if s:Use('projectionist')
        " projectionist.vim: project configuration
        Plug 'tpope/vim-projectionist'
    elseif s:Use('portkey')
        " Navigate files at the speed of Vim.
        Plug 'dsawardekar/portkey'
    endif
" }

" Syntax Checking/Linting {
    if s:Use('lint')
        " Asynchronous Lint Engine
        Plug 'dense-analysis/ale'
    elseif s:Use('syntastic')
        " Syntax checking hacks for vim
        Plug 'vim-syntastic/syntastic'
    endif
" }

" Format {
    if s:Use('format')
        if s:python
            " Provide easy code formatting in Vim by integrating existing code formatters.
            Plug 'Chiel92/vim-autoformat'
        endif

        if executable('yarn')
            " A Vim plugin for Prettier
            Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
        endif
    endif
" }

" Ctags {
    if s:Use('ctags') && executable('ctags')
        " A Vim plugin that manages your tag files
        Plug 'ludovicchabant/vim-gutentags'

        if s:Use('ctags-cscope') && executable('gtags-cscope')
            " The right way to use gtags with gutentags
            Plug 'skywind3000/gutentags_plus'
        endif
    endif
" }

" Gtags {
    if s:Use('gtags') && executable('gtags')
        " Async plugin for vim and neovim to ease the use of ctags/gtags
        Plug 'jsfaint/gen_tags.vim'
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

" Web {
    if s:Use('web')
        Plug 'pangloss/vim-javascript'
        Plug 'othree/es.next.syntax.vim'
        Plug 'othree/javascript-libraries-syntax.vim'
        Plug 'heavenshell/vim-jsdoc'
        Plug 'neoclide/vim-jsx-improve'
        Plug 'elzr/vim-json'
        Plug 'tpope/vim-jdaddy'
        Plug 'hail2u/vim-css3-syntax'
        Plug 'phongnh/vim-coloresque'
        Plug 'othree/html5.vim'
    endif
" }

" CoffeeScript {
    if s:Use('coffee-script')
        Plug 'kchmck/vim-coffee-script'
        Plug 'joukevandermaas/vim-ember-hbs'
    endif
" }

" Ruby {
    if s:Use('ruby')
        Plug 'keith/rspec.vim'
        Plug 'phongnh/vim-rubocop'
        Plug 'tpope/vim-rake'
        Plug 'tpope/vim-rails'
    endif
" }

" Python {
    if s:Use('python')
        Plug 'nvie/vim-flake8'
        Plug 'fisadev/vim-isort'
        Plug 'google/yapf', { 'rtp': 'plugins/vim' }
    endif
" }

" Go {
    if s:Use('go')
        Plug 'fatih/vim-go'
        Plug 'zchee/vim-go-stdlib'          " go standard library syntax highlighting
        Plug 'phongnh/go-explorer'          " go get github.com/phongnh/go-explorer/src/getool
        Plug 'tweekmonster/hl-goimport.vim' " Highlights imported packages in Go
    endif
" }

" Fish Shell {
    Plug 'dag/vim-fish'
" }

if s:Use('syntax')
    " A solid language pack for Vim
    Plug 'sheerun/vim-polyglot'
endif

" Git {
    if s:Use('git')
        " An awesome Git wrapper so awesome
        Plug 'tpope/vim-fugitive'

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

    if s:Use('diff-enhanced') && &diff
        " Better Diff options for Vim
        Plug 'chrisbra/vim-diff-enhanced'
    endif
" }

" A Vim plugin that provides a completion function for Unicode glyphs
Plug 'chrisbra/unicode.vim'

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

    " True Color schemes
    Plug 'lifepillar/vim-solarized8'

    " Distraction-free color schemes
    Plug 'pbrisbin/vim-colors-off'

    " Extra colorschemes
    if s:Use('extra-colorschemes')
        Plug 'rakr/vim-one'
        Plug 'whatyouhide/vim-gotham'
        Plug 'yuttie/hydrangea-vim'

        " True Color schemes
        Plug 'tyrannicaltoucan/vim-deep-space'
        Plug 'drewtempelmeyer/palenight.vim'
        Plug 'mhartington/oceanic-next'
        Plug 'arcticicestudio/nord-vim'
        Plug 'ayu-theme/ayu-vim'
    endif
" }

" DevIcons {
    if s:Use('devicons')
        " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
        Plug 'ryanoasis/vim-devicons'
    endif
" }

if s:Use('which-key')
    " Vim plugin that shows keybindings in popup
    Plug 'liuchengxu/vim-which-key'
endif

" My default filetype settings
Plug 'phongnh/filetype-settings.vim'

call plug#end()

" Make ESC respond faster
set ttimeout
set ttimeoutlen=50
set timeoutlen=500           " Mapping delay

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

" Don't try to highlight lines longer than 500 characters
set synmaxcol=500

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
set foldlevelstart=10     " Open all folds by default
set foldnestmax=10        " Deepest fold is 10 levels
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

" True Color settings
if g:zero_vim_true_color && has('termguicolors')
    set termguicolors
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
if has('diff') && &diff
    nnoremap <silent> <C-l> :nohlsearch <Bar> diffupdate<CR><C-l>
else
    nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
endif

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

" Yank whole buffer to clipboard
nnoremap <silent> <Leader>by :%y+<CR>

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
        execute 'nmap     <silent> ' . a:prefix . 'l mmV'          . a:prefix . 's`m'
        execute 'nmap     <silent> ' . a:prefix . 'w mmviw'        . a:prefix . 's`m'
        execute 'nnoremap <silent> ' . a:prefix . 'a :TxSend'      . a:suffix . '(@m)<CR>'
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

" phongnh/vim-helpers
let g:grep_ignore_vcs = g:zero_vim_grep_ignore_vcs

nnoremap          <Leader>S  :Grep<Space>
nnoremap <silent> <Leader>ss :GrepCCword<CR>
xnoremap <silent> <Leader>ss <Esc>:Grep <C-r>=GetSelectedTextForShell()<CR><CR>
nnoremap          <Leader>si :GrepCCword<Space>
xnoremap          <Leader>si <Esc>:Grep <C-r>=GetSelectedTextForShell()<CR><Space>
nnoremap <silent> <Leader>s/ <Esc>:Grep <C-r>=GetSearchTextForShell()<CR><CR>
nnoremap          <Leader>s? <Esc>:Grep <C-r>=GetSearchTextForShell()<CR><Space>

nnoremap          <Leader>L  :LGrep<Space>
nnoremap <silent> <Leader>sl :LGrepCCword<CR>
xnoremap <silent> <Leader>sl <Esc>:LGrep <C-r>=GetSelectedTextForShell()<CR><CR>

nnoremap          <Leader>B  :BGrep<Space>
nnoremap <silent> <Leader>sb :BGrepCCword<CR>
xnoremap <silent> <Leader>sb <Esc>:BGrep <C-r>=GetSelectedTextForShell()<CR><CR>
nmap              <Leader>bs <Leader>sb
xmap              <Leader>bs <Leader>sb

" vim-scripts/DeleteTrailingWhitespace
nnoremap <silent> <Leader>bu :DeleteTrailingWhitespace <Bar> update<CR>
vnoremap <silent> <Leader>bu :DeleteTrailingWhitespace <Bar> update<CR>

" phongnh/ZoomWin
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

nmap <Leader>bn <Plug>NrrwrgnDo
xmap <Leader>bn <Plug>NrrwrgnDo

nmap <Leader>n <Leader>bn
xmap <Leader>n <Leader>bn

augroup MyAutoCmd
    " TODO: Find a better way to setup NrrwRgn buffer mapping
    autocmd FileType * let b:nrrw_aucmd_create = 'nnoremap <buffer> <silent> <Leader>bn :WidenRegion!<CR>'
augroup END

" yssl/QFEnter
let g:qfenter_enable_autoquickfix = 0

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']


if s:IsPlugged('vim-grepper')
    " mhinz/vim-grepper
    let g:grepper = {
                \ 'open':                1,
                \ 'switch':              1,
                \ 'jump':                0,
                \ 'prompt_mapping_tool': '<C-\>',
                \ 'tools':               ['rg', 'ag', 'git', 'grep', 'findstr'],
                \ 'stop':                2000,
                \ }

    if g:zero_vim_grep_ignore_vcs
        runtime plugin/grepper.vim

        let g:grepper.rg.grepprg .= ' --no-ignore-vcs'
        let g:grepper.ag.grepprg .= ' --skip-vcs-ignores'
    endif

    command! -nargs=* -complete=customlist,grepper#complete LGrepper Grepper -noquickfix <args>
    command! -nargs=* -complete=customlist,grepper#complete BGrepper LGrepper -buffer <args>

    nmap gs <plug>(GrepperOperator)
    xmap gs <plug>(GrepperOperator)

    nnoremap <silent> <Leader>S  :Grepper<CR>
    nnoremap <silent> <Leader>ss :Grepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>ss <Esc>:Grepper -noprompt -query <C-r>=GetSelectedTextForShell()<CR><CR>
    nnoremap <silent> <Leader>si :Grepper -prompt -cword<CR>
    xnoremap <silent> <Leader>si <Esc>:Grepper -prompt -query <C-r>=GetSelectedTextForShell()<CR><CR>
    nnoremap <silent> <Leader>s/ :Grepper -noprompt -query <C-r>=GetSearchTextForShell()<CR><CR>
    nnoremap <silent> <Leader>s? :Grepper -prompt -query <C-r>=GetSearchTextForShell()<CR><CR>

    nnoremap <silent> <Leader>L  :LGrepper<CR>
    nnoremap <silent> <Leader>sl :LGrepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>sl <Esc>:LGrepper -noprompt -query <C-r>=GetSelectedTextForShell()<CR><CR>

    nnoremap          <Leader>B  :BGrepper<CR>
    nnoremap <silent> <Leader>sb :BGrepper -noprompt -cword<CR>
    xnoremap <silent> <Leader>sb <Esc>:BGrepper -noprompt -query <C-r>=GetSelectedTextForShell()<CR><CR>
    nmap              <Leader>bs <Leader>sb
    xmap              <Leader>bs <Leader>sb
endif

if s:IsPlugged('ctrlsf.vim')
    " dyng/ctrlsf.vim
    let g:ctrlsf_populate_qflist = 1
    let g:ctrlsf_auto_focus = {
                \ 'at': 'start'
                \ }

    if g:zero_vim_grep_ignore_vcs
        let g:ctrlsf_extra_backend_args = {
                    \ 'rg': '--no-ignore-vcs',
                    \ 'ag': '--skip-vcs-ignores',
                    \ }
    endif

    nmap              <Leader>sp <Plug>CtrlSFPrompt
    nmap              <Leader>sf <Plug>CtrlSFCCwordExec
    vmap              <Leader>sf <Plug>CtrlSFVwordExec
    nmap              <Leader>sc <Plug>CtrlSFCCwordPath
    vmap              <Leader>sc <Plug>CtrlSFVwordPath
    nnoremap <silent> <Leader>so :CtrlSFToggle<CR>
    nnoremap <silent> <Leader>su :CtrlSFUpdate<CR>
endif

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

" tpope/vim-abolish
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
if s:IsPlugged('deoplete')
    " Called once right before you start selecting multiple cursors
    function! Multiple_cursors_before() abort
        if deoplete#is_enabled()
            call deoplete#disable()
        endif
    endfunction

    function! Multiple_cursors_after() abort
        if g:zero_vim_autocomplete
            call deoplete#enable()
        endif
    endfunction
elseif s:IsPlugged('asyncomplete.vim')
    function! Multiple_cursors_before() abort
        let g:asyncomplete_auto_popup = 0
    endfunction

    function! Multiple_cursors_after() abort
        let g:asyncomplete_auto_popup = g:zero_vim_autocomplete
    endfunction
elseif s:IsPlugged('completor')
    function! Multiple_cursors_before() abort
        silent! CompletorDisable
    endfunction

    function! Multiple_cursors_after() abort
        if g:zero_vim_autocomplete
            silent! CompletorEnable
        endif
    endfunction
endif

" mattn/emmet-vim
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_settings = {
            \ 'javascript.jsx': {
            \   'extends': 'jsx',
            \ },
            \ }

" AndrewRadev/sideways.vim
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

nmap <, <Plug>SidewaysLeft
nmap >, <Plug>SidewaysRight

nnoremap <silent> [, :SidewaysJumpLeft<CR>
nnoremap <silent> ], :SidewaysJumpRight<CR>

if s:IsPlugged('rhysd/vim-textobj-ruby')
    " rhysd/vim-textobj-ruby
    let g:textobj_ruby_more_mappings = 0
endif

if s:IsPlugged('vim-textobj-erb')
    " whatyouhide/vim-textobj-erb
    let g:textobj_erb_no_default_key_mappings = 1

    " Remap from 'E' to 'y'
    omap ay <Plug>(textobj-erb-a)
    xmap ay <Plug>(textobj-erb-a)
    omap iy <Plug>(textobj-erb-i)
    xmap iy <Plug>(textobj-erb-i)
endif

if s:IsPlugged('targets.vim')
    " wellle/targets.vim
    let g:targets_nl = 'nN'
endif

if s:IsPlugged('wildfire.vim')
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
endif

" luochen1990/rainbow
let g:rainbow_active = 0
nnoremap <silent> <Leader>bv :RainbowToggle<CR>

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1

nnoremap <silent> gb :ToggleBufExplorer<CR>

" scrooloose/nerdtree
let g:NERDTreeWinSize             = 35
let g:NERDTreeMouseMode           = 2
let g:NERDTreeMapChangeRoot       = '.' " Map . for changing root in NERDTree
let g:NERDTreeQuitOnOpen          = 0
let g:NERDTreeChDirMode           = 0
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeDirArrowExpandable  = '▸' " +
let g:NERDTreeDirArrowCollapsible = '▾' " ~

nnoremap <silent> <Leader>e  :NERDTreeToggle<CR>
noremap  <silent> <Leader>E  :NERDTreeCWD<CR>
nnoremap <silent> <Leader>bf :NERDTreeFind<CR>
nnoremap <silent> <Leader>bg :NERDTreeVCS<CR>

if s:IsPlugged('fzf')
    " junegunn/fzf and junegunn/fzf.vim
    let g:fzf_find_tool = g:zero_vim_find_tool

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f :Files<CR>
    nnoremap <silent> <C-p>     :PFiles<CR>
    nnoremap <silent> <Leader>p :PFiles<CR>
    nnoremap <silent> <Leader>o :Buffers<CR>
    nnoremap <silent> <Leader>O :History<CR>
    nnoremap <silent> <Leader>d :Files <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :Files <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :Tags!<CR>

    nnoremap <silent> <Leader>bb :Buffers<CR>
    nnoremap <silent> <Leader>bl :BLines<CR>
    nnoremap <silent> <Leader>bt :BTags<CR>
    nnoremap <silent> <Leader>bo :BOutline<CR>

    nnoremap <silent> <Leader>; :Commands<CR>
    nnoremap <silent> <Leader>: :History:<CR>
    nnoremap <silent> <Leader>/ :History/<CR>

    nnoremap <silent> <Leader>q :cclose<CR>:Quickfix<CR>
    nnoremap <silent> <Leader>l :lclose<CR>:LocationList<CR>

    nnoremap <silent> <Leader>st :Tags! <C-r><C-w><CR>
    vnoremap <silent> <Leader>st <Esc>:Tags! <C-r>=GetSelectedText()<CR><CR>

    nnoremap <silent> <Leader>sg :Ag! <C-r><C-w><CR>
    xnoremap <silent> <Leader>sg <Esc>:Ag! -F <C-r>=GetSelectedText()<CR><CR>
endif

if s:IsPlugged('LeaderF')
    " Yggdroot/LeaderF
    let g:Lf_WindowHeight  = 0.30
    let g:Lf_MruMaxFiles   = 200
    " let g:Lf_CursorBlink   = 0 " When set this setting to 0, C-J & C-K do not work, temporarily disable it
    let g:Lf_PreviewResult = { 'BufTag': 0, 'Function': 0 }
    let g:Lf_StlSeparator  = { 'left': '', 'right': '' }

    let g:Lf_StlColorscheme = 'gruvbox_material'

    let g:Lf_UseCache       = 0  " rg/ag is enough fast, we don't need cache
    let g:Lf_NeedCacheTime  = 10 " 10 seconds
    let g:Lf_UseMemoryCache = 1

    " let g:Lf_NoChdir              = 1
    let g:Lf_WorkingDirectoryMode = 'c'

    let s:Lf_FindTools = {
            \ 'rg': 'rg %s --color=never --no-ignore-vcs --hidden --files',
            \ 'ag': 'ag %s --nocolor --skip-vcs-ignores --hidden -l -g ""',
            \ 'fd': 'fd --color=never --no-ignore-vcs --ignore-file ~/.ignore --hidden --type file . %s',
            \ }

    if g:zero_vim_find_tool == 'fd' && executable('fd')
        let g:Lf_ExternalCommand = s:Lf_FindTools['fd']
    elseif g:zero_vim_find_tool == 'ag' && executable('ag')
        let g:Lf_ExternalCommand = s:Lf_FindTools['ag']
    elseif executable('rg')
        let g:Lf_ExternalCommand = s:Lf_FindTools['rg']
    elseif executable('ag')
        let g:Lf_ExternalCommand = s:Lf_FindTools['ag']
    elseif executable('fd')
        let g:Lf_ExternalCommand = s:Lf_FindTools['fd']
    endif

    let g:Lf_RgConfig = [
                \ '-H',
                \ '--no-heading',
                \ '--hidden',
                \ '--vimgrep',
                \ '--smart-case'
                \ ]
    if g:zero_vim_grep_ignore_vcs
        call add(g:Lf_RgConfig, '--no-ignore-vcs')
    endif

    " These options are passed to external tools (rg, ag and pt, ...)
    let g:Lf_FollowLinks = 0
    let g:Lf_ShowHidden  = 0

    let g:Lf_WildIgnore = {
                \ 'dir': ['.svn', '.git', '.hg', '.node_modules', '.gems'],
                \ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]']
                \ }

    let g:Lf_ShortcutF = '<Leader>f'
    let g:Lf_ShortcutB = '<Leader>bb'

    let g:Lf_CtagsFuncOpts = {
                \ 'ruby': '--ruby-kinds=fFS',
                \ }

    function! s:LeaderfRoot() abort
        let current = get(g:, 'Lf_WorkingDirectoryMode', 'c')
        try
            let g:Lf_WorkingDirectoryMode = 'Ac'
            :LeaderfFile
        finally
            let g:Lf_WorkingDirectoryMode = current
        endtry
    endfunction
    command! -bar -nargs=0 LeaderfRoot call <SID>LeaderfRoot()

    function! s:LeaderfFileInDir(dir) abort
        let current = get(g:, 'Lf_WorkingDirectory', '')
        try
            let g:Lf_WorkingDirectory = a:dir
            :LeaderfFile
        finally
            let g:Lf_WorkingDirectory = current
        endtry
    endfunction
    command! -bar -nargs=1 -complete=dir LeaderfFileInDir call <SID>LeaderfFileInDir(<q-args>)

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <C-p>     :LeaderfRoot<CR>
    nnoremap <silent> <Leader>p :LeaderfRoot<CR>
    nnoremap <silent> <Leader>o :LeaderfBuffer<CR>
    nnoremap <silent> <Leader>O :LeaderfMru<CR>
    nnoremap <silent> <Leader>d :LeaderfFileInDir <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :LeaderfFileInDir <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :LeaderfTag<CR>

    " Buffer-related mappings
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :LeaderfLine<CR>
    nnoremap <silent> <Leader>bt :LeaderfBufTag<CR>
    nnoremap <silent> <Leader>b] :LeaderfBufTagAll<CR>
    nnoremap <silent> <Leader>]  :LeaderfBufTagAll<CR>

    nnoremap <silent> <Leader>bj :LeaderfTabBufferAll<CR>

    nnoremap <silent> <Leader>bo :LeaderfFunction<CR>
    nnoremap <silent> <Leader>b[ :LeaderfFunctionAll<CR>
    nnoremap <silent> <Leader>[  :LeaderfFunctionAll<CR>

    nnoremap <silent> <Leader>: :LeaderfHistoryCmd<CR>
    nnoremap <silent> <Leader>/ :LeaderfHistorySearch<CR>

    nnoremap <silent> <Leader>st :LeaderfTagCword<CR>

    nmap              <Leader>sg <Plug>LeaderfRgCwordLiteralBoundary<CR>
    vmap              <Leader>sg <Plug>LeaderfRgVisualLiteralNoBoundary<CR>
    nnoremap <silent> <Leader>sa :Leaderf rg --recall<CR>
endif

if s:IsPlugged('ctrlp.vim')
    " ctrlpvim/ctrlp.vim
    let g:ctrlp_find_tool = g:zero_vim_find_tool
    let g:ctrlp_command   = 'CtrlPRoot'

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
    nnoremap <silent> <Leader>p :CtrlPRoot<CR>
    nnoremap <silent> <Leader>o :CtrlPBuffer<CR>
    nnoremap <silent> <Leader>O :CtrlPMRUFiles<CR>
    nnoremap <silent> <Leader>d :CtrlPCurFile<CR>
    nnoremap <silent> <Leader>D :CtrlP <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :CtrlPTag<CR>

    nnoremap <silent> <Leader>q :CtrlPQuickfix<CR>

    " Buffer-related mappings
    nnoremap <silent> <Leader>bb :CtrlPBuffer<CR>
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :CtrlPLine %<CR>
    nnoremap <silent> <Leader>bt :CtrlPBufTag<CR>
    nnoremap <silent> <Leader>b] :CtrlPBufTagAll<CR>
    nnoremap <silent> <Leader>]  :CtrlPBufTagAll<CR>

    " DavidEGx/ctrlp-smarttabs
    nnoremap <silent> <Leader>bj :CtrlPSmartTabs<CR>

    " tacahiroy/ctrlp-funky
    nnoremap <silent> <Leader>bo :CtrlPFunky<CR>
    nnoremap <silent> <Leader>b[ :CtrlPFunkyMulti<CR>
    nnoremap <silent> <Leader>[  :CtrlPFunkyMulti<CR>

    " mattn/ctrlp-register
    nnoremap <silent> <Leader>Y :CtrlPRegister<CR>

    " LeafCage/yankround.vim
    let g:yankround_max_history = 100

    nnoremap <silent> <Leader>y :CtrlPYankRound<CR>

    " fisadev/vim-ctrlp-cmdpalette
    nnoremap <silent> <Leader>; :CtrlPCmdPalette<CR>

    " ompugao/ctrlp-history
    nnoremap <silent> <Leader>: :CtrlPCmdHistory<CR>
    nnoremap <silent> <Leader>/ :CtrlPSearchHistory<CR>

    " slimane/ctrlp-locationlist
    nnoremap <silent> <Leader>l :CtrlPLocationlist<CR>
endif

function! ExpandSnippet() abort
    return ''
endfunction

if s:IsPlugged('ultisnips')
    " SirVer/ultisnips
    let g:UltiSnipsExpandTrigger       = '<C-k>'
    let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-z>'

    function! IsExpandableUltiSnips() abort
        return !empty(UltiSnips#SnippetsInCurrentScope())
    endfunction

    function! ExpandSnippet() abort
        if IsExpandableUltiSnips()
            return "\<Plug>(ultisnips_expand)"
        endif

        return ''
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

        return "\<C-j>"
    endfunction

    imap <silent> <expr> <C-k> <SID>NeoSnippetExpand()
    smap                 <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap                 <C-k> <Plug>(neosnippet_expand_target)

    imap <C-j> <Plug>(neosnippet_jump)
    smap <C-j> <Plug>(neosnippet_jump)
    smap <Tab> <Plug>(neosnippet_jump)

    function! ExpandSnippet() abort
        if neosnippet#jumpable()
            return "\<Plug>(neosnippet_jump)"
        endif

        if neosnippet#expandable()
            return "\<Plug>(neosnippet_expand)"
        endif

        return ''
    endfunction
endif

if s:IsPlugged('deoplete.nvim')
    " Shougo/deoplete.nvim
    let g:deoplete#enable_at_startup = 1

    call deoplete#custom#option({
                \ 'auto_complete':       g:zero_vim_autocomplete,
                \ 'auto_complete_delay': 200,
                \ 'camel_case':          v:true,
                \ 'max_list':            200,
                \ 'refresh_always':      v:true,
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
    " deoplete-plugins/deoplete-clang
    let g:deoplete#ignore_sources.c            = ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag', 'syntax']
    let g:deoplete#ignore_sources.cpp          = g:deoplete#ignore_sources.c
    let g:deoplete#ignore_sources.objc         = g:deoplete#ignore_sources.c
    let g:deoplete#ignore_sources.objcpp       = g:deoplete#ignore_sources.c
    " let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
    " let g:deoplete#sources#clang#clang_header  = '/usr/local/opt/llvm/include/clang'
endif

if s:IsPlugged('deoplete-go')
    " deoplete-plugins/deoplete-go
    let g:deoplete#ignore_sources.go            = ['buffer', 'dictionary', 'file', 'member', 'omni', 'tag', 'syntax']
    let g:deoplete#sources#go#sort_class        = ['package', 'func', 'type', 'var', 'const']
    let g:deoplete#sources#go#use_cache         = 1
    " let g:deoplete#sources#go#gocode_binary     = $GOPATH . '/bin/gocode'
    " let g:deoplete#sources#go#cgo               = 1
    " let g:deoplete#sources#go#cgo#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
endif

if s:IsPlugged('YouCompleteMe')
    " ycm-core/YouCompleteMe
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

if s:IsPlugged('coc.nvim')
    " neoclide/coc.nvim
    " Install Extensions
    " :CocInstall coc-json coc-tsserver coc-html coc-xml coc-css coc-tailwindcss coc-yaml 
    " :CocInstall coc-markdownlint
    " :CocInstall coc-highlight coc-emmet coc-snippets coc-lists coc-git coc-yank
    " :CocInstall coc-python coc-pyright coc-solargraph coc-flow

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    if executable('/usr/local/bin/node')
        let g:coc_node_path = '/usr/local/bin/node'
    endif

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

        return coc#refresh()
    endfunction

    inoremap <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " To make <CR> select the first completion item and confirm the completion when no item has been selected
    " inoremap <silent> <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

    " To make coc.nvim format your code on <CR>
    " inoremap <silent> <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use <C-_> to trigger completion.
    inoremap <silent> <expr> <C-_>      coc#refresh()
    inoremap <silent> <expr> <C-x><C-r> coc#refresh()

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
endif

if s:IsPlugged('asyncomplete.vim')
    " prabirshrestha/asyncomplete.vim
    let g:asyncomplete_auto_popup  = g:zero_vim_autocomplete
    let g:asyncomplete_popup_delay = 50

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

    function! s:SetupAsyncomplete() abort
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

        if s:IsPlugged('ultisnips')
            " prabirshrestha/asyncomplete-ultisnips.vim
            call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                        \ 'name':      'ultisnips',
                        \ 'whitelist': ['*'],
                        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                        \ }))
        endif

        if s:IsPlugged('neosnippet')
            " prabirshrestha/asyncomplete-neosnippet.vim
            call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
                        \ 'name':      'neosnippet',
                        \ 'whitelist': ['*'],
                        \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
                        \ }))
        endif

        if exists('*asyncomplete#sources#gocode#get_source_options')
            " prabirshrestha/asyncomplete-gocode.vim
            call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
                        \ 'name':      'gocode',
                        \ 'whitelist': ['go'],
                        \ 'completor': function('asyncomplete#sources#gocode#completor'),
                        \ 'config':    {
                        \   'gocode_path': 'gocode',
                        \ },
                        \ }))
        endif

        if exists('*asyncomplete#sources#flow#get_source_options')
            " prabirshrestha/asyncomplete-flow.vim
            call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
                        \ 'name':      'flow',
                        \ 'whitelist': ['javascript'],
                        \ 'completor': function('asyncomplete#sources#flow#completor'),
                        \ 'config':    {
                        \   'prefer_local': 1,
                        \   'flowbin_path': 'flow',
                        \ },
                        \ }))
        endif
    endfunction

    augroup MyAutoCmd
        autocmd User asyncomplete_setup call s:SetupAsyncomplete()
    augroup END
endif

if s:IsPlugged('completor.vim')
    " maralla/completor.vim
    let g:completor_auto_trigger = g:zero_vim_autocomplete

    " Trigger complete manually
    inoremap <silent> <expr> <C-_> "<C-r>=completor#do('complete')<CR>"

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

        return "\<C-r>=completor#do('complete')\<CR>"
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
endif

if s:IsPlugged('vim-lsp')
    " prabirshrestha/vim-lsp
    augroup MyAutoCmd
        " go get -u golang.org/x/tools/cmd/gopls
        if executable('gopls')
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'gopls',
                        \ 'whitelist': ['go'],
                        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
                        \ })
            autocmd BufWritePre *.go LspDocumentFormatSync
        elseif executable('go-langserver')
            " go get -u github.com/sourcegraph/go-langserver
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'go-langserver',
                        \ 'whitelist': ['go'],
                        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
                        \ })
            autocmd BufWritePre *.go LspDocumentFormatSync
        endif

        " gem install solargraph
        if executable('solargraph')
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'solargraph',
                        \ 'whitelist': ['ruby'],
                        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
                        \ 'initialization_options': {"diagnostics": "true"},
                        \ })
        endif

        " pip install python-language-server
        if executable('pyls')
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'pyls',
                        \ 'whitelist': ['python'],
                        \ 'cmd': {server_info->['pyls']},
                        \ })
        endif

        " npm install -g flow-bin
        if executable('flow')
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'flow',
                        \ 'whitelist': ['javascript', 'javascript.jsx'],
                        \ 'cmd': {server_info->['flow', 'lsp', '--from', 'vim-lsp'] },
                        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
                        \ })
        endif

        " npm install -g dockerfile-language-server-nodejs
        if executable('docker-langserver')
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'docker-langserver',
                        \ 'whitelist': ['dockerfile'],
                        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
                        \ })
        endif
    augroup END
endif

if s:IsPlugged('vim-startify')
    " mhinz/vim-startify
    let g:startify_skiplist = [
                \ '.git/index',
                \ '.git/config',
                \ 'fugitiveblame',
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

    nnoremap <silent> <Leader><Enter> :Goyo<CR>
    vmap              <Leader><Enter> <Esc><Leader><Enter>gv

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

    augroup MyAutoCmd
        autocmd! User GoyoEnter nested call <SID>OnGoyoEnter()
        autocmd! User GoyoLeave nested call <SID>OnGoyoLeave()
    augroup END
endif

if s:IsPlugged('limelight.vim')
    " junegunn/limelight.vim
    let g:limelight_conceal_ctermfg     = 'gray'
    let g:limelight_conceal_ctermfg     = 240
    let g:limelight_conceal_guifg       = 'DarkGray'
    let g:limelight_conceal_guifg       = '#777777'
    let g:limelight_default_coefficient = 0.7
    let g:limelight_priority            = -1

    nnoremap <silent> <Leader>F :Limelight!!<CR>
    vmap              <Leader>F <Esc><Leader>Fgv
    nmap              <Leader>z <Plug>(Limelight)
    xmap              <Leader>z <Plug>(Limelight)
endif

if s:IsPlugged('ale')
    " dense-analysis/ale
    let g:ale_lint_on_text_changed     = 0
    let g:ale_lint_on_insert_leave     = 0
    let g:ale_lint_on_enter            = g:zero_vim_autolint
    let g:ale_lint_on_save             = g:zero_vim_autolint
    let g:ale_lint_on_filetype_changed = g:zero_vim_autolint
    let g:ale_set_loclist              = 1
    let g:ale_set_quickfix             = 0
    let g:ale_list_window_size         = 5
    let g:ale_keep_list_window_open    = 0
    let g:ale_open_list                = 0
    let g:ale_fix_on_save              = g:zero_vim_autofix

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
    let g:syntastic_auto_loc_list            = g:zero_vim_autolint
    let g:syntastic_auto_jump                = 1
    let g:syntastic_loc_list_height          = 5
    let g:syntastic_check_on_open            = g:zero_vim_autolint
    let g:syntastic_check_on_wq              = g:zero_vim_autolint
    let g:syntastic_aggregate_errors         = 1
    let g:syntastic_echo_current_error       = 1
    let g:syntastic_error_symbol             = '●' " •
    let g:syntastic_style_error_symbol       = '.'
    let g:syntastic_warning_symbol           = '!'
    let g:syntastic_style_warning_symbol     = '*'

    function! s:syntastic_add_checker(filetype, program, ...) abort
        if executable(a:program)
            let programs = get(g:, printf('syntastic_%s_checkers', a:filetype), [])
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
    call s:syntastic_add_checker('yaml', 'yamllint')

    nnoremap <silent> <Leader>bc :SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>
endif

if s:IsPlugged('vim-autoformat')
    " Chiel92/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    nnoremap <silent> <Leader>= :Autoformat <Bar> update<CR>
    xnoremap <silent> <Leader>= :Autoformat <Bar> update<CR>
    nmap     <silent> <Leader>b= <Leader>=
    xmap     <silent> <Leader>b= <Leader>=
endif

if s:IsPlugged('vim-prettier')
    " prettier/vim-prettier
    let g:prettier#autoformat = 0

    nmap <Leader>ap <Plug>(PrettierAsync)
endif

if s:IsPlugged('vim-gutentags')
    " ludovicchabant/vim-gutentags
    " Enable only ctags module
    let g:gutentags_modules = ['ctags']

    " Generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " Ignored file types
    let g:gutentags_exclude_filetypes = ['html', 'xml', 'css', 'sass', 'scss', 'coffee', 'less', 'eruby', 'haml', 'hamlc', 'text',  'git', 'gitcommit', 'fugitiveblame']

    " Prevent gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0

    " Define advanced commands
    let g:gutentags_define_advanced_commands = 1
endif

if s:IsPlugged('gutentags_plus')
    " skywind3000/gutentags_plus
    " Enable gtags module
    let g:gutentags_modules = ['ctags', 'gtags_cscope']

    " Auto add the generated code database
    let g:gutentags_auto_add_gtags_cscope = 1

    " No default mapping
    let g:gutentags_plus_nomap = 1

    noremap <silent> <C-\>s :GscopeFind s <C-r><C-w><CR>
    noremap <silent> <C-\>g :GscopeFind g <C-r><C-w><CR>
    noremap <silent> <C-\>c :GscopeFind c <C-r><C-w><CR>
    noremap <silent> <C-\>t :GscopeFind t <C-r><C-w><CR>
    noremap <silent> <C-\>e :GscopeFind e <C-r><C-w><CR>
    noremap <silent> <C-\>f :GscopeFind f <C-r>=expand("<cfile>")<CR><CR>
    noremap <silent> <C-\>i :GscopeFind i <C-r>=expand("<cfile>")<CR><CR>
    noremap <silent> <C-\>d :GscopeFind d <C-r><C-W><CR>
    noremap <silent> <C-\>a :GscopeFind a <C-r><C-W><CR>
    noremap <silent> <C-\>k :GscopeKill<CR>
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

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow  = 1

" tpope/vim-markdown
let g:markdown_fenced_languages = [
            \ 'bash=sh', 'coffee', 'sass', 'scss', 'css', 'html', 'xml', 'erb=eruby', 'ruby',
            \ 'javascript', 'js=javascript', 'json=javascript', 'python', 'sql', 'vim'
            \ ]

if s:IsPlugged('vim-rails')
    " tpope/vim-rails
    nnoremap <silent> <Leader>ba :AE<CR>
    nnoremap <silent> <Leader>br :RE<CR>

    let g:rails_projections = {
                \ "app/controllers/*_controller.rb": {
                \   "alternate": [
                \       "spec/requests/{}_spec.rb",
                \       "spec/requests/{}_controller_spec.rb",
                \       "spec/controllers/{}_controller_spec.rb",
                \   ],
                \ },
                \ "spec/requests/*_spec.rb": {
                \   "alternate": [
                \       "app/controllers/{}.rb",
                \       "app/controllers/{}_controller.rb",
                \   ]
                \ },
                \ }
endif

if s:IsPlugged('vim-go')
    " fatih/vim-go and phongnh/go-explorer
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

if s:IsPlugged('vim-polyglot')
    " sheerun/vim-polyglot
    let g:polyglot_disabled = ['fish', 'coffee-script', 'go']

    " plasticboy/vim-markdown
    let g:vim_markdown_no_default_key_mappings = 1
    let g:vim_markdown_fenced_languages        = ["c++=cpp", 'bash=sh', 'erb=eruby', 'js=javascript', 'json=javascript', 'viml=vim']
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

if s:IsPlugged('committia.vim')
    " rhysd/committia.vim
    let g:committia_hooks = {}

    function! g:committia_hooks.edit_open(info)
        " Additional settings
        setlocal spell

        " " If no commit message, start with insert mode
        " if a:info.vcs ==# 'git' && getline(1) ==# ''
        "     startinsert
        " endif

        " Scroll the diff window
        nmap <buffer> <C-f> <Plug>(committia-scroll-diff-down-page)
        nmap <buffer> <C-b> <Plug>(committia-scroll-diff-up-page)
        nmap <buffer> <C-d> <Plug>(committia-scroll-diff-down-half)
        nmap <buffer> <C-u> <Plug>(committia-scroll-diff-up-half)
    endfunction
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

    nnoremap <silent> yog :GitGutterToggle<CR>:echo printf('%s GitGutter!', g:gitgutter_enabled ? 'Enabled' : 'Disabled')<CR>
endif

if s:IsPlugged('vim-signify')
    " mhinz/vim-signify
    let g:signify_disable_by_default    = !g:zero_vim_git_gutter
    let g:signify_vcs_list              = ['git', 'hg']
    let g:signify_cursorhold_insert     = 0
    let g:signify_cursorhold_normal     = 0
    let g:signify_update_on_bufenter    = 0
    let g:signify_update_on_focusgained = 0

    nnoremap <silent> yog :SignifyToggle<CR>echo printf('%s Signify on buffer!', get(b:, 'sy', { 'active': 0 }).active ? 'Enabled' : 'Disabled')<CR>
endif

" chrisbra/unicode.vim
nmap <F3> <Plug>(UnicodeSwapCompleteName)
nmap <F4> <Plug>(MakeDigraph)
vmap <F4> <Plug>(MakeDigraph)

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
" let g:gruvbox_contrast_dark  = 'hard'
" let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_italic         = 1

" lifepillar/vim-solarized8
let g:solarized_use16        = 1
let g:solarized_term_italics = 1

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

if s:IsPlugged('vim-which-key')
    " liuchengxu/vim-which-key
    let g:which_key_map = {
                \ '<CR>': 'toggle-distraction-free-writing',
                \ '=':    'auto-format-buffer',
                \ 'n':    'open-selected-region',
                \ 'e':    'toggle-explorer',
                \ 'E':    'open-explorer-in-cwd',
                \ 'z':    'hyperfocus-on-range',
                \ 'F':    'toggle-hyperfocus-writing',
                \ 'H':    'toggle-start-screen',
                \ 'T':    'toggle-tagbar',
                \ 'U':    'toggle-undo-tree',
                \ 'R':    'replace-prompt',
                \ 'S':    'search-prompt',
                \ 'L':    'search-location-list-prompt',
                \ 'B':    'search-in-buffer-prompt',
                \ 'w':    'save-buffer',
                \ 'x':    'save-and-close-buffer',
                \ ' ':    'files',
                \ 'f':    'files',
                \ 'p':    'buffer-project',
                \ 'o':    'opening-buffers',
                \ 'O':    'recent-files',
                \ 'd':    'files-in-buffer-dir',
                \ 'D':    'files-in-parent-dir-of-buffer-dir',
                \ '\':    'tag',
                \ '[':    'opening-buffer-outline',
                \ ']':    'opening-buffer-tag',
                \ ':':    'command-history',
                \ '/':    'search-history',
                \ }

    let g:which_key_map.a = {
                \ 'name': '+format',
                \ 'p':    'prettier',
                \ }

    let g:which_key_map.b = {
                \ 'name': '+buffer',
                \ '=':    'auto-format-buffer',
                \ 'i':    'toggle-indent-guide',
                \ 'v':    'toggle-rainbow',
                \ 'c':    'check-buffer-syntax',
                \ 'C':    'fix-buffer-syntax',
                \ 'f':    'find-buffer-in-explorer',
                \ 'g':    'open-buffer-project-in-explorer',
                \ 'b':    'opening-buffer',
                \ 'j':    'buffers-in-tab',
                \ 'h':    'files-in-buffer-dir',
                \ 'p':    'buffer-project',
                \ 'a':    'buffer-alternative',
                \ 'r':    'buffer-related',
                \ 't':    'buffer-tag',
                \ ']':    'opening-buffer-tag',
                \ 'o':    'buffer-outline',
                \ '[':    'opening-buffer-outline',
                \ 'l':    'buffer-line',
                \ 'e':    'reload-buffer',
                \ 'w':    'save-buffer',
                \ 'u':    'save-buffer-and-delete-trailing-spaces',
                \ 'x':    'save-and-close-buffer',
                \ 'd':    'unload-buffer',
                \ 'q':    'unload-buffer',
                \ 'k':    'wipeout-buffer',
                \ '-':    'wipeout-buffer',
                \ 's':    'search-cword-in-buffer',
                \ 'y':    'copy-buffer-to-clipboard',
                \ 'n':    'open-selected-region',
                \ 'm':    'maximize-buffer',
                \ }

    let g:which_key_map.c = {
                \ 'name': '+comment',
                \ ' ':    'toggle-comment',
                \ 'i':    'toggle-comment-individually',
                \ 'c':    'comment',
                \ 'a':    'comment-with-alternate-delimiters',
                \ 'l':    'comment-align-left',
                \ 'b':    'comment-align-both',
                \ 'n':    'comment-line-nesting',
                \ 'm':    'comment-minimal',
                \ 's':    'comment-sexily',
                \ '$':    'comment-from-cursor-to-eol',
                \ 'y':    'yank-and-comment',
                \ 'u':    'uncomment-current-line',
                \ 'A':    'add-comment-to-eol',
                \ }

    let g:which_key_map.g = {
                \ 'name': '+git',
                \ 'i':    'stage-current-file-interactive',
                \ 'a':    'stage-all-interactive',
                \ 's':    'status',
                \ 'd':    'diff',
                \ 'c':    'commit',
                \ 'b':    'blame',
                \ 'e':    'edit-prompt',
                \ 'r':    'reset-file',
                \ 'w':    'save-and-stage-current-file',
                \ 'f':    'fetch',
                \ 'p':    'push',
                \ 'u':    'pull-and-rebase',
                \ 'k':    'commit-browser',
                \ 'K':    'current-file-commit-browser',
                \ 'v':    'current-file-revisions',
                \ }

    let g:which_key_map.m = {
                \ 'name': '+tmuxify',
                \ 'b':    'send-<ctrl-c>',
                \ 'c':    'send-<ctrl-l>',
                \ 'n':    'create-and-associate-with-pane',
                \ 'p':    'associate-with-existing-pane',
                \ 'q':    'close-associated-pane',
                \ 'r':    'send-text-prompt',
                \ 't':    'create-pane',
                \ 'i':    'send-prompt-input',
                \ 's':    'send-paragraph',
                \ 'S':    'send-buffer',
                \ 'l':    'send-line',
                \ 'w':    'send-word',
                \ 'a':    'resend-last-text',
                \ 'k':    'send-key-prompt',
                \ 'u':    'send-<q>',
                \ 'm':    'send-<enter>',
                \ 'd':    'send-<ctrl-d>',
                \ }

    let g:which_key_map.v = {
                \ 'name': '+tmuxify-buffer',
                \ 'b':    'send-<ctrl-c>',
                \ 'c':    'send-<ctrl-l>',
                \ 'n':    'create-and-associate-with-pane',
                \ 'p':    'associate-with-existing-pane',
                \ 'q':    'close-associated-pane',
                \ 'r':    'send-text-prompt',
                \ 't':    'create-pane',
                \ 'i':    'send-prompt-input',
                \ 's':    'send-paragraph',
                \ 'S':    'send-buffer',
                \ 'l':    'send-line',
                \ 'w':    'send-word',
                \ 'a':    'resend-last-text',
                \ 'k':    'send-key-prompt',
                \ 'u':    'send-<q>',
                \ 'm':    'send-<enter>',
                \ 'd':    'send-<ctrl-d>',
                \ 'v':    'update-plugins',
                \ }

    let g:which_key_map.s = {
                \ 'name': '+search/replace/surround',
                \ 's':    'search-cword',
                \ 'i':    'search-cword-prompt',
                \ 'r':    'search-and-replace-prompt',
                \ 'v':    'subvert-prompt',
                \ '/':    'search-pattern-from-/',
                \ '?':    'search-pattern-from-/-prompt',
                \ 'l':    'search-cword-location-list',
                \ 'b':    'search-cword-in-buffer',
                \ 'p':    'ctrlsf-search-prompt',
                \ 'f':    'ctrlsf-search-cword',
                \ 'c':    'ctrlsf-search-cword-prompt',
                \ 'u':    'ctrlsf-search-update',
                \ 'o':    'toogle-ctrlsf-search-result',
                \ 't':    'search-cword-in-tag',
                \ 'g':    'search-cword-fuzzy',
                \ 'w':    'surround-cword',
                \ 'W':    'surround-CWORD',
                \ }

    let g:which_key_map.t = {
                \ 'name': '+test',
                \ 't':    'run-all-tests-in-current-file',
                \ 'f':    'run-test-nearest-to-current-cursor',
                \ 'n':    'run-test-nearest-to-current-cursor',
                \ 'l':    'run-last-test',
                \ 's':    'run-whole-test-suite',
                \ 'v':    'visit-test-test',
                \ }

    let g:which_key_map.r = {
                \ 'name': '+rubocop',
                \ }

    call which_key#register('<Space>', 'g:which_key_map')

    nnoremap <silent> <Leader> :<C-u>WhichKey '<Space>'<CR>
    vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Space>'<CR>

    nnoremap <silent> <LocalLeader> :<C-u>WhichKey '\'<CR>
    vnoremap <silent> <LocalLeader> :<C-u>WhichKeyVisual '\'<CR>
endif

" Setup custom mapping to open specific folder
function! OpenFolderWithMapping(folder, mapping) abort
    if exists(':LeaderfFileInDir') == 2
        let cmd = 'LeaderfFileInDir'
    elseif exists(':Files') == 2
        let cmd = 'Files'
    else
        let cmd = 'CtrlP'
    endif
    execute printf('nnoremap <silent> %s :%s %s<CR>', a:mapping, cmd, a:folder)
endfunction

call s:Source('.init.vim.local')

try
    if exists('g:zero_vim_colorscheme')
        if exists('g:zero_vim_background')
            execute 'set background=' . g:zero_vim_background
        endif
        execute 'colorscheme ' . g:zero_vim_colorscheme
    else
        set background=dark
        colorscheme gruvbox
    endif
catch
    set background=dark
    colorscheme gruvbox
endtry

set secure

