#!/usr/bin/env bash

ln -s $(pwd)/emacs ~/.emacs
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore_global ~/.gitignore_global

mkdir -p ~/.config/terminator
ln -s $(pwd)/terminator ~/.config/terminator/config
