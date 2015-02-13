#!/usr/bin/env bash

test -L ~/.emacs || ln -s $(pwd)/emacs ~/.emacs
test -L ~/.gitconfig || ln -s $(pwd)/gitconfig ~/.gitconfig
test -L ~/.gitignore_global || ln -s $(pwd)/gitignore_global ~/.gitignore_global

mkdir -p ~/.config/terminator
test -L ~/.config/terminator/config || ln -s $(pwd)/terminator ~/.config/terminator/config
