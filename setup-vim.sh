#!/usr/bin/env bash

mkdir -p ~/.vim/{plugged,cache,autoload}
mkdir -p ~/.vim/{UltiSnips,snippets,neosnippets}
mkdir -p ~/.cache/{swap,backup,undo}
touch ~/.cache/NERDTreeBookmarks

# nvim
mkdir -p ~/.config
if [ -L ~/.config/nvim ]; then
    rm ~/.config/nvim
    ln -sf ~/.vim ~/.config/nvim
fi

# Install vim-plug
if [ ! -s ~/.vim/autoload/plug.vim ]; then
    curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Copy vim configs and related ignores
cp agignore ~/.agignore
cp ignore ~/.ignore
cp ctags ~/.ctags
if [ -d ~/.ctags.d ]; then
    cp -r ctags.d/ ~/.ctags.d/
else
    cp -r ctags.d ~/.ctags.d
fi
cp gtags.conf ~/.gtags.conf
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
cp vimrc.before ~/.vimrc.before
cp init.vim.before ~/.init.vim.before
