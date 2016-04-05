set guioptions-=m       " Disable menubar
set guioptions-=T       " Disable toolbar
set guioptions-=t       " Disable tearoff menu items
set guioptions-=r       " Disable right-hand scrollbar
set guioptions-=L       " Disable left-hand scrollbar
set guioptions-=e       " No guitablabel
set guioptions+=c       " Use console dialogs instead of popup dialogs for simple choices

set cursorline          " Highlight the screen line of the cursor
set linespace=2         " Add some line space for easy reading
set lines=40 columns=120

if has('gui_macvim')
    set invmmta         " Make Mac's Option key behave as the Meta key
    set antialias

    set lines=999 columns=999
    set guifont=Iosevka:h13,Hasklig:h13,Cousine:h13,Roboto\ Mono:h13,Monaco:h13

    if has('transparency') || exists('+transparency')
        set transparency=2
    endif

    xnoremap <silent> <D-c> "+y
    xnoremap <silent> <D-x> "+d
    nnoremap <silent> <D-v> :set paste<CR>"+gP:set nopaste<CR>
    inoremap <silent> <D-v> <C-G>u<C-O>"+gP
elseif has('gui_gnome') || has('gui_gtk')
    set guifont=Iosevka\ 13,Hasklig\ 13,Cousine\ 13,Roboto\ Mono\ 13,Ubuntu\ Mono\ 13,Monospace\ 12
elseif has('gui_win32') || has('gui_win64')
    set guifont=Consolas:h12,Andale_Mono:h12,Courier_New:h10
endif

inoremap <Esc> <Esc>
