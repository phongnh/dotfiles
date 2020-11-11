if has('vim_starting')
    set encoding=utf-8
endif
scriptencoding utf-8

if &shell =~# 'fish$' " && (v:version < 704 || v:version == 704 && !has('patch276'))
    if executable('zsh')
        let &shell = exepath('zsh')
    elseif executable('bash')
        let &shell = exepath('bash')
    endif
endif

" Python 3
if executable('python3')
    let g:python3_host_prog = exepath('python3')
endif

if has('pythonx')
    set pyxversion=3
endif

" Disable Python 2 support
let g:loaded_python_provider = 0

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

" Helpers
" Find and source vimrc from root to current folder
" ~/projects/hello $
" .
" └── /home/phong
"     ├── vimrc
"     └── projects
"         ├── vimrc
"         └── hello
"             ├── vimrc
"             └── ...
"
" Files are sourced in order for the call s:Source('vimrc'):
"   /home/phong/vimrc
"   /home/phong/projects/vimrc
"   /home/phong/projects/hello/vimrc
function! s:Source(vimrc) abort
    let vimrcs = findfile(a:vimrc, ';', -1)
    for vimrc in reverse(vimrcs)
        execute 'source ' . fnamemodify(vimrc, ':p')
    endfor
endfunction

" Check if plugin group is used or not
function! s:Use(group) abort
    return index(g:zero_vim_groups, a:group) > -1
endfunction

" Check if a plugin is plugged in plug section or not
function! s:IsPlugged(plugin) abort
    return has_key(g:plugs, a:plugin)
endfunction

" Plugin Dir
function! s:PlugDir(plugin) abort
    return g:plugs[a:plugin]['dir']
endfunction

" Check if LSP is enabled
function! s:IsLSPEnabled() abort
    return s:IsPlugged('coc.nvim') || s:IsPlugged('nvim-lspconfig') || s:IsPlugged('vim-lsp') || s:IsPlugged('vim-lsc') || s:IsPlugged('LanguageClient-neovim') || s:IsPlugged('vim-lamp')
endfunction

" Check if ctags is Universal Ctags
function! s:IsUniversalCtags(ctags_path) abort
    if !exists('s:universal_ctags')
        let s:universal_ctags = {}
    endif
    if !has_key(s:universal_ctags, a:ctags_path)
        try
            let s:universal_ctags[a:ctags_path] = system(printf('%s --version', a:ctags_path)) =~# 'Universal Ctags'
        catch
            let s:universal_ctags[a:ctags_path] = 0
        endtry
    endif
    return s:universal_ctags[a:ctags_path]
endfunction

" Find and source .init.vim.before from root to current folder
call s:Source('.init.vim.before')

" Default zero settings
let g:zero_vim_groups                   = get(g:, 'zero_vim_groups',                   [])
let g:zero_vim_devicons                 = get(g:, 'zero_vim_devicons',                 0)
let g:zero_vim_glyph_palette            = get(g:, 'zero_vim_glyph_palette',            0)
let g:zero_vim_true_color               = get(g:, 'zero_vim_true_color',               0)
let g:zero_vim_powerline                = get(g:, 'zero_vim_powerline',                0)
let g:zero_vim_powerline_style          = get(g:, 'zero_vim_powerline_style',          'default')
let g:zero_vim_powerline_spaces         = get(g:, 'zero_vim_powerline_spaces',         {})
let g:zero_vim_solarized                = get(g:, 'zero_vim_solarized',                0)
let g:zero_vim_lsp_diagnostics          = get(g:, 'zero_vim_lsp_diagnostics',          0)
let g:zero_vim_lsp_highlight_references = get(g:, 'zero_vim_lsp_highlight_references', 0)
let g:zero_vim_autolint                 = get(g:, 'zero_vim_autolint',                 0)
let g:zero_vim_autofix                  = get(g:, 'zero_vim_autofix',                  0)
let g:zero_vim_git_gutter               = get(g:, 'zero_vim_git_gutter',               1)
let g:zero_vim_grep_ignore_vcs          = get(g:, 'zero_vim_grep_ignore_vcs',          0)
let g:zero_vim_find_tool                = get(g:, 'zero_vim_find_tool',                'rg')
let g:zero_vim_indent_char              = get(g:, 'zero_vim_indent_char',              '┊')
let g:zero_vim_indent_first_char        = get(g:, 'zero_vim_indent_first_char',        '│')
let g:zero_vim_ctags_bin                = get(g:, 'zero_vim_ctags_bin',                executable('ctags-universal') ? 'ctags-universal' : 'ctags')
let g:zero_vim_ctags_ignore             = get(g:, 'zero_vim_ctags_ignore',             expand('~/.ctagsignore'))
let g:zero_vim_gtags_cscope             = get(g:, 'zero_vim_gtags_cscope',             0)

" Default signs
let g:zero_vim_signs = extend({
            \ 'error':         '🅔',
            \ 'style_error':   'ⓔ',
            \ 'warning':       '🅦',
            \ 'style_warning': 'ⓦ',
            \ 'information':   '🅘',
            \ 'hint':          '🅗',
            \ 'virtual_text':  '🅥',
            \ }, get(g:, 'zero_vim_signs', {}))

" True Color settings
if g:zero_vim_true_color && has('termguicolors')
    set termguicolors
endif

" Plugins
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

    " Better whitespace highlighting for vim
    Plug 'ntpeters/vim-better-whitespace'

    " Enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'

    " Pairs of handy bracket mappings
    Plug 'tpope/vim-unimpaired'

    " Toggle useful settings
    Plug 'phongnh/vim-toggler'

    " Maximize current buffer
    Plug 'phongnh/ZoomWin'

    " Sane buffer/window deletion.
    Plug 'mhinz/vim-sayonara'

    " A Narrow Region Plugin for vim (like Emacs Narrow Region)
    Plug 'chrisbra/NrrwRgn'

    if s:Use('quickfix-enhanced')
        " Tame the quickfix window
        Plug 'romainl/vim-qf'
    else
        " Open a Quickfix item in a window you choose. (Vim plugin)
        Plug 'yssl/QFEnter'
    endif
" }

" Search {
    " Helps you win at grep.
    Plug 'mhinz/vim-grepper'

    " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
    Plug 'dyng/ctrlsf.vim'
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

    if s:Use('auto-pairs')
        " insert or delete brackets, parens, quotes in pair
        Plug 'jiangmiao/auto-pairs'
    else
        " Auto close parentheses and repeat by dot dot dot...
        Plug 'cohama/lexima.vim'
    endif

    if s:Use('multiple-cursors')
        " True Sublime Text style multiple selections for Vim
        Plug 'terryma/vim-multiple-cursors'
    else
        " Multiple cursors plugin for vim/neovim
        Plug 'mg979/vim-visual-multi'
    endif

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
    if s:Use('text-objects')
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-entire'                " e
        Plug 'kana/vim-textobj-line'                  " l
        Plug 'kana/vim-textobj-indent'                " i
        Plug 'glts/vim-textobj-comment'               " c
        Plug 'mattn/vim-textobj-url'                  " u
        Plug 'rhysd/vim-textobj-conflict'             " =, remapped to C
        Plug 'rhysd/vim-textobj-word-column'          " v
        Plug 'inside/vim-textobj-jsxattr'             " x
        Plug 'rhysd/vim-textobj-ruby'                 " r: any block | ro: definitions, rl: loop, rc: control, rd: do, rr: any block
        Plug 'whatyouhide/vim-textobj-erb'            " E
        Plug 'edkolev/erlang-motions.vim'             " m: function clause, M: function declaration
        Plug 'andyl/vim-textobj-elixir'               " e, remapped to r

        " Vim plugin that provides additional text objects
        Plug 'wellle/targets.vim'
    endif
" }

" Appearance {
    if s:Use('airline')
        " My airline settings
        let g:airline_powerline        = g:zero_vim_powerline
        let g:airline_powerline_style  = g:zero_vim_powerline_style
        let g:airline_powerline_spaces = g:zero_vim_powerline_spaces
        Plug 'phongnh/airline-settings.vim'
        " lean & mean status/tabline for vim that's light as air
        Plug 'vim-airline/vim-airline'
        " A collection of themes for vim-airline
        Plug 'vim-airline/vim-airline-themes'
    elseif s:Use('lightline')
        " My lightline settings
        let g:lightline_powerline        = g:zero_vim_powerline
        let g:lightline_powerline_style  = g:zero_vim_powerline_style
        let g:lightline_powerline_spaces = g:zero_vim_powerline_spaces
        Plug 'phongnh/lightline-settings.vim'
        " A light and configurable statusline/tabline plugin for Vim
        Plug 'itchyny/lightline.vim'
    else
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

    if s:Use('fern') && has('nvim-0.4.2')
        " General purpose asynchrnonous tree viewer written in Pure Vim script
        Plug 'lambdalisue/fern.vim'
        Plug 'hrsh7th/fern-mapping-collapse-or-leave.vim'
        if g:zero_vim_devicons
            if s:Use('nerdfont')
                Plug 'lambdalisue/nerdfont.vim'
                Plug 'lambdalisue/fern-renderer-nerdfont.vim'
            else
                Plug 'phongnh/fern-renderer-devicons.vim'
            endif
        endif
    elseif s:Use('vaffle')
        Plug 'cocopon/vaffle.vim'
        if g:zero_vim_devicons && s:Use('nerdfont')
            Plug 'lambdalisue/nerdfont.vim'
        endif
    else
        " A tree explorer plugin for vim
        Plug 'scrooloose/nerdtree'
    endif
" }

" Fuzzy finder {
    if s:Use('ctrlp')
        if s:Use('fruzzy') && has('python3')
            Plug 'raghur/fruzzy', { 'do': ':call fruzzy#install()' }
        endif

        if s:Use('fzy-matcher') && has('python3') && executable('fzy')
            Plug 'phongnh/ctrlp-fzy-matcher'
        endif

        if s:Use('cmatcher') && has('python3')
            Plug 'phongnh/ctrlp-cmatcher', { 'do': './install.sh' }
        endif

        if has('python3') && executable('cmake')
            Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }
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
    elseif s:Use('leaderf') && has('python3')
        " An asynchronous fuzzy finder which is used to quickly locate files, buffers, mrus, tags, etc. in large project.
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
        " Solarized theme for LeaderF
        Plug 'phongnh/vim-leaderf-solarized-theme'
    elseif s:Use('clap') && has('nvim-0.4.2')
        " Viewer & Finder for LSP symbols and tags
        Plug 'liuchengxu/vista.vim'

        " Modern performant generic finder and dispatcher for Vim and NeoVim
        Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

        " Solarized theme for Clap Popup
        Plug 'phongnh/vim-clap-solarized-theme'
    else
        " A command-line fuzzy finder written in Go
        Plug 'junegunn/fzf', { 'do': './install --bin' }
        Plug 'junegunn/fzf.vim'
        Plug 'phongnh/fzf-settings.vim'
    endif
" }

" Snippets and Autocomplete {
    if s:Use('ultisnips') && has('python3')
        Plug 'honza/vim-snippets'
        Plug 'SirVer/ultisnips'
    elseif s:Use('neosnippet')
        Plug 'honza/vim-snippets'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'Shougo/neosnippet.vim'
    endif

    if s:Use('coc')
        " coc.nvim plugin has both autocomplete and lsp functions
    elseif s:Use('nvim-lsp') && has('nvim-0.5-nightly')
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/diagnostic-nvim'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('lsp')
        Plug 'prabirshrestha/vim-lsp'
        Plug 'mattn/vim-lsp-settings'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('lsc')
        Plug 'natebosch/vim-lsc'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('LanguageClient')
        Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('lamp')
        Plug 'hrsh7th/vim-lamp'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    endif

    if s:Use('completion-nvim') && has('nvim-0.5-nightly')
        Plug 'nvim-lua/completion-nvim'
        Plug 'steelsojka/completion-buffers'
        Plug 'kristijanhusak/completion-tags'
        if s:Use('treesitter')
            Plug 'nvim-treesitter/completion-treesitter'
        endif
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('deoplete') && has('python3')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        if s:IsPlugged('nvim-lsp')
            Plug 'Shougo/deoplete-lsp'
        elseif s:IsPlugged('vim-lsp')
            Plug 'lighttiger2505/deoplete-vim-lsp'
        elseif s:IsPlugged('vim-lsc')
            Plug 'hrsh7th/deoplete-vim-lsc'
        elseif s:IsPlugged('vim-lamp')
            Plug 'hrsh7th/deoplete-lamp'
        endif
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('coc') && executable('yarn')
        Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    elseif s:Use('YouCompleteMe') && has('python3') && executable('cmake')
        function! BuildYCM(info) abort
            if a:info.status == 'unchanged' && !a:info.force
                return
            endif

            let l:cmd = '!./install.py'

            if !executable('clangd')
                let l:cmd .= ' --clangd-completer'
            endif

            if !executable('gopls')
                let l:cmd .= ' --go-completer'
            endif

            if !executable('rustc')
                let l:cmd .= ' --rust-completer'
            endif

            if !executable('tsserver')
                let l:cmd .= ' --ts-completer'
            endif

            echomsg '[vim-plug] YouCompleteMe:' l:cmd
            execute l:cmd
        endfunction

        Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
    elseif s:Use('asyncomplete')
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-buffer.vim'
        Plug 'prabirshrestha/asyncomplete-file.vim'
        Plug 'yami-beta/asyncomplete-omni.vim'
        if s:IsPlugged('ultisnips')
            Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
        elseif s:IsPlugged('neosnippet.vim')
            Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
        endif
        if s:IsPlugged('vim-lsp')
            Plug 'prabirshrestha/asyncomplete-lsp.vim'
        elseif s:IsPlugged('vim-lamp')
            Plug 'hrsh7th/asyncomplete-lamp'
        endif
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    elseif s:Use('ncm2') && has('python3')
        Plug 'roxma/nvim-yarp'
        Plug 'ncm2/ncm2'
        Plug 'ncm2/ncm2-bufword'
        Plug 'ncm2/ncm2-path'
        if s:IsPlugged('ultisnips')
            Plug 'ncm2/ncm2-ultisnips'
        elseif s:IsPlugged('neosnippet.vim')
            Plug 'ncm2/ncm2-neosnippet'
        endif
        if s:IsPlugged('vim-lsp')
            Plug 'ncm2/ncm2-vim-lsp'
        endif
    elseif s:Use('completor') && has('python3')
        Plug 'maralla/completor.vim'
        if s:IsPlugged('neosnippet')
            Plug 'maralla/completor-neosnippet'
        endif
    elseif s:Use('mucomplete')
        Plug 'lifepillar/vim-mucomplete'
        Plug 'hrsh7th/vim-vsnip'
        Plug 'hrsh7th/vim-vsnip-integ'
    else
        Plug 'ajh17/VimCompletesMe'
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

    " projectionist.vim: Granular project configuration
    Plug 'tpope/vim-projectionist'
" }

" Syntax Checking/Linting {
    if s:Use('lint')
        " Asynchronous Lint Engine
        Plug 'dense-analysis/ale'
    elseif s:Use('neomake')
        " Asynchronous linting and make framework for Neovim/Vim
        Plug 'neomake/neomake'
    elseif s:Use('syntastic')
        " Syntax checking hacks for vim
        Plug 'vim-syntastic/syntastic'
    endif
" }

" Format {
    if s:Use('format')
        if has('python3')
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
    if executable(g:zero_vim_ctags_bin)
        if s:Use('ctags')
            " A Vim plugin that manages your tag files
            Plug 'ludovicchabant/vim-gutentags'
        elseif s:Use('gen_tags')
            " Async plugin for vim and neovim to ease the use of ctags/gtags
            Plug 'jsfaint/gen_tags.vim'
        endif

        if s:Use('tagbar')
            " A class outline viewer for Vim
            Plug 'majutsushi/tagbar'
            Plug 'phongnh/vim-tagbar-settings'
        endif

        if s:Use('vista') && s:IsUniversalCtags(g:zero_vim_ctags_bin)
            " Viewer & Finder for LSP symbols and tags
            Plug 'liuchengxu/vista.vim'
        endif
    endif
" }

" Undo history {
    if s:Use('undo')
        if has('python3')
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

" Git {
    if s:Use('git')
        " An awesome Git wrapper so awesome
        Plug 'tpope/vim-fugitive'

        " A git commit browser in Vim
        Plug 'junegunn/gv.vim'

        " Vim and Neovim plugin to reveal the commit messages under the cursor
        Plug 'rhysd/git-messenger.vim'

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

" Web {
    if s:Use('web')
        Plug 'othree/html5.vim'
        Plug 'hail2u/vim-css3-syntax'
        Plug 'HerringtonDarkholme/yats.vim'
        Plug 'pangloss/vim-javascript' | Plug 'othree/javascript-libraries-syntax.vim'
        Plug 'MaxMEllon/vim-jsx-pretty'
        Plug 'jparise/vim-graphql'
        Plug 'elzr/vim-json'
        Plug 'tpope/vim-jdaddy'
        Plug 'heavenshell/vim-jsdoc'
        Plug 'gko/vim-coloresque'
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
        Plug 'vim-ruby/vim-ruby'
        Plug 'stephpy/vim-yaml'
        Plug 'noprompt/vim-yardoc'
        Plug 'keith/rspec.vim'
        Plug 'tpope/vim-rake'
        Plug 'tpope/vim-rails'
        Plug 'phongnh/vim-rubocop'
    endif
" }

" Crystal {
    if s:Use('crystal')
        Plug 'vim-crystal/vim-crystal'
        Plug 'elorest/vim-slang'
    endif
" }

