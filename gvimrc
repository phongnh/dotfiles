set guioptions-=m       " Disable menubar
set guioptions-=T       " Disable toolbar
set guioptions-=t       " Disable tearoff menu items
set guioptions-=r       " Disable right-hand scrollbar
set guioptions-=L       " Disable left-hand scrollbar
set guioptions-=e       " No guitablabel
set guioptions+=c       " Use console dialogs instead of popup dialogs for simple choices

" set cursorline          " Highlight the screen line of the cursor
" set linespace=2         " Add some line space for easy reading
set lines=40 columns=120

if has('gui_macvim')
    set invmmta         " Make Mac's Option key behave as the Meta key
    set antialias

    " if has('transparency') || exists('+transparency')
    "     set transparency=2
    " endif

    set lines=999 columns=999

    set macligatures    " Display ligatures if selected 'guifont' supports them
    set guifont=Iosevka\ Medium:h13,Monaco:h13

    xnoremap <silent> <D-c> "+y
    xnoremap <silent> <D-x> "+d
    nnoremap <silent> <D-v> :set paste<CR>"+gP:set nopaste<CR>
    inoremap <silent> <D-v> <C-g>u<C-o>"+gP
elseif has('gui_gnome') || has('gui_gtk')
    set guifont=Iosevka\ 13,Ubuntu\ Mono\ 13,Monospace\ 12
elseif has('gui_win32') || has('gui_win64')
    set guifont=Iosevka:h13,Consolas:h12
endif
