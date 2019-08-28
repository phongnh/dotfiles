# My dotfiles

My dotfiles for vim + tmux setup

## Install necessary programs (Mac OS X only)

    # Required packages
    brew install tmux reattach-to-user-namespace htop fpp urlview tig
    brew install python python@2 cmake
    brew install ripgrep the_silver_searcher fd
    brew install global ctags
    brew unlink ctags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags

    # Optional
    sudo -i
    gem install tmuxinator rubocop --no-rdoc --no-ri --no-document

    # Install vim
    brew install vim

    # Or install macvim
    brew install macvim

    # Or install neovim
    brew tap neovim/neovim
    brew install neovim --HEAD
    pip3 install --user --upgrade pip setuptools
    pip3 install --user --upgrade pynvim
    pip2 install --user --upgrade pip setuptools
    pip2 install --user --upgrade pynvim

## Setup vim and nvim folder

    mkdir -p ~/.vim/{plugged,snippets,cache}
    mkdir -p ~/.vim/snippets/{UltiSnips,snippets,neosnippets}
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