" Python {
    if s:Use('python')
        Plug 'vim-python/python-syntax'
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

" Rust {
    if s:Use('rust')
        Plug 'rust-lang/rust.vim'
    endif
" }

" Erlang {
    if s:Use('erlang')
        Plug 'vim-erlang/vim-erlang-runtime'
        Plug 'vim-erlang/vim-erlang-compiler'
    endif
" }

" Elixir {
    if s:Use('elixir')
        Plug 'elixir-editors/vim-elixir'
        Plug 'mhinz/vim-mix-format'
    endif
" }

" Others {
    if s:Use('syntax') || s:Use('polyglot')
        " A solid language pack for Vim
        let g:polyglot_disabled = ['autoindent', 'sensible']
        if s:Use('web') | call extend(g:polyglot_disabled, ['html5', 'typescript', 'javascript', 'jsx', 'graphql', 'json']) | endif
        if s:Use('coffee-script') | call add(g:polyglot_disabled, 'coffee-script') | endif
        if s:Use('ruby') | call extend(g:polyglot_disabled, ['ruby', 'yaml', 'yard', 'rspec']) | endif
        if s:Use('crystal') | call add(g:polyglot_disabled, 'crystal') | endif
        if s:Use('python') | call add(g:polyglot_disabled, 'python') | endif
        if s:Use('go') | call add(g:polyglot_disabled, 'go') | endif
        if s:Use('rust') | call add(g:polyglot_disabled, 'rust') | endif
        if s:Use('erlang') | call add(g:polyglot_disabled, 'erlang') | endif
        if s:Use('elixir') | call add(g:polyglot_disabled, 'elixir') | endif
        Plug 'sheerun/vim-polyglot'
    else
        Plug 'georgewitteman/vim-fish'
        Plug 'hashivim/vim-terraform'
    endif
" }

" Run your tests at the speed of thought
Plug 'vim-test/vim-test'

" Nvim Treesitter configurations and abstraction layer
if s:Use('treesitter') && has('nvim-0.5-nightly')
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    if s:Use('treesitter-context')
        Plug 'romgrk/nvim-treesitter-context'
    endif
endif

" Color schemes {
    " Default
    Plug 'altercation/vim-colors-solarized'
    Plug 'gruvbox-community/gruvbox'
    Plug 'NLKNguyen/papercolor-theme'

    " Code never sleeps in Gotham City
    Plug 'whatyouhide/gotham'

    " Dark
    Plug 'dracula/vim'
    Plug 'doums/darcula'

    " True Color
    Plug 'lifepillar/vim-solarized8'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'arcticicestudio/nord-vim'
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'drewtempelmeyer/palenight.vim'

    " Simple
    Plug 'pbrisbin/vim-colors-off'
" }

" DevIcons {
    if g:zero_vim_devicons
        " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
        Plug 'ryanoasis/vim-devicons'
        " An universal palette for Nerd Fonts
        Plug 'lambdalisue/glyph-palette.vim'
    endif
" }

if s:Use('which-key')
    " Vim plugin that shows keybindings in popup
    Plug 'liuchengxu/vim-which-key'
endif

" My default filetype settings
Plug 'phongnh/filetype-settings.vim'

" Fix CursorHold Performance
" https://github.com/neovim/neovim/issues/12587
Plug 'antoinemadec/FixCursorHold.nvim'

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

set shortmess=aiToOc                " Print current file name, cursor position and file status (press C-g)

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
set completeopt=menuone,noinsert,noselect
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

" Search and Replace
nnoremap <Leader>R  :%s//gc<Left><Left><Left>
nmap     <Leader>rr <Leader>R
nnoremap <Leader>sr :%s/<C-r>=vim_helpers#CwordForSubstitute()<CR>/gc<Left><Left><Left>
nmap     <Leader>rw <Leader>sr

xnoremap <Leader>R  :s/\%V/gc<Left><Left><Left>
xmap     <Leader>rr <Leader>R
xnoremap <Leader>sr <Esc>:%s/<C-r>=vim_helpers#SelectedTextForSubstitute()<CR>//gc<Left><Left><Left>
xmap     <Leader>rw <Leader>sr

" Search and Replace entries in quickfix with :cdo
nnoremap <Leader>Q  :cdo s//<Left>
nnoremap <Leader>sq :cdo s/<C-r>=vim_helpers#CwordForSubstitute()<CR>/<Left>
xnoremap <Leader>sq <Esc>:cdo s/<C-r>=vim_helpers#SelectedTextForSubstitute()<CR>//<Left>

" Buffer-related mappings
" gl: Go to Last buffer
nnoremap <silent> gl :buffer#<CR>

" Edit file from buffer folder
nnoremap <C-w><C-e> :edit <C-r>=fnameescape(expand('%:p:~:.:h')) . '/'<CR>

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

" Set buffer filetype
nnoremap <Leader>b; :set filetype=

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
        execute 'nnoremap <silent> ' . a:prefix . 'u :TxSendKey'   . a:suffix . ' C-u q C-u<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'm :TxSendKey'   . a:suffix . ' Enter<CR>'
        execute 'nnoremap <silent> ' . a:prefix . 'd :TxSendKey'   . a:suffix . ' C-d<CR>'
    endfunction

    " Global mappings
    call s:SetupTmuxifyMappings('<Leader>m', '!')
    " Local mappings
    call s:SetupTmuxifyMappings('<Leader>v', '')

    function! TmuxifySendKeys(keys, bang)
        let keys = empty(a:keys) ? input('TxSendKeys> ') : a:keys
        for key in split(keys)
            call tmuxify#pane_send_raw(key, a:bang)
        endfor
    endfunction

    function! s:RedefineTmuxifyCommands() abort
        " Overwrite TxClear and TxSendKey commands
        command! -nargs=0 -bar -bang TxClear   call TmuxifySendKeys('C-u C-l C-u', <q-bang>)
        command! -nargs=? -bar -bang TxSendKey call TmuxifySendKeys(<q-args>, <q-bang>)
    endfunction

    augroup MyAutoCmd
        autocmd VimEnter * call <SID>RedefineTmuxifyCommands()
    augroup END
endif

" tpope/vim-dispatch
let g:dispatch_quickfix_height = 10
let g:dispatch_tmux_height     = 1

" phongnh/vim-helpers
let g:grep_ignore_vcs = g:zero_vim_grep_ignore_vcs

" Tig Status
nnoremap <silent> <Leader>gt :TigStatus<CR>

" ntpeters/vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save  = 0

let g:better_whitespace_filetypes_blacklist = [
            \ 'terminal',
            \ 'diff',
            \ 'git',
            \ 'gitcommit',
            \ 'ctrlsf',
            \ 'unite',
            \ 'qf',
            \ 'help',
            \ 'markdown',
            \ ]

nnoremap <silent> <Leader>bu :StripWhitespace<CR>:update<CR>
vnoremap <silent> <Leader>bu :StripWhitespace<CR>:update<CR>gv
nnoremap <silent> yo<Space>  :ToggleWhitespace<CR>

" phongnh/ZoomWin
nmap <silent> <Leader>bm <Plug>ZoomWin
vmap          <Leader>bm <Esc><Leader>bmgv

" mhinz/vim-sayonara
let g:sayonara_filetypes = {
            \ 'nerdtree':    'NERDTreeClose',
            \ 'bufexplorer': 'ToggleBufExplorer',
            \ 'undotree':    'UndotreeHide',
            \ 'gundo':       'GundoHide',
            \ }

nnoremap <silent> <Leader>bd :Sayonara!<CR>

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

if s:IsPlugged('vim-qf')
    " romainl/vim-qf
    let g:qf_auto_open_quickfix = 0
    let g:qf_auto_open_loclist  = 0
    let g:qf_mapping_ack_style  = 1

    function! s:RemapQuickfixMappings() abort
        execute 'nnoremap <silent> <expr> <buffer> <C-v> ' . maparg('v', 'n')
        execute 'nnoremap <silent>        <buffer> <C-s> ' . maparg('s', 'n')
        execute 'nnoremap <silent>        <buffer> <C-x> ' . maparg('s', 'n')
        execute 'nnoremap <silent>        <buffer> <C-t> ' . maparg('t', 'n')
        nnoremap <buffer> v v
        nnoremap <buffer> t t
    endfunction

    augroup MyAutoCmd
        autocmd FileType qf call <SID>RemapQuickfixMappings()
    augroup end
endif

if s:IsPlugged('QFEnter')
    " yssl/QFEnter
    let g:qfenter_enable_autoquickfix = 0

    let g:qfenter_keymap = {}
    let g:qfenter_keymap.vopen = ['<C-v>']
    let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
    let g:qfenter_keymap.topen = ['<C-t>']
endif

" mhinz/vim-grepper
let g:grepper = {
            \ 'open':                1,
            \ 'switch':              1,
            \ 'jump':                0,
            \ 'prompt_mapping_tool': '<C-\>',
            \ 'tools':               ['rg', 'ag', 'git', 'grep', 'findstr'],
            \ 'stop':                2000,
            \ }

runtime plugin/grepper.vim

if has_key(g:grepper, 'rg')
    let g:grepper.rg.grepprg .= ' --hidden' .  (g:zero_vim_grep_ignore_vcs ? ' --no-ignore-vcs' : '')
endif

if has_key(g:grepper, 'ag')
    let g:grepper.ag.grepprg .= ' --hidden' .  (g:zero_vim_grep_ignore_vcs ? ' --skip-vcs-ignores' : '')
endif

command! -nargs=* -complete=customlist,grepper#complete PGrepper Grepper -dir repo,filecwd <args>
command! -nargs=* -complete=customlist,grepper#complete LGrepper Grepper -noquickfix <args>
command! -nargs=* -complete=customlist,grepper#complete BGrepper LGrepper -buffer <args>

function! s:TGrepper(qargs) abort
    if exists(':GrepperRg') == 2
        let cmd = 'GrepperRg ' . vim_helpers#ParseGrepFileTypeOption('rg')
    elseif exists(':GrepperAg') == 2
        let cmd = 'GrepperAg ' . vim_helpers#ParseGrepFileTypeOption('ag')
    elseif exists(':GrepperGrep') == 2
        let cmd = 'GrepperGrep ' . vim_helpers#ParseGrepFileTypeOption('grep')
    else
        let cmd = 'Grepper'
    endif
    execute vim_helpers#strip(cmd . ' ' . a:qargs)
endfunction

function! s:TGrepperCword(word_boundary, qargs) abort
    if a:word_boundary
        let cword = vim_helpers#CCwordForGrep()
    else
        let cword = vim_helpers#CwordForGrep()
    endif
    call s:TGrepper(cword . ' ' . a:qargs)
endfunction

command! -nargs=+ -complete=dir TGrepper       call <SID>TGrepper(<q-args>)
command! -nargs=? -complete=dir TGrepperCCword call <SID>TGrepperCword(1, <q-args>)
command! -nargs=? -complete=dir TGrepperCword  call <SID>TGrepperCword(0, <q-args>)

nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)

nnoremap <silent> <Leader>S  :Grepper<CR>
nmap              <Leader>se <Leader>S
nnoremap <silent> <Leader>ss :Grepper -noprompt -cword<CR>
xnoremap <silent> <Leader>ss <Esc>:Grepper -noprompt -query <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>
nnoremap <silent> <Leader>sp :PGrepper -noprompt -cword<CR>
xnoremap <silent> <Leader>sp <Esc>:PGrepper -noprompt -query <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>
nnoremap <silent> <Leader>si :Grepper -prompt -cword<CR>
xnoremap <silent> <Leader>si <Esc>:Grepper -prompt -query <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>
nnoremap <silent> <Leader>s/ :Grepper -noprompt -query <C-r>=vim_helpers#SearchTextForShell()<CR><CR>
nnoremap <silent> <Leader>s? :Grepper -prompt -query <C-r>=vim_helpers#SearchTextForShell()<CR><CR>

nnoremap <silent> <Leader>L  :LGrepper<CR>
nnoremap <silent> <Leader>sl :LGrepper -noprompt -cword<CR>
xnoremap <silent> <Leader>sl <Esc>:LGrepper -noprompt -query <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>

nnoremap          <Leader>B  :BGrepper<CR>
nnoremap <silent> <Leader>bs :BGrepper -noprompt -cword<CR>
xnoremap <silent> <Leader>bs <Esc>:BGrepper -noprompt -query <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>

" Grepper with current buffer file type
nnoremap <silent> <Leader>sb :TGrepperCCword<CR>
xnoremap <silent> <Leader>sb <Esc>:TGrepper <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>

" dyng/ctrlsf.vim
let g:ctrlsf_populate_qflist = 0
let g:ctrlsf_auto_focus = {
            \ 'at': 'start'
            \ }

function! s:CtrlSFParseFileTypeOption(cmd) abort
    let ext = expand('%:e')

    if a:cmd ==# 'rg'
        let ft = vim_helpers#RgFileType(&filetype)

        if strlen(ft) && vim_helpers#IsRgKnownFileType(ft)
            return printf("-filetype %s", ft)
        elseif strlen(ext)
            return printf("-filematch '*.%s'", ext)
        endif
    elseif a:cmd ==# 'ag'
        let ft = vim_helpers#AgFileType(&filetype)

        if strlen(ft) && vim_helpers#IsAgKnownFileType(ft)
            return printf("-filetype %s", ft)
        elseif strlen(ext)
            return printf("-filematch '.%s$'", ext)
        endif
    endif

    return ''
endfunction

" CtrlSF prefers ag over rg
if executable('ag')
    let g:ctrlsf_backend = 'ag'
elseif executable('rg')
    let g:ctrlsf_backend = 'rg'
endif

function! s:TCtrlSF(qargs) abort
    let cmd = 'CtrlSF ' . s:CtrlSFParseFileTypeOption(get(g:, 'ctrlsf_backend', ''))
    execute vim_helpers#strip(cmd . ' ' . a:qargs)
endfunction

function! s:TCtrlSFCword(word_boundary, qargs) abort
    if a:word_boundary && get(g:, 'ctrlsf_backend', '') =~# 'ag\|rg'
        let cword = '-R \b' . expand('<cword>') . '\b'
    else
        let cword = expand('<cword>')
    endif
    call s:TCtrlSF(cword . ' ' . a:qargs)
endfunction

command! -nargs=+ -complete=dir TCtrlSF       call <SID>TCtrlSF(<q-args>)
command! -nargs=? -complete=dir TCtrlSFCCword call <SID>TCtrlSFCword(1, <q-args>)
command! -nargs=? -complete=dir TCtrlSFCword  call <SID>TCtrlSFCword(0, <q-args>)

nmap              <Leader>F  <Plug>CtrlSFPrompt
nmap              <Leader>sf <Plug>CtrlSFCCwordExec
vmap              <Leader>sf <Plug>CtrlSFVwordExec
nmap              <Leader>sc <Plug>CtrlSFCCwordPath
vmap              <Leader>sc <Plug>CtrlSFVwordPath
nnoremap <silent> <Leader>so :CtrlSFToggle<CR>
nnoremap <silent> <Leader>su :CtrlSFUpdate<CR>

" CtrlSF with current buffer file type
nnoremap <silent> <Leader>sn :TCtrlSFCCword<CR>
xnoremap <silent> <Leader>sn <Esc>:TCtrlSF <C-r>=vim_helpers#SelectedTextForShell()<CR><CR>

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
nnoremap <Leader>V  :%Subvert//gc<Left><Left><Left>
nmap     <Leader>rv <Leader>V
nnoremap <Leader>sv :%Subvert/<C-r>=vim_helpers#CwordForSubstitute()<CR>/gc<Left><Left><Left>
nmap     <Leader>rc <Leader>sv

xnoremap <Leader>V  :Subvert//gc<Left><Left><Left>
xmap     <Leader>rv <Leader>V
xnoremap <Leader>sv <Esc>:%Subvert/<C-r>=vim_helpers#SelectedTextForSubstitute()<CR>//gc<Left><Left><Left>
xmap     <Leader>rc <Leader>sv

if s:IsPlugged('auto-pairs')
    " jiangmiao/auto-pairs
    let g:AutoPairsFlyMode            = 0
    let g:AutoPairsShortcutToggle     = '<M-p>'
    let g:AutoPairsShortcutFastWrap   = ''
    let g:AutoPairsShortcutJump       = '<M-n>'
    let g:AutoPairsShortcutBackInsert = ''
    let g:AutoPairsMoveCharacter      = ''
endif

if s:IsPlugged('lexima.vim')
    " cohama/lexima.vim
    let g:lexima_enable_basic_rules    = 1
    let g:lexima_enable_newline_rules  = 1
    let g:lexima_enable_space_rules    = 1
    let g:lexima_enable_endwise_rules  = 0
    let g:lexima_accept_pum_with_enter = 0   " Always insert new line regardless if popup menu is visible
    let g:lexima_ctrlh_as_backspace    = 1
    let g:lexima_map_escape            = ''  " Disabled Esc mapping
endif

" Autocompletion plugins should define these functions to
" integrate with vim-visual-multi / vim-multiple-cursors plugin
function! Disable_Completion_Hook() abort
endfunction

function! Enable_Completion_Hook() abort
endfunction

if s:IsPlugged('vim-multiple-cursors')
    " terryma/vim-multiple-cursors
    function! Multiple_cursors_before() abort
        let b:autopairs_enabled = 0
        let b:lexima_disabled = 1
        call Disable_Completion_Hook()
    endfunction

    function! Multiple_cursors_after() abort
        let b:autopairs_enabled = 1
        let b:lexima_disabled = 0
        call Enable_Completion_Hook()
    endfunction
endif

