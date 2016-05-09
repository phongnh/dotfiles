# My dotfiles

My dotfiles for vim + tmux setup

## Install necessary programs (Mac OS X only)

    brew install tmux reattach-to-user-namespace htop-osx the_silver_searcher git tig urlview fpp cmake python2 python3

    # Optional
    sudo -i
    gem install tmuxinator rubocop --no-rdoc --no-ri

    # Install vim
    brew install vim --with-lua --HEAD

    # Or install macvim
    brew install macvim --with-lua --HEAD

    # Or install neovim
    brew tap neovim/neovim
    brew install neovim --HEAD
    pip2 install --user --upgrade pip setuptools
    pip2 install --user --upgrade neovim
    pip3 install --user --upgrade neovim

## Setup vim and nvim folder

    mkdir -p ~/.vim/{plugged,snippets,cache}
    mkdir -p ~/.cache/{swap,backup,undo}
    touch ~/.cache/NERDTreeBookmarks

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
    # Using vim
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    # Using neovim
    ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim

    # tmux
    ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

## Start vim and install plugins

    vim  +PlugInstall +qall
    mvim +PlugInstall +qall
    nvim +PlugInstall +qall
