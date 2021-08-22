#!/usr/bin/env bash

# .bashrc
# first delete default .bashrc
rm -rf ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc

# nord theme gedi
rm -rf ~/.config/gedit
mkdir ~/.config/gedit
# touch ~/.config/gedit/nord.xml
ln -s ~/dotfiles/config/nord.xml ~/.config/gedit/nord.xml