if s:IsPlugged('vim-visual-multi')
    " mg979/vim-visual-multi
    let g:VM_custom_remaps = {
                \ '<C-p>': 'N',
                \ '<C-x>': 'q',
                \ '<C-c>': '<Esc>',
                \ }

    function! VM_Start() abort
        let b:autopairs_enabled = 0
        let b:lexima_disabled = 1
        call Disable_Completion_Hook()
    endfunction

    function! VM_Exit() abort
        let b:autopairs_enabled = 1
        let b:lexima_disabled = 0
        call Enable_Completion_Hook()
    endfunction

    function! VM_Mappings() abort
        imap <nowait> <buffer> <C-c> <Esc><Esc>
    endfunction

    augroup MyAutoCmd
        autocmd User visual_multi_start call VM_Start()
        autocmd User visual_multi_exit call VM_Exit()
        autocmd User visual_multi_mappings call VM_Mappings()
    augroup end
endif

" mattn/emmet-vim
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_settings = {
            \ 'javascript.jsx': {
            \   'extends': 'jsx',
            \ },
            \ }

" AndrewRadev/sideways.vim
let g:sideways_search_timeout = 50

omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

nmap <silent> si <Plug>SidewaysArgumentInsertBefore
nmap <silent> sa <Plug>SidewaysArgumentAppendAfter
nmap <silent> sI <Plug>SidewaysArgumentInsertFirst
nmap <silent> sA <Plug>SidewaysArgumentAppendLast

nnoremap <silent> s[ :SidewaysJumpLeft<CR>
nnoremap <silent> s] :SidewaysJumpRight<CR>

nmap s< <Plug>SidewaysLeft
nmap s> <Plug>SidewaysRight

if s:IsPlugged('vim-textobj-conflict')
    " rhysd/vim-textobj-conflict
    let g:textobj_conflict_no_default_key_mappings = 1

    " Remap from '=' to 'C'
    omap aC <Plug>(textobj-conflict-_-a)
    xmap aC <Plug>(textobj-conflict-_-a)
    omap iC <Plug>(textobj-conflict-_-i)
    xmap iC <Plug>(textobj-conflict-_-i)
endif

if s:IsPlugged('vim-textobj-ruby')
    " rhysd/vim-textobj-ruby
    let g:textobj_ruby_more_mappings = 0
    let g:textobj_ruby_no_default_key_mappings = 1

    augroup MyAutoCmd
        autocmd FileType ruby
                    \ omap <buffer> ar <Plug>(textobj-ruby-any-a)|
                    \ xmap <buffer> ar <Plug>(textobj-ruby-any-a)|
                    \ omap <buffer> ir <Plug>(textobj-ruby-any-i)|
                    \ xmap <buffer> ir <Plug>(textobj-ruby-any-i)
    augroup END
endif

if s:IsPlugged('vim-textobj-erb')
    " whatyouhide/vim-textobj-erb
    let g:textobj_erb_no_default_key_mappings = 1

    augroup MyAutoCmd
        autocmd FileType rhtml,eruby,eruby.yaml,eruby.html,html.eruby
                    \ omap <buffer> aE <Plug>(textobj-erb-a)|
                    \ xmap <buffer> aE <Plug>(textobj-erb-a)|
                    \ omap <buffer> iE <Plug>(textobj-erb-i)|
                    \ xmap <buffer> iE <Plug>(textobj-erb-i)
    augroup END
endif

if s:IsPlugged('vim-textobj-elixir')
    " andyl/vim-textobj-elixir
    let g:textobj_elixir_no_default_key_mappings = 1

    " Remap from 'e' to 'r'
    augroup MyAutoCmd
        autocmd FileType elixir,eelixir
                    \ omap <buffer> ar <Plug>(textobj-elixir-any-a)|
                    \ xmap <buffer> ar <Plug>(textobj-elixir-any-a)|
                    \ omap <buffer> ir <Plug>(textobj-elixir-any-i)|
                    \ xmap <buffer> ir <Plug>(textobj-elixir-any-i)
    augroup END
endif

if s:IsPlugged('targets.vim')
    " wellle/targets.vim
    let g:targets_nl = 'nN'

    " Prefer multiline targets around cursor over distant targets within cursor line:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

    " Never seek backwards:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr lb ar ab lB Ar aB Ab AB rb rB bb bB BB'

    " Only seek if next/last targets touch current line:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll lb ar ab lB Ar aB Ab AB rb rB al Al'

    " Only consider targets fully visible on screen:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab rr rb bb ll al aa'

    " Only consider targets around cursor:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'

    " Only consider targets fully contained in current line:
    " let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr rr ll'

    augroup MyAutoCmd
        autocmd User targets#mappings#user call targets#mappings#extend({
                    \ 'a': {},
                    \ })
    augroup END
endif

" luochen1990/rainbow
let g:rainbow_active = 0
nnoremap <silent> <Leader>bv :RainbowToggle<CR>

" jlanzarotta/bufexplorer
let g:bufExplorerDisableDefaultKeyMapping = 1
let g:bufExplorerShowDirectories          = 0
let g:bufExplorerShowRelativePath         = 1

nnoremap <silent> gb :ToggleBufExplorer<CR>

