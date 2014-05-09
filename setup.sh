#!/usr/bin/env bash

ln -s $(pwd)/emacs ~/.emacs
ln -s $(pwd)/gitconfig ~/.gitconfig

mkdir -p ~/.config/terminator
ln -s $(pwd)/terminator ~/.config/terminator/config
