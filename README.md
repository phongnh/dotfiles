# My dotfiles

My dotfiles for vim + tmux setup

## Install necessary programs (Mac OS X only)

    brew install tmux reattach-to-user-namespace the_silver_searcher git tig urlview htop-osx
    brew install macvim --with-luajit --with-override-system-vim --HEAD

    # Optional
    sudo -i
    gem install tmuxinator rubocop --no-rdoc --no-ri

## Setup vim folder and install vim-plug

    mkdir -p ~/.vim/{plugged,snippets,cache}
    mkdir -p ~/.vim/cache/{backup,undo,sessions,ctrlp,neocomplete,yankround}
    touch ~/.vim/cache/{NERDTreeBookmarks,viminfo}
    curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Setup tmux folder

    mkdir -p ~/.tmux/logs

## Clone and link my configs

    git clone https://github.com/phongnh/dotfiles.git ~/dotfiles
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    ln -sf ~/dotfiles/gvimrc ~/.gvimrc
    ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

## Start vim and install plugins

    vim -c 'PlugInstall'