if s:IsPlugged('fern.vim')
    " lambdalisue/fern.vim
    let g:fern#drawer_width = 35

    if s:IsPlugged('fern-renderer-nerdfont.vim')
        let g:fern#renderer                  = 'nerdfont'
        let g:fern#renderer#nerdfont#leading = '  '
    elseif s:IsPlugged('fern-renderer-devicons.vim')
        let g:fern#renderer                          = 'devicons'
        let g:fern_renderer_devicons_disable_warning = 1
        let g:fern#renderer#devicons#leading         = '  '
    else
        let g:fern#renderer#default#root_symbol      = "\u2302\u00a0"
        let g:fern#renderer#default#leading          = '  '
        let g:fern#renderer#default#leaf_symbol      = '  '
        let g:fern#renderer#default#collapsed_symbol = '+ '
        let g:fern#renderer#default#expanded_symbol  = '~ '

        let s:ESCAPE_PATTERN = '^$~.*[]\'
        function! s:HighlightFern() abort
            execute printf(
                        \ 'syntax match FernBranchSymbol /^\%%(%s\)*\%%(%s\|%s\)/ contained nextgroup=FernBranchText',
                        \ g:fern#renderer#default#leading =~ '\s\+' ? '\s\+' : escape(g:fern#renderer#default#leading, s:ESCAPE_PATTERN),
                        \ escape(g:fern#renderer#default#collapsed_symbol, s:ESCAPE_PATTERN),
                        \ escape(g:fern#renderer#default#expanded_symbol, s:ESCAPE_PATTERN),
                        \)
        endfunction

        augroup MyAutoCmd
            autocmd FileType fern call <SID>HighlightFern()
        augroup END
    endif

    command! -nargs=? -complete=customlist,fern#internal#command#fern#complete FernReveal Fern %:h <args> -reveal=%:t
    command! -nargs=? -complete=customlist,fern#internal#command#fern#complete FernCWD execute printf('Fern %s <args>', getcwd())
    command! -nargs=? -complete=customlist,fern#internal#command#fern#complete FernDrawerToggle Fern <args> -drawer -toggle
    command! -nargs=0 FernDrawerReveal FernReveal -drawer
    command! -nargs=0 FernDrawerCWD FernCWD -drawer

    function! s:InitFern() abort
        nmap <buffer> <Plug>(fern-action-reload-and-redraw)
                    \ <Plug>(fern-action-reload)
                    \ <Plug>(fern-action-redraw)

        nmap     <buffer> <silent> o  <Plug>(fern-action-open-or-expand)
        nmap     <buffer> <silent> p  <Plug>(fern-action-leave)
        nmap     <buffer> <silent> u  <Plug>(fern-action-leave)
        nmap     <buffer> <silent> r  <Plug>(fern-action-reload-and-redraw)
        nmap     <buffer> <silent> I  <Plug>(fern-action-hidden-toggle)
        nmap     <buffer> <silent> cd <Plug>(fern-action-cd)
        nnoremap <buffer> <silent> q  :<C-u>quit<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType fern call <SID>InitFern()
    augroup END

    nnoremap <silent> <Leader>e  :FernDrawerToggle .<CR>
    nnoremap <silent> <Leader>E  :FernDrawerCWD<CR>
    nnoremap <silent> <Leader>bf :FernDrawerReveal<CR>
endif

if s:IsPlugged('vaffle.vim')
    " cocopon/vaffle.vim
    " Hack for vaffle.vim with vim-projectionist
    let g:projectionist_ignore_vaffle = 1

    nnoremap <silent> <Leader>e  :Vaffle<CR>
    nnoremap <silent> <Leader>bf :Vaffle %<CR>

    if s:IsPlugged('nerdfont.vim')
        function! VaffleRenderCustomIcon(item) abort
            return nerdfont#find(a:item.basename, a:item.is_dir)
        endfunction

        let g:vaffle_render_custom_icon = 'VaffleRenderCustomIcon'
    elseif s:IsPlugged('vim-devicons')
        function! VaffleRenderCustomIcon(item) abort
            return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
        endfunction

        let g:vaffle_render_custom_icon = 'VaffleRenderCustomIcon'
    endif

    function! s:InitVaffle() abort
        setlocal cursorline

        nmap <buffer> <silent> cd <Plug>(vaffle-chdir-here)
        nmap <buffer> <silent> P  <Plug>(vaffle-open-root)
        nmap <buffer> <silent> K  <Plug>(vaffle-mkdir)
        nmap <buffer> <silent> N  <Plug>(vaffle-new-file)
        nmap <buffer> <silent> s  <Plug>(vaffle-toggle-current)
        nmap <buffer> <silent> b  :<C-u>b#<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType vaffle call s:InitVaffle()
    augroup END
endif

if s:IsPlugged('nerdtree')
    " scrooloose/nerdtree
    let g:NERDTreeWinSize       = 35
    let g:NERDTreeMouseMode     = 2
    let g:NERDTreeMapChangeRoot = '.' " Map . for changing root in NERDTree
    let g:NERDTreeQuitOnOpen    = 0
    let g:NERDTreeChDirMode     = 0
    let g:NERDTreeShowBookmarks = 1

    if g:zero_vim_devicons
        let g:NERDTreeDirArrowExpandable  = "\u00a0"
        let g:NERDTreeDirArrowCollapsible = "\u00a0"
    else
        let g:NERDTreeDirArrowExpandable  = '+'
        let g:NERDTreeDirArrowCollapsible = '~'
    endif

    nnoremap <silent> <Leader>e  :NERDTreeToggle<CR>
    noremap  <silent> <Leader>E  :NERDTreeCWD<CR>
    nnoremap <silent> <Leader>bf :NERDTreeFind<CR>
    nnoremap <silent> <Leader>bg :NERDTreeVCS<CR>
endif

if s:IsPlugged('ctrlp.vim')
    " ctrlpvim/ctrlp.vim
    let g:ctrlp_find_tool        = g:zero_vim_find_tool
    let g:ctrlp_cmd              = 'CtrlPRoot'
    let g:ctrlp_buftag_ctags_bin = g:zero_vim_ctags_bin

    if s:IsPlugged('fruzzy')
        " raghur/fruzzy
        let g:fruzzy#usenative       = 1
        let g:fruzzy#sortonempty     = 0
        let ctrlp_match_current_file = 1
        let g:ctrlp_match_func       = { 'match': 'fruzzy#ctrlp#matcher' }
    elseif s:IsPlugged('ctrlp-fzy-matcher')
        " phongnh/ctrlp-fzy-matcher
        let g:ctrlp_match_func       = { 'match': 'fzy_matcher#match' }
    elseif s:IsPlugged('ctrlp-cmatcher') && filereadable(s:PlugDir('ctrlp-cmatcher') . 'autoload/fuzzycomt.so')
        " phongnh/ctrlp-cmatcher
        let g:ctrlp_match_func       = { 'match': 'matcher#cmatch' }
    elseif s:IsPlugged('cpsm') && filereadable(s:PlugDir('cpsm') . 'autoload/cpsm_py.so')
        " nixprime/cpsm
        let g:cpsm_match_empty_query = 0
        let g:cpsm_highlight_mode    = 'basic'
        let g:ctrlp_match_func       = { 'match': 'cpsm#CtrlPMatch' }
    endif

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f :CtrlP<CR>
    nnoremap <silent> <Leader>p :CtrlPRoot<CR>
    nnoremap <silent> <Leader>o :CtrlPBuffer<CR>
    nnoremap <silent> <Leader>O :CtrlPMRUFiles<CR>
    nnoremap <silent> <Leader>d :CtrlPCurFile<CR>
    nnoremap <silent> <Leader>D :CtrlP <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :CtrlPTag<CR>

    nnoremap <silent> <Leader>q :cclose<CR>:CtrlPQuickfix<CR>

    " Buffer-related mappings
    nnoremap <silent> <Leader>bb :CtrlPBuffer<CR>
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :CtrlPLine %<CR>
    nnoremap <silent> <Leader>bt :CtrlPBufTag<CR>
    nnoremap <silent> <Leader>]  :CtrlPBufTagAll<CR>

    " DavidEGx/ctrlp-smarttabs
    nnoremap <silent> <Leader>bj :CtrlPSmartTabs<CR>

    " tacahiroy/ctrlp-funky
    nnoremap <silent> <Leader>bo :CtrlPFunky<CR>
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
    nnoremap <silent> <Leader>l :lclose<CR>:CtrlPLocationlist<CR>
endif

if s:IsPlugged('LeaderF')
    " Yggdroot/LeaderF
    let g:leaderf_solarized_theme = g:zero_vim_solarized

    let g:Lf_ShowDevIcons  = g:zero_vim_devicons
    let g:Lf_WindowHeight  = 0.30
    let g:Lf_MruMaxFiles   = 200
    let g:Lf_CursorBlink   = 1
    let g:Lf_PreviewResult = { 'BufTag': 0, 'Function': 0 }

    " Powerline Separator
    if g:zero_vim_powerline
        let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2" }
    else
        let g:Lf_StlSeparator = { 'left': '', 'right': '' }
    endif

    " Popup Settings
    let g:Lf_PopupShowStatusline  = 0
    let g:Lf_PreviewInPopup       = 1
    let g:Lf_PopupPreviewPosition = 'bottom'
    if exists('*nvim_win_set_config') && has('nvim-0.4.2')
        let g:Lf_WindowPosition = 'popup'
    endif

    let g:Lf_UseCache       = 0  " rg/ag is enough fast, we don't need cache
    let g:Lf_NeedCacheTime  = 10 " 10 seconds
    let g:Lf_UseMemoryCache = 1

    let g:Lf_NoChdir              = 1
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

    let g:Lf_Ctags         = g:zero_vim_ctags_bin
    let g:Lf_CtagsFuncOpts = {
                \ 'ruby': '--ruby-kinds=fFS',
                \ }

    let g:Lf_CommandMap = {
                \ '<F5>':  [ '<F5>', '<C-g>' ],
                \ '<C-o>': [ '<C-o', '<C-e>' ],
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

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <C-p>     :LeaderfRoot<CR>
    nnoremap <silent> <Leader>p :LeaderfRoot<CR>
    nnoremap <silent> <Leader>o :LeaderfBuffer<CR>
    nnoremap <silent> <Leader>O :LeaderfMru<CR>
    nnoremap <silent> <Leader>d :LeaderfFile <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :LeaderfFile <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :LeaderfTag<CR>

    " Buffer-related mappings
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :LeaderfLine<CR>
    nnoremap <silent> <Leader>bt :LeaderfBufTag<CR>
    nnoremap <silent> <Leader>]  :LeaderfBufTagAll<CR>

    nnoremap <silent> <Leader>bj :LeaderfTabBufferAll<CR>

    nnoremap <silent> <Leader>bo :LeaderfFunction<CR>
    nnoremap <silent> <Leader>[  :LeaderfFunctionAll<CR>

    nnoremap <silent> <Leader>b; :Leaderf filetype<CR>

    nnoremap <silent> <Leader>; :LeaderfCommand<CR>
    nnoremap <silent> <Leader>: :LeaderfHistoryCmd<CR>
    nnoremap <silent> <Leader>/ :LeaderfHistorySearch<CR>

    nnoremap <silent> <Leader>q :cclose<CR>:LeaderfQuickFix<CR>
    nnoremap <silent> <Leader>l :lclose<CR>:LeaderfLocList<CR>

    nmap              <Leader>sg <Plug>LeaderfRgCwordLiteralBoundary<CR>
    vmap              <Leader>sg <Plug>LeaderfRgVisualLiteralNoBoundary<CR>
    nnoremap <silent> <Leader>sa :Leaderf rg --recall<CR>
endif

if s:IsPlugged('vim-clap')
    " liuchengxu/vim-clap
    let g:clap_solarized_theme = g:zero_vim_solarized

    let g:clap_search_box_border_style = 'nil'
    let g:clap_disable_run_rooter      = v:true
    let g:clap_popup_cursor_shape      = ''
    let g:clap_current_selection_sign  = { 'text': '» ', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
    let g:clap_selected_sign           = { 'text': ' »', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
    let g:clap_prompt_format           = ' %spinner%%forerunner_status%%provider_id%:'
    let g:clap_layout                  = { 'relative': 'editor', 'width': '65%', 'height': '50%',  'row': '20%', 'col': '15%' }

    function! ClapPromptFormat() abort
        if g:clap.provider.id ==# 'files' && exists('g:__clap_provider_cwd')
            let cwd = fnamemodify(g:__clap_provider_cwd, ':~:.')
            if cwd[0] ==# '~' || cwd[0] ==# '/'
                let cwd = pathshorten(cwd)
            endif
            return g:clap_prompt_format . cwd . ' '
        endif
        return g:clap_prompt_format . ' '
    endfunction

    let g:ClapPrompt = function('ClapPromptFormat')

    if executable('rg')
        let g:clap_provider_grep_executable = 'rg'
        let g:clap_provider_grep_opts = '-H --no-heading --hidden --vimgrep --smart-case' . (g:zero_vim_grep_ignore_vcs ? ' --no-ignore-vcs' : '')
    elseif executable('ag')
        let g:clap_provider_grep_executable = 'ag'
        let s:clap_provider_grep_opts = '--noheading --hidden --vimgrep --smart-case' . (g:zero_vim_grep_ignore_vcs ? ' --skip-vcs-ignores' : '')
    endif

    let s:clap_find_tools = {
                \ 'rg': 'rg --color=never --no-ignore-vcs --hidden --files',
                \ 'ag': "ag --nocolor --skip-vcs-ignores --hidden -l -g ''",
                \ 'fd': 'fd --color=never --no-ignore-vcs --hidden --type file',
                \ }

    if g:zero_vim_find_tool == 'fd' && executable('fd')
        let s:clap_find_tool = s:clap_find_tools['fd']
    elseif g:zero_vim_find_tool == 'ag' && executable('ag')
        let s:clap_find_tool = s:clap_find_tools['ag']
    elseif executable('rg')
        let s:clap_find_tool = s:clap_find_tools['rg']
    elseif executable('ag')
        let s:clap_find_tool = s:clap_find_tools['ag']
    elseif executable('fd')
        let s:clap_find_tool = s:clap_find_tools['fd']
    endif

    command! -bang -nargs=? -complete=dir ClapFiles execute printf('%s files ++finder=%s', <bang>0 ? 'Clap!' : 'Clap', s:clap_find_tool) <q-args>

    function! s:ClapFindProjectDir(starting_path) abort
        if empty(a:starting_path)
            return ''
        endif

        for root_marker in ['.git', '.hg', '.svn']
            let root_dir = finddir(root_marker, a:starting_path . ';')
            if empty(root_dir)
                continue
            endif

            let root_dir = substitute(root_dir, root_marker, '', '')
            if !empty(root_dir)
                let root_dir = fnamemodify(root_dir, ':p:~:.')
            endif

            return root_dir
        endfor

        return ''
    endfunction

    command! -bang -nargs=0 ClapRoot execute (<bang>0 ? 'ClapFiles!' : 'ClapFiles') s:ClapFindProjectDir(expand('%:p:h'))

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f :ClapFiles<CR>
    nnoremap <silent> <C-p>     :ClapRoot<CR>
    nnoremap <silent> <Leader>p :ClapRoot<CR>
    nnoremap <silent> <Leader>o :Clap buffers<CR>
    nnoremap <silent> <Leader>O :Clap history<CR>
    nnoremap <silent> <Leader>d :ClapFiles <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :ClapFiles <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :Clap proj_tags<CR>

    nnoremap <silent> <Leader>. :Clap filer<CR>

    " Buffer-related mappings
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bl :Clap blines<CR>
    nnoremap <silent> <Leader>bt :Clap tags<CR>
    nnoremap <silent> <Leader>]  :Clap proj_tags<CR>

    nnoremap <silent> <Leader>bj :Clap windows<CR>

    nnoremap <silent> <Leader>bo :Clap tags<CR>
    nnoremap <silent> <Leader>[  :Clap proj_tags<CR>

    nnoremap <silent> <Leader>b; :Clap filetypes<CR>

    nnoremap <silent> <Leader>; :Clap command<CR>
    nnoremap <silent> <Leader>: :Clap command_history<CR>
    nnoremap <silent> <Leader>/ :Clap search_history<CR>

    nnoremap <silent> <Leader>' :Clap marks<CR>

    nnoremap <silent> <Leader>y :Clap yanks<CR>
    nnoremap <silent> <Leader>Y :Clap registers<CR>

    nnoremap <silent> <Leader>q :cclose<CR>:Clap quickfix<CR>
    nnoremap <silent> <Leader>l :lclose<CR>:Clap loclist<CR>

    nnoremap <silent> <Leader>sg :Clap grep2 ++query=<cword><CR>
    xnoremap <silent> <Leader>sg <Esc>:Clap grep2 ++query=@visual<CR>

    nnoremap <silent> <Leader>sa :Clap grep ++query=<cword><CR>
    xnoremap <silent> <Leader>sa <Esc>:Clap grep ++query=@visual<CR>
endif

if s:IsPlugged('fzf')
    " junegunn/fzf and junegunn/fzf.vim
    let g:fzf_find_tool = g:zero_vim_find_tool
    let g:fzf_ctags     = g:zero_vim_ctags_bin

    nmap <Leader><Leader> <Leader>f

    nnoremap <silent> <Leader>f :Files<CR>
    nnoremap <silent> <C-p>     :PFiles<CR>
    nnoremap <silent> <Leader>p :PFiles<CR>
    nnoremap <silent> <Leader>o :Buffers<CR>
    nnoremap <silent> <Leader>O :History<CR>
    nnoremap <silent> <Leader>d :Files <C-r>=expand("%:h")<CR><CR>
    nnoremap <silent> <Leader>D :Files <C-r>=expand("%:h:h")<CR><CR>

    nnoremap <silent> <Leader>\ :Tags!<CR>

    " Buffer-related mappings
    nmap              <Leader>bh <Leader>d
    nmap              <Leader>bp <Leader>p
    nnoremap <silent> <Leader>bb :Buffers<CR>
    nnoremap <silent> <Leader>bl :BLines<CR>
    nnoremap <silent> <Leader>bt :BTags<CR>
    nnoremap <silent> <Leader>bo :BOutline<CR>

    nnoremap <silent> <Leader>b; :Filetypes<CR>

    nnoremap <silent> <Leader>; :Commands<CR>
    nnoremap <silent> <Leader>: :History:<CR>
    nnoremap <silent> <Leader>/ :History/<CR>

    nnoremap <silent> <Leader>q :cclose<CR>:Quickfix<CR>
    nnoremap <silent> <Leader>l :lclose<CR>:LocationList<CR>

    nnoremap <silent> <Leader>sg :Ag! <C-r><C-w><CR>
    xnoremap <silent> <Leader>sg <Esc>:Ag! -F <C-r>=vim_helpers#SelectedText()<CR><CR>
endif

if s:IsPlugged('ultisnips')
    " SirVer/ultisnips
    let g:UltiSnipsExpandTrigger       = '<Plug>(ultisnips_expand)'
    let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-z>'
    let g:UltiSnipsListSnippets        = ''

    " Jump Forward result
    let g:ulti_jump_forwards_res = 0 " (0: fail, 1: success)

    function s:IsExpandableUltiSnips() abort
        return !(
                    \ col('.') <= 1
                    \ || !empty(matchstr(getline('.'), '\%' . (col('.') - 1) . 'c\s'))
                    \ || empty(UltiSnips#SnippetsInCurrentScope())
                    \ )
    endfunction

    function! s:UltiSnipsExpand() abort
        if s:IsExpandableUltiSnips()
            return "\<Plug>(ultisnips_expand_or_jump)"
        endif

        if pumvisible()
            return "\<C-e>"
        endif

        return "\<C-k>"
    endfunction

    inoremap <silent> <Plug>(ultisnips_expand_or_jump) <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
    snoremap <silent> <Plug>(ultisnips_expand_or_jump) <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

    imap <silent> <expr> <C-k> <SID>UltiSnipsExpand()
    smap                 <C-k> <Plug>(ultisnips_expand_or_jump)
    xmap                 <C-k> <Plug>(ultisnips_expand)
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

    function! s:NeoSnippetExpand() abort
        if neosnippet#expandable_or_jumpable()
            return "\<Plug>(neosnippet_expand_or_jump)"
        endif

        if pumvisible()
            return "\<C-e>"
        endif

        return "\<C-k>"
    endfunction

    imap <silent> <expr> <C-k> <SID>NeoSnippetExpand()
    smap                 <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap                 <C-k> <Plug>(neosnippet_expand_target)

    imap <C-j> <Plug>(neosnippet_jump)
    smap <C-j> <Plug>(neosnippet_jump)
    smap <Tab> <Plug>(neosnippet_jump)
endif

" LSP Servers
let g:language_servers = {
            \ 'bash-language-server': {
            \   'cmd': ['bash-language-server', 'start'],
            \   'filetypes': ['sh'],
            \ },
            \ 'ccls': {
            \   'cmd': ['ccls'],
            \   'filetypes': ['c', 'cpp'],
            \ },
            \ 'clangd': {
            \   'cmd': ['clangd', '--background-index'],
            \   'filetypes': ['c', 'cpp'],
            \ },
            \ 'cquery': {
            \   'cmd': ['cquery'],
            \   'filetypes': ['c', 'cpp'],
            \ },
            \ 'css-languageserver': {
            \   'cmd': ['css-languageserver', '--stdio'],
            \   'filetypes': ['css', 'scss', 'less'],
            \ },
            \ 'docker-langserver': {
            \   'cmd': ['docker-langserver', '--stdio'],
            \   'filetypes': ['dockerfile'],
            \ },
            \ 'elixir-ls': {
            \   'cmd': ['elixir-ls'],
            \   'filetypes': ['elixir'],
            \   'root_markers': ['mix.exs'],
            \ },
            \ 'erlang-ls': {
            \   'cmd': ['erlang-ls'],
            \   'filetypes': ['erlang'],
            \   'root_markers': ['rebar.config'],
            \ },
            \ 'flow': {
            \   'cmd': ['flow', 'lsp', '--from', 'vim'],
            \   'filetypes': ['javascript', 'javascripteact', 'javascript.jsx'],
            \ },
            \ 'gopls': {
            \   'cmd': ['gopls', '-mode', 'stdio'],
            \   'filetypes': ['go'],
            \ },
            \ 'html-languageserver': {
            \   'cmd': ['html-languageserver', '--stdio'],
            \   'filetypes': ['html'],
            \ },
            \ 'javascript-typescript-langserver': {
            \   'cmd': ['javascript-typescript-langserver'],
            \   'filetypes': ['javascript', 'javascriptreact', 'javascript.jsx'],
            \ },
            \ 'json-languageserver': {
            \   'cmd': ['json-languageserver', '--stdio'],
            \   'filetypes': ['json'],
            \ },
            \ 'lua-lsp': {
            \   'cmd': ['lua-lsp'],
            \   'filetypes': ['lua'],
            \ },
            \ 'metals': {
            \   'cmd': ['metals'],
            \   'filetypes': ['scalar', 'sbt'],
            \ },
            \ 'pyls': {
            \   'cmd': ['pyls'],
            \   'filetypes': ['python'],
            \ },
            \ 'pyls-ms': {
            \   'cmd': ['pyls-ms'],
            \   'filetypes': ['python'],
            \ },
            \ 'rust-analyzer': {
            \   'cmd': ['rust-analyzer'],
            \   'filetypes': ['rust'],
            \ },
            \ 'rls': {
            \   'cmd': ['rls'],
            \   'filetypes': ['rust'],
            \ },
            \ 'rustup-nightly-rls': {
            \   'cmd': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
            \   'filetypes': ['rust'],
            \ },
            \ 'scry': {
            \  'cmd': ['scry'],
            \   'filetypes': ['crystal'],
            \ },
            \ 'solargraph': {
            \   'cmd': ['solargraph', 'stdio'],
            \   'filetypes': ['ruby'],
            \   'initialization_options': { 'diagnostics': 'true' },
            \   'root_markers': ['Gemfile'],
            \ },
            \ 'sql-language-server': {
            \   'cmd': ['sql-language-server', 'up', '--method', 'stdio'],
            \   'filetypes': ['sql'],
            \ },
            \ 'srb': {
            \   'cmd': ['srb', 'tc', '--typed', 'true', '--enable-all-experimental-lsp-features', '--lsp', '--disable-watchman', '--dir', '.'],
            \   'filetypes': ['ruby'],
            \ },
            \ 'terraform-ls': {
            \   'cmd': ['terraform-ls'],
            \   'filetypes': ['terraform'],
            \ },
            \ 'terraform-lsp': {
            \   'cmd': ['terraform-lsp'],
            \   'filetypes': ['terraform'],
            \ },
            \ 'typescript-language-server': {
            \   'cmd': ['typescript-language-server', '--stdio'],
            \   'filetypes': ['javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'],
            \ },
            \ 'vim-language-server': {
            \   'cmd': ['vim-language-server', '--stdio'],
            \   'filetypes': ['vim'],
            \ },
            \ 'vls': {
            \   'cmd': ['vls'],
            \   'filetypes': ['vue'],
            \ },
            \ 'yaml-language-server': {
            \   'cmd': ['yaml-language-server', '--stdio'],
            \   'filetypes': ['yaml'],
            \ },
            \ }

function! s:CheckLanguageServers(server_names) abort
    let l:valid_language_servers = []

    for l:name in a:server_names
        if !has_key(g:language_servers, l:name)
            continue
        endif

        let cmd = g:language_servers[l:name]['cmd']

        if executable(cmd[0])
            if !empty(exepath(cmd[0]))
                let cmd[0] = exepath(cmd[0])
            endif
            call add(l:valid_language_servers, l:name)
        endif
    endfor

    return l:valid_language_servers
endfunction

" Enabled Language Servers
function! s:GetEnabledLanguageServers() abort
    if exists('s:enabled_language_servers')
        return s:enabled_language_servers
    endif

    let l:server_names = get(g:, 'zero_vim_enabled_language_servers', [
                \ 'clangd',
                \ 'ccls',
                \ 'solargraph',
                \ 'scry',
                \ 'pyls',
                \ 'gopls',
                \ 'rls',
                \ 'rust-analyzer',
                \ 'elixir-ls',
                \ 'erlang-ls',
                \ 'lua-lsp',
                \ 'metals',
                \ 'yaml-language-server',
                \ 'html-languageserver',
                \ 'css-languageserver',
                \ 'json-languageserver',
                \ 'typescript-language-server',
                \ 'docker-langserver',
                \ 'terraform-ls',
                \ 'terraform-lsp',
                \ 'bash-language-server',
                \ 'vim-language-server',
                \ ])

    let s:enabled_language_servers = s:CheckLanguageServers(l:server_names)

    return s:enabled_language_servers
endfunction

if s:IsPlugged('nvim-lspconfig')
    " neovim/nvim-lspconfig
    function! s:InitNvimLSP() abort
        try
            lua << EOF
            local nvim_lsp = require'nvim_lsp'
            local diagnostic = require'diagnostic'

            local on_attach = function(client, bufnr)
                diagnostic.on_attach(client)

                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings
                local opts = { noremap=true, silent=true }

                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H',  '<cmd>lua vim.lsp.buf.hover()<CR>',                  opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<CR>',            opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'M',  '<cmd>lua vim.lsp.buf.rename()<CR>',                 opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gF', '<cmd>lua vim.lsp.buf.formating()<CR>',              opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',            opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g[', '<cmd>lua vim.lsp.buf.definition()<CR>',             opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>',        opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>',         opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.signature_help()<CR>',         opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'go', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',        opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gO', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',       opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',             opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gL', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g{', '<cmd>lua vim.lsp.util.incoming_calls()<CR>',        opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g}', '<cmd>lua vim.lsp.util.outgoing_calls()<CR>',        opts)
            end

            local servers = {
                'bashls',
                'clangd',
                'cssls',
                'dockerls',
                'elixirls',
                'elmls',
                'gopls',
                'html',
                'jsonls',
                'metals',
                'pyls',
                'rls',
                'rust_analyzer',
                'scry',
                'solargraph',
                'sumneko_lua',
                'terraformls',
                'tsserver',
                'vimls',
                'yamlls',
            }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                }
            end
EOF
        catch /^Vim(lua):E5108/
            echohl WarningMsg | echomsg 'Please run :PlugInstall to install `nvim-lspconfig` and `diagnostic-nvim` plugins!' | echohl None
        endtry
    endfunction

    call s:InitNvimLSP()

    " Shougo/neosnippet.vim: expand auto completed parameter and snippets
    " let g:neosnippet#enable_completed_snippet = 1
    " let g:neosnippet#enable_complete_done     = 1

    function! s:LspReload() abort
        lua vim.lsp.stop_client(vim.lsp.get_active_clients())
        edit
    endfunction

    command! LspReload call <SID>LspReload()
    command! LspInspect lua print(vim.inspect(vim.lsp.buf_get_clients(0)))
    command! LspInspectAll lua print(vim.inspect(vim.lsp.buf_get_clients()))

    " nvim-lua/diagnostic-nvim
    let g:space_before_virtual_text        = 1
    let g:diagnostic_enable_virtual_text   = 1
    let g:diagnostic_virtual_text_prefix   = g:zero_vim_signs.virtual_text . ' '
    let g:diagnostic_enable_underline      = 1
    let g:diagnostic_auto_popup_while_jump = 0

    call sign_define('LspDiagnosticsErrorSign',       { 'text': g:zero_vim_signs.error,       'texthl': 'LspDiagnosticsError'       })
    call sign_define('LspDiagnosticsWarningSign',     { 'text': g:zero_vim_signs.warning,     'texthl': 'LspDiagnosticsWarning'     })
    call sign_define('LspDiagnosticsInformationSign', { 'text': g:zero_vim_signs.information, 'texthl': 'LspDiagnosticsInformation' })
    call sign_define('LspDiagnosticsHintSign',        { 'text': g:zero_vim_signs.hint,        'texthl': 'LspDiagnosticsHint'        })
endif

if s:IsPlugged('vim-lsp')
    " prabirshrestha/vim-lsp
    let g:lsp_async_completion = 1
    let g:lsp_fold_enabled     = 0

    let g:lsp_signs_error         = { 'text': g:zero_vim_signs.error }
    let g:lsp_signs_warning       = { 'text': g:zero_vim_signs.warning }
    let g:lsp_signs_information   = { 'text': g:zero_vim_signs.information }
    let g:lsp_signs_hint          = { 'text': g:zero_vim_signs.hint }
    let g:lsp_virtual_text_prefix = g:zero_vim_signs.virtual_text

    let g:lsp_diagnostics_enabled          = g:zero_vim_lsp_diagnostics
    let g:lsp_diagnostics_echo_cursor      = g:zero_vim_lsp_diagnostics " echo under cursor when in normal mode
    let g:lsp_highlight_references_enabled = g:zero_vim_lsp_highlight_references

    " Shougo/neosnippet.vim: expand auto completed parameter and snippets
    " let g:neosnippet#enable_completed_snippet = 1
    " let g:neosnippet#enable_complete_done     = 1

    function! s:OnLspBufferEnabled() abort
        setlocal omnifunc=lsp#complete

        " setlocal foldmethod=expr
        " setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
        " setlocal foldtext=lsp#ui#vim#folding#foldtext()

        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

        " Use `[g` and `]g` to navigate diagnostics
        nmap <buffer> <silent> [g <Plug>(lsp-previous-diagnostic)
        nmap <buffer> <silent> ]g <Plug>(lsp-next-diagnostic)
        nmap <buffer> <silent> [k  <Plug>(lsp-previous-error)
        nmap <buffer> <silent> ]k  <Plug>(lsp-next-error)

        " Use `[r` and `]r` to navigate references
        nmap <buffer> <silent> [r <Plug>(lsp-previous-reference)
        nmap <buffer> <silent> ]r <Plug>(lsp-next-reference)

        nmap <buffer> <silent> H  <Plug>(lsp-hover)
        nmap <buffer> <silent> gA <Plug>(lsp-code-action)
        nmap <buffer> <silent> M  <Plug>(lsp-rename)
        nmap <buffer> <silent> gF <Plug>(lsp-document-format)
        vmap <buffer> <silent> gF <Plug>(lsp-document-format)
        nmap <buffer> <silent> gK <Plug>(lsp-document-range-format)
        xmap <buffer> <silent> gK <Plug>(lsp-document-range-format)
        nmap <buffer> <silent> gD <Plug>(lsp-declaration)
        nmap <buffer> <silent> g[ <Plug>(lsp-definition)
        nmap <buffer> <silent> gy <Plug>(lsp-type-definition)
        nmap <buffer> <silent> gY <Plug>(lsp-type-hierarchy)
        nmap <buffer> <silent> gI <Plug>(lsp-implementation)
        nmap <buffer> <silent> L  <Plug>(lsp-document-diagnostics)
        nmap <buffer> <silent> go <Plug>(lsp-document-symbol)
        nmap <buffer> <silent> gO <Plug>(lsp-workspace-symbol)
        nmap <buffer> <silent> gr <Plug>(lsp-references)
        nmap <buffer> <silent> gm <Plug>(lsp-signature-help)
    endfunction

    augroup MyAutoCmd
        autocmd User lsp_buffer_enabled call <SID>OnLspBufferEnabled()
    augroup END

    if s:IsPlugged('vim-lsp-settings')
        " mattn/vim-lsp-settings
        let g:lsp_settings = {}

        function! s:SetupLanguageServers() abort
            for l:name in keys(g:language_servers)
                let g:lsp_settings[l:name] = { 'disabled': v:true }
            endfor

            for l:name in s:GetEnabledLanguageServers()
                let l:server = g:language_servers[l:name]

                let l:server_settings = {
                            \ 'disabled':  v:false,
                            \ 'cmd':       l:server['cmd'],
                            \ 'allowlist': l:server['filetypes'],
                            \ }

                if has_key(l:server, 'root_markers')
                    let l:server_settings['root_uri_patterns'] = l:server['root_markers']
                endif

                if has_key(l:server, 'initialization_options')
                    let l:server_settings['initialization_options'] = l:server['initialization_options']
                endif

                let g:lsp_settings[l:name] = l:server_settings
            endfor
        endfunction

        call s:SetupLanguageServers()
    endif
endif

if s:IsPlugged('vim-lsc')
    " natebosch/vim-lsc
    let g:lsc_complete_timeout     = 3 " Wait up to 3 seconds
    let g:lsc_enable_diagnostics   = g:zero_vim_lsp_diagnostics ? v:true : v:false
    let g:lsc_reference_highlights = g:zero_vim_lsp_highlight_references ? v:true : v:false
    let g:lsc_trace_level          = 'off'

    let g:lsc_server_commands = {}

    " Default server options
    let s:lsc_server_default_opts = {
                \ 'log_level':        -1,
                \ 'suppress_stderr':  v:true,
                \ 'workspace_config': {},
                \ }

    function! s:SetupLanguageServers() abort
        for l:name in s:GetEnabledLanguageServers()
            let l:server = g:language_servers[l:name]

            let l:default = get(s:, 'lsc_server_default_opts', {})

            let l:message_hooks = {}

            if has_key(l:server, 'initialization_options')
                let l:message_hooks['initialize'] = {
                            \ 'initializationOptions': l:server['initialization_options'],
                            \ }
            endif

            let l:server_settings = extend(copy(l:default), {
                        \ 'name':          l:name,
                        \ 'command':       l:server['cmd'],
                        \ 'message_hooks': l:message_hooks,
                        \ })

            for ft in l:server['filetypes']
                if !has_key(g:lsc_server_commands, ft)
                    let g:lsc_server_commands[ft] = l:server_settings
                endif
            endfor
        endfor
    endfunction

    call s:SetupLanguageServers()

    let g:lsc_auto_map = {
                \ 'GoToDefinition':      'g[',
                \ 'GoToDefinitionSplit': '<C-w>[',
                \ 'FindReferences':      'gr',
                \ 'NextReference':       '[r',
                \ 'PreviousReference':   ']r',
                \ 'FindImplementations': 'gI',
                \ 'FindCodeActions':     'gA',
                \ 'Rename':              'M',
                \ 'ShowHover':           'H',
                \ 'DocumentSymbol':      'go',
                \ 'WorkspaceSymbol':     'gO',
                \ 'SignatureHelp':       'gm',
                \ 'Completion':          'omnifunc',
                \ }

    function! s:PrintLSCServerStatus(...) abort
        let ft = get(a:, 1, &filetype)
        let servers = lsc#server#forFileType(ft)
        if empty(servers) | echo 'No Server!' | return | endif
        let server = servers[0]
        echo printf('%s: %s!', get(server, 'config', { 'name': 'Server' })['name'], server['status'])
    endfunction

    command! LSClientServerStatus call <SID>PrintLSCServerStatus()

    function! s:SetupLSC() abort
        nnoremap <buffer> <silent> L  :LSClientAllDiagnostics<CR>
        nnoremap <buffer> <silent> gL :LSClientWindowDiagnostics<CR>
    endfunction

    augroup MyAutoCmd
        execute printf('autocmd FileType %s call <SID>SetupLSC()', join(keys(g:lsc_server_commands), ','))
    augroup END
endif

if s:IsPlugged('LanguageClient-neovim')
    " autozimu/LanguageClient-neovim
    let g:LanguageClient_serverCommands     = {}
    let g:LanguageClient_diagnosticsList    = 'Location'
    let g:LanguageClient_diagnosticsEnable  = g:zero_vim_lsp_diagnostics
    let g:LanguageClient_virtualTextPrefix  = g:zero_vim_signs.virtual_text . ' '
    let g:LanguageClient_diagnosticsDisplay = {
                \ 1: { 'signText': g:zero_vim_signs.error },
                \ 2: { 'signText': g:zero_vim_signs.warning },
                \ 3: { 'signText': g:zero_vim_signs.information },
                \ 4: { 'signText': g:zero_vim_signs.hint },
                \ }

    " Shougo/neosnippet.vim: expand auto completed parameter
    " let g:neosnippet#enable_complete_done = 1

    function! s:SetupLanguageServers() abort
        for l:name in s:GetEnabledLanguageServers()
            let l:server = g:language_servers[l:name]

            for ft in l:server['filetypes']
                if !has_key(g:LanguageClient_serverCommands, ft)
                    let g:LanguageClient_serverCommands[ft] = l:server['cmd']
                endif
            endfor
        endfor
    endfunction

    call s:SetupLanguageServers()

    command! LanguageClientServerStatusMessage echo LanguageClient_serverStatusMessage()

    vnoremap <Plug>(lcn-format)            :<C-u>call LanguageClient_textDocument_rangeFormatting()<CR>
    nnoremap <Plug>(lcn-workspace-symbols) :<C-u>call LanguageClient_workspace_symbol()<CR>
    nnoremap <Plug>(lcn-clear-highlight)   :<C-u>call LanguageClient_clearDocumentHighlight()<CR>

    function! s:SetupLanguageClient() abort
        setlocal omnifunc=LanguageClient#complete

        nmap <buffer> <silent> [g <Plug>(lcn-diagnostics-prev)
        nmap <buffer> <silent> ]g <Plug>(lcn-diagnostics-next)

        nmap <buffer> <silent> H  <Plug>(lcn-hover)
        nmap <buffer>          gM <Plug>(lcn-menu)
        nmap <buffer> <silent> gA <Plug>(lcn-code-action)
        vmap <buffer> <silent> gA <Plug>(lcn-code-action)
        nmap <buffer> <silent> gC <Plug>(lcn-code-lens-action)
        nmap <buffer> <silent> M  <Plug>(lcn-rename)
        nmap <buffer> <silent> gF <Plug>(lcn-format)
        vmap <buffer> <silent> gF <Plug>(lcn-format)
        nmap <buffer> <silent> g[ <Plug>(lcn-definition)
        nmap <buffer> <silent> gy <Plug>(lcn-type-definition)
        nmap <buffer> <silent> gI <Plug>(lcn-implementation)
        nmap <buffer> <silent> gr <Plug>(lcn-references)
        nmap <buffer> <silent> go <Plug>(lcn-symbols)
        nmap <buffer> <silent> gO <Plug>(lcn-workspace-symbols)
        nmap <buffer> <silent> sh <Plug>(lcn-highlight)
        nmap <buffer> <silent> sH <Plug>(lcn-clear-highlight)
        nmap <buffer> <silent> se <Plug>(lcn-explain-error)
    endfunction

    augroup MyAutoCmd
        autocmd User LanguageClientStarted call <SID>SetupLanguageClient()
    augroup END
endif

if s:IsPlugged('vim-lamp')
    " hrsh7th/vim-lamp
    " Initialize Servers
    function! s:OnInitializedLamp() abort
        " call lamp#config('global.debug',               expand("$HOME/.cache/lamp.log"))
        call lamp#config('global.timeout',             3000)
        call lamp#config('view.sign.error.text',       g:zero_vim_signs.error)
        call lamp#config('view.sign.warning.text',     g:zero_vim_signs.warning)
        call lamp#config('view.sign.information.text', g:zero_vim_signs.information)
        call lamp#config('view.sign.hint.text',        g:zero_vim_signs.hint)

        " built-in setting
        call lamp#builtin#pyls()
        call lamp#builtin#gopls()
        call lamp#builtin#rls()
        call lamp#builtin#yaml_language_server()
        call lamp#builtin#html_languageserver()
        call lamp#builtin#css_languageserver()
        call lamp#builtin#json_languageserver()
        call lamp#builtin#typescript_language_server()
        call lamp#builtin#vim_language_server()

        let l:lamp_disabled_language_servers = [
                    \ 'pyls',
                    \ 'gopls',
                    \ 'rls',
                    \ 'yaml-language-server',
                    \ 'html-languageserver',
                    \ 'css-languageserver',
                    \ 'json-languageserver',
                    \ 'typescript-language-server',
                    \ 'vim-language-server',
                    \ ]

        " Add some language servers
        for l:name in s:GetEnabledLanguageServers()
            if index(l:lamp_disabled_language_servers, l:name) > -1
                continue
            endif

            let l:server = g:language_servers[l:name]

            let l:lamp_server = {
                        \ 'command':   l:server['cmd'],
                        \ 'filetypes': l:server['filetypes'],
                        \ }

            if has_key(l:server, 'root_markers')
                let l:root_markers = copy(l:server['root_markers'])
                call add(l:root_markers, '.git')
                let l:lamp_server['root_uri'] = { bufnr -> lamp#findup(l:root_markers, bufname(bufnr)) }
            endif

            call lamp#register(l:name, l:lamp_server)
        endfor
    endfunction

    " Initialize Buffers
    function! s:OnTextDocumentDidOpen() abort
        setlocal omnifunc=lamp#complete

        nnoremap <buffer> <silent> [g :<C-u>LampDiagnosticsPrev<CR>
        nnoremap <buffer> <silent> ]g :<C-u>LampDiagnosticsNext<CR>

        nnoremap <buffer> <silent> H       :<C-u>LampHover<CR>
        nnoremap <buffer> <silent> gA      :<C-u>LampCodeAction<CR>
        vnoremap <buffer> <silent> gA      :LampCodeAction<CR>
        nnoremap <buffer> <silent> M       :<C-u>LampRename<CR>
        nnoremap <buffer> <silent> gF      :<C-u>LampFormatting<CR>
        vnoremap <buffer> <silent> gF      :LampRangeFormatting<CR>
        nnoremap <buffer> <silent> gD      :<C-u>LampDeclaration edit<CR>
        nnoremap <buffer> <silent> <C-w>gD :<C-u>LampDeclaration vsplit<CR>
        nnoremap <buffer> <silent> g[      :<C-u>LampDefinition edit<CR>
        nnoremap <buffer> <silent> <C-w>g[ :<C-u>LampDefinition vsplit<CR>
        nnoremap <buffer> <silent> gy      :<C-u>LampTypeDefinition edit<CR>
        nnoremap <buffer> <silent> <C-w>gy :<C-u>LampTypeDefinition vsplit<CR>
        nnoremap <buffer> <silent> gI      :<C-u>LampImplementation edit<CR>
        nnoremap <buffer> <silent> <C-w>gI :<C-u>LampImplementation vsplit<CR>
        nnoremap <buffer> <silent> gr      :<C-u>LampReferences<CR>
        nnoremap <buffer> <silent> sh      :<C-u>LampDocumentHighlight<CR>
        nnoremap <buffer> <silent> sH      :<C-u>LampDocumentHighlightClear<CR>
        nnoremap <buffer> <silent> s+      :<C-u>LampSelectionRangeExpand<CR>
        nnoremap <buffer> <silent> s_      :<C-u>LampSelectionRangeCollapse<CR>
        vnoremap <buffer> <silent> s+      :<C-u>LampSelectionRangeExpand<CR>
        vnoremap <buffer> <silent> s_      :<C-u>LampSelectionRangeCollapse<CR>
    endfunction

    augroup MyAutoCmd
        autocmd User lamp#initialized call <SID>OnInitializedLamp()
        autocmd User lamp#text_document_did_open call <SID>OnTextDocumentDidOpen()
    augroup END
endif

if s:IsPlugged('vim-vsnip')
    " hrsh7th/vim-vsnip
    let g:vsnip_snippet_dirs = ['~/.vim/vsnip']

    imap <expr> <C-\> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-\>"
    smap <expr> <C-\> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-\>"

    if !s:IsPlugged('ultisnips') && !s:IsPlugged('neosnippet.vim')
        imap <expr> <C-k> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-k>"
        smap <expr> <C-k> vsnip#available(1) ? "\<Plug>(vsnip-expand-or-jump)" : "\<C-k>"
        imap <expr> <C-j> vsnip#jumpable(1)  ? "\<Plug>(vsnip-jump-next)"      : "\<C-j>"
        smap <expr> <C-j> vsnip#jumpable(1)  ? "\<Plug>(vsnip-jump-next)"      : "\<C-j>"
        imap <expr> <C-z> vsnip#jumpable(-1) ? "\<Plug>(vsnip-jump-prev)"      : "\<C-z>"
        smap <expr> <C-z> vsnip#jumpable(-1) ? "\<Plug>(vsnip-jump-prev)"      : "\<C-z>"
    endif
endif

if s:IsPlugged('completion-nvim')
    " nvim-lua/completion-nvim
    let g:completion_enable_auto_popup      = 1
    let g:completion_timer_cycle            = 100
    let g:completion_confirm_key            = "\<C-y>"
    let g:completion_enable_auto_paren      = 0
    let g:completion_trigger_on_delete      = 1
    let g:completion_auto_change_source     = 1
    let g:completion_matching_strategy_list = ['exact', 'fuzzy']
    let g:completion_sorting                = 'none'

    if s:IsPlugged('ultisnips')
        let g:completion_enable_snippet = 'UltiSnips'
    elseif s:IsPlugged('neosnippet.vim')
        let g:completion_enable_snippet = 'Neosnippet'
    endif

    let g:completion_chain_complete_list = {
                \ 'default': [
                \   { 'complete_items': ['lsp', 'snippet', 'vim-vsnip'] },
                \   { 'complete_items': (s:IsPlugged('completion-treesitter') ? ['ts'] : []) + ['tags', 'buffers'] },
                \   { 'mode': '<c-p>' },
                \   { 'mode': '<c-n>' },
                \ ]
                \ }

    " steelsojka/completion-buffers
    let g:completion_word_min_length = 1

    " A list of filetypes that should be ignored from caching/gathering words.
    let g:completion_word_ignored_ft = []

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

        return "\<Plug>(completion_trigger)"
    endfunction

    imap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " " <Tab>: smart completion
    " imap <Tab> <Plug>(completion_smart_tab)
    " " <S-Tab>: smart completion
    " imap <S-Tab> <Plug>(completion_smart_s_tab)

    " <CR>: close popup and insert newline (works with auto-pairs)
    function! s:CleverCR() abort
        if pumvisible()
            if complete_info()['selected'] != '-1'
                return "\<Plug>(completion_confirm_completion)"
            endif

            return "\<C-e>\<CR>"
        endif

        return "\<CR>"
    endfunction

    imap <expr> <CR> <SID>CleverCR()

    " Switch to previous completion
    imap <silent> <C-x><C-h> <Plug>(completion_prev_source)
    " Switch to next completion
    imap <silent> <C-x><C-j> <Plug>(completion_next_source)
    " Trigger completion manually
    imap <silent> <C-x><C-x> <Plug>(completion_trigger)

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        let b:completion_enable            = 0
        let g:completion_enable_auto_popup = 0
    endfunction

    function! Enable_Completion_Hook() abort
        let b:completion_enable            = 1
        let g:completion_enable_auto_popup = 1
    endfunction

    let g:completion_disable_filetypes = [
                \ 'nerdtree',
                \ 'fern',
                \ 'vaffle',
                \ 'startify',
                \ 'tagbar',
                \ 'vista',
                \ 'vim-plug',
                \ 'terminal',
                \ 'help',
                \ 'qf',
                \ 'godoc',
                \ 'gitcommit',
                \ 'fugitiveblame',
                \ 'ctrlp',
                \ 'leaderf',
                \ 'clap_input',
                \ ]

    function! s:InitCompletionNvim()
        if index(g:completion_disable_filetypes, &filetype) > -1
            return
        endif
        try
            lua require'completion'.on_attach()
        catch /^Vim(lua):E5108/
            echohl WarningMsg | echomsg 'Please run :PlugInstall to install `completion-nvim` plugin!' | echohl None
        endtry
    endfunction

    augroup MyAutoCmd
        " Use completion-nvim in every buffer
        autocmd BufEnter * call <SID>InitCompletionNvim()
    augroup end
endif

if s:IsPlugged('deoplete.nvim')
    " Shougo/deoplete.nvim
    let g:deoplete#enable_at_startup = 1

    call deoplete#custom#option({
                \ 'auto_complete':       v:true,
                \ 'auto_complete_delay': 50,
                \ 'refresh_always':      v:true,
                \ 'camel_case':          v:true,
                \ 'skip_multibyte':      v:true,
                \ 'auto_preview':        v:true,
                \ })

    " Ignore sources
    call deoplete#custom#option('ignore_sources', {
                \ '_': ['ale', 'dictionary', 'syntax', 'tag'],
                \ })

    call deoplete#custom#option('keyword_patterns', {
                \ '_': '[a-zA-Z_]\k*\(?',
                \ })

    call deoplete#custom#option('omni_patterns', {
                \ 'go': '[^. *\t]\.\w*',
                \ })

    call deoplete#custom#source('_', 'converters', [
                \ 'converter_remove_overlap',
                \ 'converter_case',
                \ 'converter_truncate_abbr',
                \ 'converter_truncate_info',
                \ 'converter_truncate_menu',
                \ ])

    call deoplete#custom#source('_', 'matchers', [
                \ 'matcher_fuzzy',
                \ ])

    " Shougo/deoplete-lsp
    " lighttiger2505/deoplete-vim-lsp
    call deoplete#custom#source('lsp', {
                \ 'rank':               500,
                \ 'min_pattern_length': 1,
                \ 'sorters':            [],
                \ })

    " hrsh7th/deoplete-vim-lsc
    call deoplete#custom#source('lsc', {
                \ 'is_volatile':        v:true,
                \ 'rank':               500,
                \ 'min_pattern_length': 1,
                \ 'sorters':            [],
                \ })

    " autozimu/LanguageClient-neovim
    call deoplete#custom#source('LanguageClient', {
                \ 'rank':               500,
                \ 'min_pattern_length': 1,
                \ 'sorters':            [],
                \ })

    " hrsh7th/deoplete-lamp
    call deoplete#custom#source('lamp', {
                \ 'rank':    500,
                \ 'mark':    '[lamp]',
                \ 'sorters': [],
                \ })

    " hrsh7th/vim-vsnip-integ
    call deoplete#custom#source('vsnip', {
                \ 'rank':               250,
                \ 'mark':               '',
                \ 'min_pattern_length': 1,
                \ 'sorters':            ['sorter_word'],
                \ })

    " SirVer/ultisnips
    call deoplete#custom#source('ultisnips', {
                \ 'rank':               200,
                \ 'mark':               '[U]',
                \ 'min_pattern_length': 1,
                \ 'sorters':            ['sorter_word'],
                \ })

    " Shougo/neosnippet.vim
    call deoplete#custom#source('neosnippet', {
                \ 'rank':               200,
                \ 'mark':               '[N]',
                \ 'min_pattern_length': 1,
                \ 'sorters':            ['sorter_word'],
                \ })

    call deoplete#custom#source('omni', {
                \ 'is_volatile': v:true,
                \ 'rank':        500,
                \ })

    call deoplete#custom#source('around', {
                \ 'rank': 180,
                \ })

    " CTRL-E: Cancel popup
    inoremap <expr> <C-e> deoplete#cancel_popup()

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
    inoremap <silent> <expr> <C-x><C-f> deoplete#manual_complete('file')
    inoremap          <expr> <C-x><C-x> deoplete#manual_complete()

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        call deoplete#custom#buffer_option('auto_complete', v:false)
    endfunction

    function! Enable_Completion_Hook() abort
        call deoplete#custom#buffer_option('auto_complete', v:true)
    endfunction
