set guioptions-=m       " Disable menubar
set guioptions-=T       " Disable toolbar
set guioptions-=t       " Disable tearoff menu items
set guioptions-=r       " Disable right-hand scrollbar
set guioptions-=L       " Disable left-hand scrollbar
set guioptions-=e       " No guitablabel
set guioptions+=c       " Use console dialogs instead of popup dialogs for simple choices

set lines=999 columns=999

set linespace=2         " Add some line space for easy reading

if has('gui_macvim')
    set guifont=Source\ Code\ Pro:h14
    set antialias
    set invmmta                 " Make Mac's Option key behave as the Meta key
    if has('transparency') || exists('+transparency')
        set transparency=2
    endif

    xnoremap <silent> <D-c> "*y
    xnoremap <silent> <D-x> "*x
    nnoremap <silent> <D-v> "*gP
    inoremap <silent> <D-v> <C-G>u<C-O>"*gP
elseif has("gui_gnome") || has('gui_gtk')
    set guifont=Source\ Code\ Pro\ 9
endif

inoremap <Esc> <Esc>
