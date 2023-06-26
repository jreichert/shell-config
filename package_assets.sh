#!/bin/sh

# Pull in all assets that should be pushed to GitHub.

# Set up Zsh/OhMyZsh and plugins
cp ~/.zshrc .

# Set up EverVim, plugins, and customizations
cp ~/.EverVim.vimrc .
cp ~/.EverVim.bundles .
cp -R ~/.EverVim/custom_scripts .Evervim
cp -R ~/.ctags.d .

# Set up Git
mkdir -p usr/local/bin
cp /usr/local/bin/diffmerge.sh usr/local/bin
cp ~/.gitconfig .