endif

if s:IsPlugged('coc.nvim')
    " neoclide/coc.nvim
    " https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
    " https://github.com/neoclide/coc.nvim/wiki/Language-servers
    let g:coc_global_extensions = [
                \ 'coc-json',
                \ 'coc-tsserver',
                \ 'coc-html',
                \ 'coc-xml',
                \ 'coc-css',
                \ 'coc-markdownlint',
                \ 'coc-eslint',
                \ 'coc-clangd',
                \ 'coc-python',
                \ 'coc-pyright',
                \ 'coc-jedi',
                \ 'coc-go',
                \ 'coc-rls',
                \ 'coc-rust-analyzer',
                \ 'coc-elixir',
                \ 'coc-erlang_ls',
                \ 'coc-metals',
                \ 'coc-solargraph',
                \ 'coc-yaml',
                \ 'coc-sh',
                \ 'coc-vimlsp',
                \ ]

    if s:IsPlugged('ultisnips')
        call add(g:coc_global_extensions, 'coc-ultisnips')
    elseif s:IsPlugged('neosnippet.vim')
        call add(g:coc_global_extensions, 'coc-neosnippet')
    endif

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

    " Use <CR> for confirm completion,
    " `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Overwrite <C-x><C-u>
    imap <silent> <C-x><C-u> <Plug>(coc-complete-custom)

    " Use <C-x><C-x> to trigger completion.
    inoremap <silent> <expr> <C-x><C-x> coc#refresh()

    nnoremap <silent> <Plug>(coc-hover)       :<C-u>call CocAction('doHover')<CR>
    nnoremap <silent> <Plug>(coc-hover-async) :<C-u>call CocActionAsync('doHover')<CR>

    " Use `[g` and `]g` to navigate diagnostics
    nmap [g <Plug>(coc-diagnostic-prev)
    nmap ]g <Plug>(coc-diagnostic-next)
    nmap [k <Plug>(coc-diagnostic-prev-error)
    nmap ]k <Plug>(coc-diagnostic-next-error)

    nmap H  <Plug>(coc-hover)
    nmap gA <Plug>(coc-codeaction)
    vmap gA <Plug>(coc-codeaction-selected)
    nmap M  <Plug>(coc-rename)
    nmap gF <Plug>(coc-format)
    vmap gF <Plug>(coc-format-selected)
    nmap L  <Plug>(coc-diagnostic-info)
    nmap gD <Plug>(coc-declaration)
    nmap g[ <Plug>(coc-definition)
    nmap gI <Plug>(coc-implementation)
    nmap gy <Plug>(coc-type-definition)
    nmap gr <Plug>(coc-references)
    nmap so <Plug>(coc-openlink)
    nmap sc <Plug>(coc-fix-current)
    nmap sr <Plug>(coc-refactor)

    xmap ik <Plug>(coc-funcobj-i)
    xmap ak <Plug>(coc-funcobj-a)
    omap ik <Plug>(coc-funcobj-i)
    omap ak <Plug>(coc-funcobj-a)

    augroup MyAutoCmd
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup END

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        let b:coc_suggest_disable = 1
    endfunction

    function! Enable_Completion_Hook() abort
        let b:coc_suggest_disable = 0
    endfunction
endif

if s:IsPlugged('YouCompleteMe')
    " ycm-core/YouCompleteMe
    let g:ycm_auto_trigger                        = 1
    let g:ycm_disable_signature_help              = 1
    let g:ycm_always_populate_location_list       = 1
    let g:ycm_confirm_extra_conf                  = 0
    let g:ycm_complete_in_comments                = 1
    let g:ycm_complete_in_strings                 = 1
    let g:ycm_collect_identifiers_from_tags_files = 0
    let g:ycm_use_ultisnips_completer             = s:IsPlugged('ultisnips')
    let g:ycm_extra_conf_vim_data                 = ['&filetype']
    let g:ycm_global_ycm_extra_conf               = filereadable(expand('~/.ycm_extra_conf.py')) ? expand('~/.ycm_extra_conf') : ''
    let g:ycm_filetype_blacklist                  = {
                \ 'ctrlp':    1,
                \ 'tagbar':   1,
                \ 'qf':       1,
                \ 'nerdtree': 1,
                \ 'fern':     1,
                \ 'vaffle':   1,
                \ 'notes':    1,
                \ 'markdown': 1,
                \ 'netrw':    1,
                \ 'unite':    1,
                \ 'text':     1,
                \ 'vimwiki':  1,
                \ 'pandoc':   1,
                \ 'infolog':  1,
                \ 'leaderf':  1,
                \ 'mail':     1,
                \ }

    let g:ycm_error_symbol   = g:zero_vim_signs.error
    let g:ycm_warning_symbol = g:zero_vim_signs.warning

    let g:ycm_key_detailed_diagnostics = 'L'
    let g:ycm_key_invoke_completion    = '<C-x><C-x>'

    " <CR>: close popup and insert newline
    inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

    if executable('clangd')
        let g:ycm_use_clangd         = 1
        let g:ycm_clangd_binary_path = exepath('clangd')
        let g:ycm_clangd_args        = []
    endif

    if executable('gopls')
        let g:ycm_gopls_binary_path = exepath('gopls')
        let g:ycm_gopls_args        = []
    endif

    if executable('rls')
        let g:ycm_rls_binary_path = exepath('rls')
    endif

    if executable('rustc')
        let g:ycm_rustc_binary_path = exepath('rustc')
    endif

    if executable('tsserver')
        let g:ycm_tsserver_binary_path = exepath('tsserver')
    endif

    if !s:IsLSPEnabled()
        let g:ycm_language_server = []

        function! s:SetupYcmLanguageServers() abort
            let l:ycm_disabled_language_servers = [
                        \ 'clangd',
                        \ 'ccls',
                        \ 'gopls',
                        \ 'rls',
                        \ 'rust-analyzer',
                        \ 'typescript-language-server',
                        \ ]

            for l:name in s:GetEnabledLanguageServers()
                if index(l:ycm_disabled_language_servers, l:name) > -1
                    continue
                endif

                let l:server = g:language_servers[l:name]

                let l:ycm_server = {
                            \ 'name':      l:name,
                            \ 'cmdline':   l:server['cmd'],
                            \ 'filetypes': l:server['filetypes'],
                            \ }

                if has_key(l:server, 'root_markers')
                    let l:ycm_server['project_root_files'] = l:server['root_markers']
                endif

                call add(g:ycm_language_server, l:ycm_server)
            endfor
        endfunction

        call s:SetupYcmLanguageServers()
    endif

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        let g:ycm_auto_trigger = 0
    endfunction

    function! Enable_Completion_Hook() abort
        let g:ycm_auto_trigger = 1
    endfunction
endif

if s:IsPlugged('asyncomplete.vim')
    " prabirshrestha/asyncomplete.vim
    let g:asyncomplete_auto_popup  = 1
    let g:asyncomplete_popup_delay = 50

    " Show autocomplete popup manually
    imap <C-x><C-x> <Plug>(asyncomplete_force_refresh)

    " <CR>: close popup and insert newline
    inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup()."\<CR>" : "\<CR>"

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

    imap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " <C-y>: close popup
    inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"

    " <C-e>: cancel popup
    inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"

    function! s:SetupAsyncomplete() abort
        " prabirshrestha/asyncomplete-buffer.vim
        call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                    \ 'name':      'buffer',
                    \ 'allowlist': ['*'],
                    \ 'blocklist': ['go'],
                    \ 'completor': function('asyncomplete#sources#buffer#completor'),
                    \ }))

        " prabirshrestha/asyncomplete-file.vim
        call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                    \ 'name':      'file',
                    \ 'allowlist': ['*'],
                    \ 'priority':  10,
                    \ 'completor': function('asyncomplete#sources#file#completor'),
                    \ }))

        " yami-beta/asyncomplete-omni.vim
        call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name':      'omni',
                    \ 'allowlist': ['*'],
                    \ 'blocklist': ['c', 'cpp', 'html', 'css', 'ruby'],
                    \ 'completor': function('asyncomplete#sources#omni#completor'),
                    \ }))

        if s:IsPlugged('asyncomplete-ultisnips.vim')
            " prabirshrestha/asyncomplete-ultisnips.vim
            call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                        \ 'name':      'ultisnips',
                        \ 'allowlist': ['*'],
                        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                        \ }))
        endif

        if s:IsPlugged('asyncomplete-neosnippet.vim')
            " prabirshrestha/asyncomplete-neosnippet.vim
            call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
                        \ 'name':      'neosnippet',
                        \ 'allowlist': ['*'],
                        \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
                        \ }))
        endif
    endfunction

    augroup MyAutoCmd
        autocmd User asyncomplete_setup call s:SetupAsyncomplete()
    augroup END

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        let b:asyncomplete_enable     = 0
        let g:asyncomplete_auto_popup = 0
    endfunction

    function! Enable_Completion_Hook() abort
        let b:asyncomplete_enable     = 1
        let g:asyncomplete_auto_popup = 1
    endfunction
