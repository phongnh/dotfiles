# My dotfiles

My dotfiles for vim + tmux setup

## Install necessary programs (Mac OS X only)

    brew install tmux reattach-to-user-namespace the_silver_searcher git tig urlview htop-osx

    # Optional
    sudo -i
    gem install tmuxinator rubocop --no-rdoc --no-ri

    # Install vim
    brew install vim --with-luajit --HEAD

    # Or install macvim
    brew install macvim --with-luajit --with-override-system-vim --HEAD

    # Or install neovim
    brew tap neovim/neovim
    brew install neovim --HEAD

## Setup vim and nvim folder

    mkdir -p ~/.vim/{plugged,snippets,cache}
    mkdir -p ~/.vim/cache/{backup,undo,sessions,ctrlp,unite,neocomplete,neocomplcache,yankround}
    touch ~/.vim/cache/{NERDTreeBookmarks,viminfo,nviminfo}

    # nvim
    mkdir -p ~/.config
    ln -sf ~/.vim ~/.config/nvim

    # Install vim-plug
    curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Setup tmux folder

    mkdir -p ~/.tmux/logs

## Clone and link configs

    git clone https://github.com/phongnh/dotfiles.git ~/dotfiles

    # GUI config
    ln -sf ~/dotfiles/gvimrc ~/.gvimrc
    # If vim has both python and lua
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    # If vim has neither python nand lua
    ln -sf ~/dotfiles/legacy.vimrc ~/.vimrc
    # Using neovim
    ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

    # tmux
    ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

## Start vim and install plugins

    vim -c 'PlugInstall'
    nvim -c 'PlugInstall'