endif

if s:IsPlugged('ncm2')
    " ncm2/ncm2
    let g:ncm2#auto_popup      = 1
    let g:ncm2#popup_delay     = 50
    let g:ncm2#complete_length = [ [1, 3], [7, 1] ]

    " Enable Autocomplete for all buffers
    augroup MyAutoCmd
        autocmd BufEnter * call ncm2#enable_for_buffer()
    augroup END

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    " inoremap <C-c> <ESC>

    " Trigger complete manually
    imap <C-x><C-x> <Plug>(ncm2_manual_trigger)

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

        return "\<C-r>=ncm2#manual_trigger()\<CR>"
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        let b:ncm2_enable = 0
        call ncm2#lock('vim-visual-multi')
    endfunction

    function! Enable_Completion_Hook() abort
        let b:ncm2_enable = 1
        call ncm2#unlock('vim-visual-multi')
    endfunction
endif

if s:IsPlugged('completor.vim')
    " maralla/completor.vim
    let g:completor_auto_trigger     = 1
    let g:completor_completion_delay = 50
    let g:completor_complete_options = 'menuone,noinsert,noselect'
    let g:completor_auto_close_doc   = 1

    if s:IsPlugged('completor-neosnippet')
        let g:completor_disable_ultisnips = 1
    endif

    " Trigger complete manually
    inoremap <silent> <expr> <C-x><C-x> "<C-r>=completor#do('complete')<CR>"

    " <CR>: close popup and insert newline
    inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

    " <Tab>: completion
    function! s:CleverTab() abort
        if pumvisible()
            return "\<C-n>"
        elseif col('.') > 1 && strpart(getline('.'), col('.') - 2, 3) =~ '^[[:keyword:][:ident:]]'
            return "\<C-r>=completor#do('complete')\<CR>"
        else
            return "\<Tab>"
        endif
    endfunction

    inoremap <silent> <expr> <Tab> <SID>CleverTab()

    " <S-Tab>: completion back
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

    if !s:IsLSPEnabled()
        " Enable LSP
        let g:completor_filetype_map = {}

        function! s:SetupCompletorLanguageServers() abort
            for l:name in s:GetEnabledLanguageServers()
                let l:server = g:language_servers[l:name]

                let l:opts = { 'ft': 'lsp', 'cmd': join(l:server['cmd'], ' ') }

                for ft in l:server['filetypes']
                    if !has_key(g:completor_filetype_map, ft)
                        let g:completor_filetype_map[ft] = l:opts
                    endif
                endfor
            endfor
        endfunction

        call s:SetupCompletorLanguageServers()

        command! CompletorHover      call completor#do('hover')
        command! CompletorDoc        call completor#do('doc')
        command! CompletorDefinition call completor#do('definition')
        command! CompletorFormat     call completor#do('format')
    endif

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        silent! CompletorDisable
    endfunction

    function! Enable_Completion_Hook() abort
        silent! CompletorEnable
    endfunction
endif

if s:IsPlugged('vim-mucomplete')
    " lifepillar/vim-mucomplete
    let g:mucomplete#enable_auto_at_startup = 1
    let g:mucomplete#completion_delay       = 50
    let g:mucomplete#reopen_immediately     = 0
    let g:mucomplete#minimum_prefix_length  = 1

    " prabirshrestha/vim-lsp: disable async completion
    let g:lsp_async_completion = 0

    function! s:SetupMUCompleteDefaultChains() abort
        let l:chains = ['omni']

        if s:IsPlugged('vim-vsnip')
            call add(l:chains, 'vsnip')
        endif

        if s:IsPlugged('ultisnips')
            call add(l:chains, 'ulti')
        elseif s:IsPlugged('neosnippet.vim')
            call add(l:chains, 'nsnp')
        endif

        call extend(l:chains, ['c-p', 'path'])

        return l:chains
    endfunction

    let g:mucomplete#chains = {
                \ 'default': s:SetupMUCompleteDefaultChains(),
                \ }

    " Cancel the current menu and try completing the text I originally typed in a different way
    inoremap <silent> <Plug>(MUcompleteBwdKey) <C-h>
    imap <unique> <silent> <C-x><C-h> <Plug>(MUcompleteCycBwd)

    inoremap <silent> <Plug>(MUcompleteFwdKey) <C-j>
    imap <unique> <silent> <C-x><C-j> <plug>(MUcompleteCycFwd)

    " <CR>: close popup and insert newline
    inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

    " if !has('patch-8.0.0283')
    "     imap <expr> <CR> pumvisible() ? "\<C-y>\<Plug>(MUcompleteCR)" : "\<Plug>(MUcompleteCR)"
    " endif

    " Integrate with vim-visual-multi / vim-multiple-cursors plugin
    function! Disable_Completion_Hook() abort
        silent! MUcompleteAutoOff
    endfunction

    function! Enable_Completion_Hook() abort
        silent! MUcompleteAutoOn
    endfunction
endif

if s:IsPlugged('VimCompletesMe')
    " ajh17/VimCompletesMe
    " Disable vim-lsp's async completion
    let g:lsp_async_completion = 0
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
    let g:goyo_width  = '70%'
    let g:goyo_height = '85%'
    let g:goyo_linenr = 0

    let s:goyo_current_mode = 0
    let s:goyo_modes        = [
                \ [ g:goyo_width, g:goyo_height ],
                \ [ '120', g:goyo_height ],
                \ [ '100', g:goyo_height ],
                \ [ '80', g:goyo_height ],
                \ ]

    function! s:CycleGoyoMode(direction) abort
        if exists('#goyo')
            let s:goyo_current_mode += a:direction
            if s:goyo_current_mode >= len(s:goyo_modes)
                let s:goyo_current_mode = 0
            elseif s:goyo_current_mode < 0
                let s:goyo_current_mode = len(s:goyo_modes) - 1
            endif
        else
            let s:goyo_current_mode = a:direction == 1 ? 0 : len(s:goyo_modes) - 1
        endif
        let l:goyo_mode = s:goyo_modes[s:goyo_current_mode]
        let g:goyo_width = l:goyo_mode[0]
        let g:goyo_height = l:goyo_mode[1]
        execute 'Goyo ' join(l:goyo_mode, 'x')
    endfunction

    function! s:RefreshGoyoMode(bang) abort
        if exists('#goyo')
            if a:bang
                silent! cclose | lclose | helpclose
            endif
            execute 'Goyo ' join([ g:goyo_width, g:goyo_height ], 'x')
        endif
    endfunction

    command! -bar NextGoyoMode call <SID>CycleGoyoMode(1)
    command! -bar PrevGoyoMode call <SID>CycleGoyoMode(-1)
    command! -bar -bang RefreshGoyoMode call <SID>RefreshGoyoMode(<bang>0)

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

    function! s:GoyoHooksOnQuickFix()
        nnoremap <silent> <buffer> q          :close<CR>:RefreshGoyoMode<CR>
        nmap     <silent> <buffer> <C-w>c     <C-w>c:RefreshGoyoMode<CR>
        nmap     <silent> <buffer> <C-w><C-c> <C-w><C-c>:RefreshGoyoMode<CR>
        nmap     <silent> <buffer> <C-w>q     <C-w>q:RefreshGoyoMode<CR>
    endfunction

    augroup MyAutoCmd
        autocmd! User GoyoEnter nested call <SID>OnGoyoEnter()
        autocmd! User GoyoLeave nested call <SID>OnGoyoLeave()
        autocmd FileType qf call <SID>GoyoHooksOnQuickFix()
        autocmd VimResized * RefreshGoyoMode
    augroup END

    nnoremap <silent> <Leader><Enter> :Goyo<CR>
    vmap              <Leader><Enter> <Esc><Leader><Enter>gv

    nnoremap <silent> ]<Enter> :NextGoyoMode<CR>
    vmap              ]<Enter> <Esc>]<Enter>gv

    nnoremap <silent> [<Enter> :PrevGoyoMode<CR>
    vmap              [<Enter> <Esc>[<Enter>gv

    nnoremap <silent> <Leader>bz :RefreshGoyoMode!<CR>
    vmap              <Leader>bz <Esc><Leader>bzgv
endif

if s:IsPlugged('limelight.vim')
    " junegunn/limelight.vim
    let g:limelight_conceal_ctermfg     = 240
    let g:limelight_conceal_guifg       = '#777777'
    let g:limelight_default_coefficient = 0.75
    let g:limelight_priority            = -1

    nnoremap <silent> <Leader>I :Limelight!!<CR>
    vmap              <Leader>I <Esc><Leader>Igv
    nmap              <Leader>i <Plug>(Limelight)
    xmap              <Leader>i <Plug>(Limelight)
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

    let g:ale_sign_error         = g:zero_vim_signs.error
    let g:ale_sign_warning       = g:zero_vim_signs.warning
    let g:ale_sign_style_error   = g:zero_vim_signs.style_error
    let g:ale_sign_style_warning = g:zero_vim_signs.style_warning
    let g:ale_sign_info          = g:zero_vim_signs.information

    let g:ale_linter_aliases = {
                \ 'jsx':            'javascript',
                \ 'javascript.jsx': 'javascript',
                \ }

    let g:ale_linters = {}
    let g:ale_fixers  = {
                \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                \ }

    function! s:AddAleProgram(dict, program, filetype) abort
        if executable(a:program)
            let filetypes = []
            if type(a:filetype) == type('')
                call add(filetypes, a:filetype)
            elseif type(a:filetype) == type([])
                call extend(filetypes, a:filetype)
            endif
            for ft in filetypes
                let a:dict[ft] = get(a:dict, ft, [])
                call add(a:dict[ft], a:program)
            endfor
        endif
    endfunction

    function! s:AddAleFixer(fixer, filetype) abort
        call s:AddAleProgram(g:ale_fixers, a:fixer, a:filetype)
    endfunction

    function! s:AddAleLinter(linter, filetype) abort
        call s:AddAleProgram(g:ale_linters, a:linter, a:filetype)
    endfunction

    call s:AddAleLinter('eslint', ['javascript', 'typescript'])
    call s:AddAleLinter('standardrb', 'ruby')
    call s:AddAleLinter('rubocop', 'ruby')
    call s:AddAleLinter('elixir-ls', 'elixir')
    call s:AddAleLinter('credo', 'elixir')
    call s:AddAleLinter('yamllint', 'yaml')
    call s:AddAleLinter('flake8', 'python')
    call s:AddAleLinter('pylint', 'python')

    call s:AddAleFixer('prettier', [
                \ 'html',
                \ 'css',
                \ 'scss',
                \ 'markdown',
                \ 'json',
                \ 'javascript',
                \ 'typescript',
                \ 'graphql',
                \ 'yaml'
                \ ])
    call s:AddAleFixer('shfmt', [
                \ 'sh',
                \ 'bash'
                \ ])
    call s:AddAleFixer('standardrb', 'ruby')
    call s:AddAleFixer('black', 'python')
    call s:AddAleFixer('gofmt', 'go')
    call s:AddAleFixer('rustfmt', 'rust')
    call s:AddAleFixer('mix_format', 'elixir')
    call s:AddAleFixer('refmt', 'reason')

    " Don't auto-format files inside `node_modules`, minified files and jquery
    let g:ale_pattern_options_enabled = 1
    let g:ale_pattern_options = {
                \ '\.min\.(js\|css)$': {
                \   'ale_linters': [],
                \   'ale_fixers': []
                \ },
                \ 'jquery.*': {
                \   'ale_linters': [],
                \   'ale_fixers': []
                \ },
                \ 'node_modules/.*': {
                \   'ale_linters': [],
                \   'ale_fixers': []
                \ },
                \ 'package.json': {
                \   'ale_fixers': g:ale_fixers['*']
                \ },
                \}

    nnoremap <silent> <Leader>bc :ALELint<CR>
    nnoremap <silent> <Leader>bC :ALEFix<CR>
endif

if s:IsPlugged('neomake')
    " neomake/neomake
    let g:neomake_open_list          = 2
    let g:neomake_list_height        = 5
    let g:neomake_echo_current_error = 1

    let g:neomake_error_sign   = { 'text': g:zero_vim_signs.error   }
    let g:neomake_warning_sign = { 'text': g:zero_vim_signs.warning }
    let g:neomake_info_sign    = { 'text': g:zero_vim_signs.info    }
    let g:neomake_message_sign = { 'text': g:zero_vim_signs.message }

    let g:neomake_virtualtext_prefix = g:zero_vim_signs.virtual_text . ' '

    if g:zero_vim_autolint
        call neomake#configure#automake('w')
    endif

    nnoremap <silent> <Leader>bc :Neomake<CR>:echo neomake#statusline#LoclistStatus()<CR>
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
    let g:syntastic_error_symbol             = g:zero_vim_signs.error
    let g:syntastic_warning_symbol           = g:zero_vim_signs.warning
    let g:syntastic_style_error_symbol       = g:zero_vim_signs.style_error
    let g:syntastic_style_warning_symbol     = g:zero_vim_signs.style_warning

    let s:syntastic_checker_exec_paths = {
                \ 'eslint': 'npm run eslint --',
                \ }

    function! s:AddSyntasticChecker(checker, filetype) abort
        if executable(a:checker)
            let filetypes = []
            if type(a:filetype) == type('')
                call add(filetypes, a:filetype)
            elseif type(a:filetype) == type([])
                call extend(filetypes, a:filetype)
            endif
            for ft in filetypes
                let g:syntastic_{ft}_checkers = get(g:, printf('syntastic_%s_checkers', ft), [])
                call add(g:syntastic_{ft}_checkers, a:checker)
                if has_key(s:syntastic_checker_exec_paths, a:checker)
                    let g:syntastic_{ft}_{a:checker}_exec = s:syntastic_checker_exec_paths[a:checker]
                endif
            endfor
        endif
    endfunction

    call s:AddSyntasticChecker('eslint', ['typescript', 'javascript', 'jsx'])
    call s:AddSyntasticChecker('standardrb', 'ruby')
    call s:AddSyntasticChecker('rubocop', 'ruby')
    call s:AddSyntasticChecker('yamllint', 'yaml')

    nnoremap <silent> <Leader>bc :SyntasticCheck<CR>:echo SyntasticStatuslineFlag()<CR>
endif

if s:IsPlugged('vim-autoformat')
    " Chiel92/vim-autoformat
    let g:autoformat_autoindent             = 0
    let g:autoformat_retab                  = 0
    let g:autoformat_remove_trailing_spaces = 0
    let g:autoformat_verbosemode            = 0

    " Terraform
    let g:formatdef_terraform_fmt = '"terraform fmt -no-color -"'
    let g:formatters_terraform    = ['terraform_fmt']

    nnoremap <silent> <Leader>A  :Autoformat <Bar> update<CR>
    xnoremap <silent> <Leader>A  :Autoformat <Bar> update<CR>
    nmap     <silent> <Leader>=  <Leader>A
    xmap     <silent> <Leader>=  <Leader>A
    nmap     <silent> <Leader>b= <Leader>A
    xmap     <silent> <Leader>b= <Leader>A
endif

if s:IsPlugged('vim-prettier')
    " prettier/vim-prettier
    let g:prettier#autoformat = 0

    nmap <Leader>P  <Plug>(PrettierAsync)
    nmap <Leader>rf <Plug>(PrettierAsync)
endif

if s:IsPlugged('vim-gutentags')
    " ludovicchabant/vim-gutentags
    " Enable only ctags module
    let g:gutentags_modules = ['ctags']

    let g:gutentags_generate_on_missing = 1
    let g:gutentags_generate_on_new     = 1
    let g:gutentags_generate_on_write   = 1

    " Generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir       = expand('~/.cache/tags')
    let g:gutentags_ctag_executable = g:zero_vim_ctags_bin

    " Universal Ctags
    if s:IsUniversalCtags(g:gutentags_ctag_executable) && filereadable(g:zero_vim_ctags_ignore)
        let g:gutentags_ctags_exclude = [ '@' . g:zero_vim_ctags_ignore ]
    endif

    " Ignored directories
    let g:gutentags_exclude_project_root = split(glob('~/.vim/plugged/*'))
    let g:gutentags_exclude_project_root += split(glob('~/.vim/*'))
    let g:gutentags_exclude_project_root += [
                \ $HOME,
                \ '/usr/local',
                \ '/usr',
                \ '/opt',
                \ '/etc',
                \ '/',
                \ ]

    " Ignored file types
    let g:gutentags_exclude_filetypes = [
                \ 'html',
                \ 'xml',
                \ 'css',
                \ 'sass',
                \ 'scss',
                \ 'coffee',
                \ 'less',
                \ 'eruby',
                \ 'haml',
                \ 'hamlc',
                \ 'text',
                \ 'git',
                \ 'gitcommit',
                \ 'fugitiveblame',
                \ ]

    " Define advanced commands
    let g:gutentags_define_advanced_commands = 1

    " gtags_cscope
    if g:zero_vim_gtags_cscope && has('cscope') && executable('gtags')
        call add(g:gutentags_modules, 'gtags_cscope')

        " Automatically add gtags database
        let g:gutentags_auto_add_gtags_cscope = 1
    else
        " Prevent gutentags adding gtags database
        let g:gutentags_auto_add_gtags_cscope = 0
    endif
endif

if s:IsPlugged('gen_tags.vim')
    " jsfaint/gen_tags.vim
    let g:gen_tags#ctags_auto_gen    = 1
    let g:gen_tags#ctags_auto_update = 1
    let g:gen_tags#cache_dir         = expand('~/.cache/gen_tags')
    let g:gen_tags#ctags_bin         = g:zero_vim_ctags_bin

    " Universal Ctags
    if s:IsUniversalCtags(g:gen_tags#ctags_bin) && filereadable(g:zero_vim_ctags_ignore)
        let g:gen_tags#ctags_opts = [ '--exclude=@' . g:zero_vim_ctags_ignore ]
    endif

    " Ignored directories
    let g:gen_tags#blacklist = split(glob('~/.vim/plugged/*'))
    let g:gen_tags#blacklist += split(glob('~/.vim/*'))
    let g:gen_tags#blacklist += [
                \ $HOME,
                \ '/usr/local',
                \ '/usr',
                \ '/opt',
                \ '/etc',
                \ '/',
                \ ]

    " No default gtags mappings
    let g:gen_tags#gtags_default_map = 0

    if g:zero_vim_gtags_cscope && has('cscope') && executable('gtags')
        let g:loaded_gentags#gtags = 0
    else
        " Disable gtags support
        let g:loaded_gentags#gtags = 1
    endif
endif

" gtags_cscope mappings
if g:zero_vim_gtags_cscope && has('cscope') && executable('gtags')
    " The following maps all invoke one of the following cscope search types:
    "   0 or s: Find this C symbol
    "   1 or g: Find this definition
    "   2 or d: Find functions called by this function
    "   3 or c: Find functions calling this function
    "   4 or t: Find this text string
    "   6 or e: Find this egrep pattern
    "   7 or f: Find this file
    "   8 or i: Find files #including this file
    "   9 or a: Find places where this symbol is assigned a value

    nnoremap <silent> <C-\>s :cscope find s <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>g :cscope find g <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>d :cscope find d <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>c :cscope find c <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>t :cscope find t <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>e :cscope find e <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\>f :cscope find f <C-r>=expand('<cfile>')<CR><CR>
    nnoremap <silent> <C-\>i :cscope find i <C-r>=expand('<cfile>')<CR><CR>
    nnoremap <silent> <C-\>a :cscope find a <C-r>=expand('<cword>')<CR><CR>

    xnoremap <silent> <C-\>s :cscope find s <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>g :cscope find g <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>d :cscope find d <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>c :cscope find c <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>t :cscope find t <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>e :cscope find e <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\>a :cscope find a <C-r>=vim_helpers#SelectedText()<CR><CR>

    nnoremap <silent> <C-\><C-s> :vertical scscope find s <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-g> :vertical scscope find g <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-d> :vertical scscope find d <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-c> :vertical scscope find c <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-t> :vertical scscope find t <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-e> :vertical scscope find e <C-r>=expand('<cword>')<CR><CR>
    nnoremap <silent> <C-\><C-f> :vertical scscope find f <C-r>=expand('<cfile>')<CR><CR>
    nnoremap <silent> <C-\><C-i> :vertical scscope find i <C-r>=expand('<cfile>')<CR><CR>
    nnoremap <silent> <C-\><C-a> :vertical scscope find a <C-r>=expand('<cword>')<CR><CR>

    xnoremap <silent> <C-\><C-s> :vertical scscope find s <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-g> :vertical scscope find g <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-d> :vertical scscope find d <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-c> :vertical scscope find c <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-t> :vertical scscope find t <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-e> :vertical scscope find e <C-r>=vim_helpers#SelectedText()<CR><CR>
    xnoremap <silent> <C-\><C-a> :vertical scscope find a <C-r>=vim_helpers#SelectedText()<CR><CR>

    command! -nargs=+ -complete=customlist,<SID>CscopeSearchTypes CsFind  cscope find <args>
    command! -nargs=+ -complete=customlist,<SID>CscopeSearchTypes ScsFind scscope find <args>
    command! -nargs=+ -complete=customlist,<SID>CscopeSearchTypes VcsFind vertical scscope find <args>

    function! s:CscopeSearchTypes(A, L, P) abort
        let parts = split(a:L, '\s\+')
        if len(parts) == 1
            return ['s', 'g', 'd', 'c', 't', 'e', 'f', 'i', 'a']
        elseif len(parts) == 2
            let l:list = [expand('<cword>'), expand('<cWORD>'), expand('<cfile>')]
            let l:list = uniq(sort(l:list))
            return map(l:list, "escape(v:val, '#%')")
        endif
        return []
    endfunction
endif

if s:IsPlugged('tagbar')
    " majutsushi/tagbar
    let g:tagbar_sort      = 0
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 0
    let g:tagbar_iconchars = ['▸', '▾']

    nnoremap <silent> <Leader>T :TagbarToggle<CR>
endif

if s:IsPlugged('vista.vim')
    " liuchenxu/vista.vim
    let g:vista#renderer#enable_icon = 0
    let g:vista_ctags_executable     = g:zero_vim_ctags_bin

    if s:IsUniversalCtags(g:vista_ctags_executable) && filereadable(g:zero_vim_ctags_ignore)
        let g:vista_ctags_project_opts = '--exclude=@' . g:zero_vim_ctags_ignore
    endif

    let g:vista#executives = ['ctags']
    if s:IsPlugged('ale') | call add(g:vista#executives, 'ale') | endif
    if s:IsPlugged('coc.nvim') | call add(g:vista#executives, 'coc') | endif
    if s:IsPlugged('nvim-lspconfig') | call add(g:vista#executives, 'nvim_lsp') | endif
    if s:IsPlugged('vim-lsp') | call add(g:vista#executives, 'vim_lsp') | endif
    if s:IsPlugged('vim-lsc') | call add(g:vista#executives, 'vim_lsc') | endif
    if s:IsPlugged('LanguageClient-neovim') | call add(g:vista#executives, 'lcn') | endif
endif

if s:IsPlugged('gundo.vim')
    " sjl/gundo.vim
    let g:gundo_prefer_python3 = 1
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

if s:IsPlugged('vim-fugitive')
    " tpope/vim-fugitive
    nnoremap          <Leader>gi :Git add -p %<CR><CR>
    nnoremap          <Leader>ga :Git add -p<CR><CR>
    nnoremap <silent> <Leader>gs :Git<CR>
    nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
    nnoremap <silent> <Leader>gc :Git commit<CR>
    nnoremap <silent> <Leader>gb :Git blame<CR>
    nnoremap          <Leader>ge :Gedit<Space>
    nnoremap <silent> <Leader>gr :Gread<CR>
    nnoremap <silent> <Leader>gw :Gwq<CR>
    nnoremap <silent> <Leader>gf :Git fetch<CR>
    nnoremap <silent> <Leader>gp :Git push<CR>
    nnoremap <silent> <Leader>gu :Git pull --rebase<CR>

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

if s:IsPlugged('git-messenger.vim')
    " rhysd/git-messenger.vim
    nmap <C-w>m <Plug>(git-messenger)

    augroup MyAutoCmd
        " Hack for the case Git Messenger popup closed immediately after it opened on Vim 8.2
        autocmd FileType gitmessengerpopup setlocal updatetime=300000
    augroup END
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

    nmap [c <Plug>(GitGutterPrevHunk)
    nmap ]c <Plug>(GitGutterNextHunk)

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

if s:IsPlugged('vim-hardtime')
    " takac/vim-hardtime
    let g:hardtime_default_on = 1
    let g:hardtime_showmsg    = 1
    let g:list_of_visual_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
    let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
endif

" tpope/vim-markdown
let g:markdown_fenced_languages = [
            \ 'bash=sh',
            \ 'sass',
            \ 'scss',
            \ 'css',
            \ 'html',
            \ 'xml',
            \ 'erb=eruby',
            \ 'ruby',
            \ 'javascript',
            \ 'js=javascript',
            \ 'json=javascript',
            \ 'python',
            \ 'sql',
            \ 'vim',
            \ ]

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow  = 0

if s:IsPlugged('vim-rails')
    " tpope/vim-rails
    nnoremap <silent> <Leader>ba :AE<CR>
    nnoremap <silent> <Leader>br :RE<CR>

    let g:rails_projections = {
                \ "app/controllers/*_controller.rb": {
                \   "alternate": [
                \       "spec/requests/{}_spec.rb",
                \       "spec/requests/{}_request_spec.rb",
                \       "spec/requests/{}_controller_spec.rb",
                \       "spec/controllers/{}_controller_spec.rb",
                \   ],
                \ },
                \ "spec/requests/*_request_spec.rb": {
                \   "alternate": [
                \       "app/controllers/{}_controller.rb",
                \   ]
                \ },
                \ "spec/requests/*_spec.rb": {
                \   "alternate": [
                \       "app/controllers/{}.rb",
                \       "app/controllers/{}_controller.rb",
                \   ]
                \ },
                \ "spec/routing/*_routing_spec.rb": {
                \   "alternate": [
                \       "app/controllers/{}_controller.rb",
                \   ]
                \ },
                \ "spec/routing/*_spec.rb": {
                \   "alternate": [
                \       "app/controllers/{}.rb",
                \       "app/controllers/{}_controller.rb",
                \   ]
                \ },
                \ }
endif

if s:IsPlugged('vim-go')
    " fatih/vim-go and phongnh/go-explorer
    let g:go_fmt_command       = 'goimports'
    let g:go_fmt_fail_silently = 1

    " Use completion from LSP plugin instead of go#complete#Complete except for coc.nvim
    if s:IsPlugged('coc.nvim')
        let g:go_code_completion_enabled = 1
    elseif s:IsLSPEnabled() || s:IsPlugged('YouCompleteMe')
        let g:go_gopls_enabled           = 1
        let g:go_code_completion_enabled = 0
    endif

    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:ale_linters = get(g:, 'ale_linters', {})
    let g:ale_linters.go = ['golint', 'govet', 'errcheck']

    let g:go_highlights_enabled = 0

    " These highlights are enabled by default
    " let g:go_highlight_string_spellcheck   = 1
    " let g:go_highlight_format_strings      = 1
    " let g:go_highlight_diagnostic_errors   = 1
    " let g:go_highlight_diagnostic_warnings = 1
    " let g:go_highlight_debug               = 1

    function s:ToggleGoHighlights() abort
        let g:go_highlights_enabled                  = !g:go_highlights_enabled
        " let g:go_highlight_array_whitespace_error    = g:go_highlights_enabled
        " let g:go_highlight_chan_whitespace_error     = g:go_highlights_enabled
        let g:go_highlight_extra_types               = g:go_highlights_enabled
        " let g:go_highlight_space_tab_error           = g:go_highlights_enabled
        " let g:go_highlight_trailing_whitespace_error = g:go_highlights_enabled
        " let g:go_highlight_operators                 = g:go_highlights_enabled
        let g:go_highlight_functions                 = g:go_highlights_enabled
        let g:go_highlight_function_parameters       = g:go_highlights_enabled
        let g:go_highlight_function_calls            = g:go_highlights_enabled
        let g:go_highlight_fields                    = g:go_highlights_enabled
        let g:go_highlight_types                     = g:go_highlights_enabled
        let g:go_highlight_build_constraints         = g:go_highlights_enabled
        let g:go_highlight_generate_tags             = g:go_highlights_enabled
        " let g:go_highlight_variable_assignments      = g:go_highlights_enabled
        " let g:go_highlight_variable_declarations     = g:go_highlights_enabled
        confirm edit
        redraw!
        echo printf('%s highlights!', g:go_highlights_enabled ? 'Enabled' : 'Disabled')
    endfunction

    command! ToggleGoHighlights call <SID>ToggleGoHighlights()

    function! s:SetupVimGo() abort
        if empty(mapcheck('<Plug>(go-run-split)'))
            nnoremap <silent> <Plug>(go-run-split) :<C-u>GoRun!<CR>:redraw!<CR>
        endif

        nmap <buffer> <Leader>rr <Plug>(go-run)
        nmap <buffer> <Leader>rs <Plug>(go-run-split)
        nmap <buffer> <Leader>rb <Plug>(go-build)
        nmap <buffer> <Leader>rg <Plug>(go-generate)
        nmap <buffer> <Leader>ri <Plug>(go-install)
        nmap <buffer> <Leader>rt <Plug>(go-test)
        nmap <buffer> <Leader>rf <Plug>(go-test-func)
        nmap <buffer> <Leader>rT <Plug>(go-test-compile)
        nmap <buffer> <Leader>rc <Plug>(go-coverage)
        nmap <buffer> <Leader>r< <Plug>(go-imports)

        nmap <buffer> <Leader>rn <Plug>(go-rename)

        if s:IsPlugged('ctrlp.vim') || s:IsPlugged('fzf.vim')
            nmap <buffer> <Leader>go <Plug>(go-decls)
            nmap <buffer> <Leader>gO <Plug>(go-decls-dir)
        endif

        nmap <buffer> <Leader>rd <Plug>(go-def)
        nmap <buffer> <Leader>rD <Plug>(go-def-type)
        nmap <buffer> <Leader>ro <Plug>(go-doc)
        nmap <buffer> <Leader>rO <Plug>(go-doc-vertical)

        nmap <buffer> <Leader>rm <Plug>(go-metalinter)
        nmap <buffer> <Leader>rl <Plug>(go-lint)
        nmap <buffer> <Leader>rv <Plug>(go-vet)

        nmap <buffer> <Leader>ba <Plug>(go-alternate-edit)

        nnoremap <buffer> g< :GoImport<Space>
        nnoremap <buffer> g> :GoDrop<Space>
        nnoremap <buffer> gB :GoDocBrowser<Space>

        nnoremap <buffer> <silent> <Leader>rk :GoErrCheck<CR>
        nnoremap <buffer> <silent> <Leader>rh :ToggleGoHighlights<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType go call s:SetupVimGo()
    augroup END
endif

if s:IsPlugged('vim-elixir')
    " elixir-editors/vim-elixir
endif

if s:IsPlugged('vim-mix-format')
    " mhinz/vim-mix-format
    let g:mix_format_on_save = 0

    function! s:SetupMixFormat() abort
        nnoremap <buffer> <silent> <Leader>mf :MixFormat<CR>
        nnoremap <buffer> <silent> <Leader>mF :MixFormatDiff<CR>
    endfunction

    augroup MyAutoCmd
        autocmd FileType elixir call s:SetupMixFormat()
    augroup END
endif

if s:IsPlugged('vim-polyglot')
    " sheerun/vim-polyglot
    " plasticboy/vim-markdown
    let g:vim_markdown_no_default_key_mappings = 1
    let g:vim_markdown_fenced_languages        = [
                \ "c++=cpp",
                \ 'bash=sh',
                \ 'erb=eruby',
                \ 'js=javascript',
                \ 'json=javascript',
                \ 'viml=vim',
                \ ]
endif

" vim-test/vim-test
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
    let g:test#preserve_screen = 0
    let g:test#strategy        = 'tmuxify'
endif

nnoremap <silent> <Leader>tt :TestFile<CR>
nnoremap <silent> <Leader>tf :TestNearest<CR>
nmap              <Leader>tn <Leader>tf
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

if s:IsPlugged('nvim-treesitter')
    " nvim-treesitter/nvim-treesitter
    function! s:InitTreesitter() abort
        try
            lua << EOF
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "maintained",
                highlight = {
                    enable           = true,
                    use_languagetree = false,
                    disable          = { "c", "ruby", "rust" },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection    = "sn",
                        node_incremental  = "sn",
                        scope_incremental = "sc",
                        node_decremental  = "sp",
                    },
                },
                indent = {
                    enable = true,
                },
                refactor = {
                    highlight_definitions = {
                        enable = true,
                    },
                    highlight_current_scope = {
                        enable = false,
                    },
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = "str",
                        }
                    },
                    navigation = {
                        enable = true,
                        keymaps = {
                            goto_definition      = "stg",
                            list_definitions     = "std",
                            list_definitions_toc = "stc",
                            goto_next_usage      = "stn",
                            goto_previous_usage  = "stp",
                        },
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",

                            -- Or you can define your own textobjects like this
                            ["iF"] = {
                                c          = "(function_definition) @function",
                                go         = "(function_definition) @function",
                                javascript = "(function_declaration) @function",
                                python     = "(function_definition) @function",
                            },
                        },
                    },
                    swap = {
                        enable = false,
                        swap_next = {
                            ["sa"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["sA"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    lsp_interop = {
                        enable = false,
                    },
                },
            }
EOF
        catch /^Vim(lua):E5108/
            echohl WarningMsg | echomsg 'Please run :PlugInstall to install `nvim-treesitter` plugin!' | echohl None
        endtry
    endfunction

    call s:InitTreesitter()
endif

" altercation/vim-colors-solarized
let g:loaded_togglebg = 1
let g:solarized_menu  = 0

if !has('gui_running')
    let g:solarized_termcolors = g:zero_vim_solarized ? 16 : 256
endif

" lifepillar/vim-solarized8
let g:solarized_use16        = 1
let g:solarized_term_italics = 1

" lifepillar/vim-gruvbox8
let g:gruvbox_italic = 1

if s:IsPlugged('glyph-palette.vim') && g:zero_vim_glyph_palette
    " lambdalisue/glyph-palette.vim
    augroup MyAutoCmd
        autocmd FileType fern call glyph_palette#apply()
        autocmd FileType nerdtree,vaffle,startify call glyph_palette#apply()
    augroup END
endif

if s:IsPlugged('vim-which-key')
    " liuchengxu/vim-which-key
    let g:which_key_map = {
                \ '<CR>': 'toggle-distraction-free-writing',
                \ '=':    'auto-format-buffer',
                \ 'n':    'open-selected-region',
                \ 'e':    'toggle-explorer',
                \ 'E':    'open-explorer-in-cwd',
                \ 'i':    'hyperfocus-on-range',
                \ 'I':    'toggle-hyperfocus-writing',
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
                \ 'D':    'files-in-buffer-grandparent-dir',
                \ 'P':    'prettier-async',
                \ '\':    'tag',
                \ '[':    'opening-buffer-outline',
                \ ']':    'opening-buffer-tag',
                \ ';':    'command-palette',
                \ ':':    'command-history',
                \ '/':    'search-history',
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
                \ 'o':    'buffer-outline',
                \ 'l':    'buffer-line',
                \ 'e':    'reload-buffer',
                \ 'w':    'save-buffer',
                \ 'u':    'save-buffer-and-strip-trailing-spaces',
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
                \ 'm':    'git-messenger',
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
                \ 'e':    'search-prompt',
                \ 's':    'search-cword',
                \ 'i':    'search-cword-prompt',
                \ 'r':    'search-and-replace-prompt',
                \ 'v':    'subvert-prompt',
                \ '/':    'search-pattern-from-/',
                \ '?':    'search-pattern-from-/-prompt',
                \ 'l':    'search-cword-location-list',
                \ 'b':    'search-cword-with-file-type',
                \ 'p':    'ctrlsf-search-prompt',
                \ 'f':    'ctrlsf-search-cword',
                \ 'c':    'ctrlsf-search-cword-prompt',
                \ 'u':    'ctrlsf-search-update',
                \ 'o':    'toogle-ctrlsf-search-result',
                \ 'n':    'ctrlsf-search-cword-with-file-type',
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
                \ 'name': '+replace/rubocop/prettier',
                \ 'r': 'replace-prompt',
                \ 'w': 'search-and-replace-prompt',
                \ 'f': 'prettier-async',
                \ }

    call which_key#register('<Space>', 'g:which_key_map')

    nnoremap <silent> <Leader> :<C-u>WhichKey '<Space>'<CR>
    vnoremap <silent> <Leader> :<C-u>WhichKeyVisual '<Space>'<CR>

    nnoremap <silent> <LocalLeader> :<C-u>WhichKey '\'<CR>
    vnoremap <silent> <LocalLeader> :<C-u>WhichKeyVisual '\'<CR>
endif

" Setup custom mapping to open specific folder
function! OpenFolderWithMapping(folder, mapping) abort
    if exists(':LeaderfFile') == 2
        let cmd = 'LeaderfFile'
    elseif exists(':Files') == 2
        let cmd = 'Files'
    elseif exists(':ClapFiles') == 2
        let cmd = 'ClapFiles'
    else
        let cmd = 'CtrlP'
    endif
    execute printf('nnoremap <silent> %s :%s %s<CR>', a:mapping, cmd, a:folder)
endfunction

" Find and source .init.vim.local from root to current folder
call s:Source('.init.vim.local')

try
    if exists('g:zero_vim_colorscheme')
        if exists('g:zero_vim_background')
            execute 'set background=' . g:zero_vim_background
        endif
        execute 'colorscheme ' . g:zero_vim_colorscheme
    else
        set background=dark
        colorscheme gruvbox8
    endif
catch
    set background=dark
    colorscheme gruvbox8
endtry

set secure

