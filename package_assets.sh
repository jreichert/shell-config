#!/bin/sh

# Script to pull in all files related to shell and development environment
# setup from the local environment.  As these files get updated with feature
# enhancements (or as new files are created), this script can be used to
# update the contents of the git repo so that those enhancements aren't
# forgotten.
#
# If the location of any of these files changes in the future - for example,
# moving from EverVim to vanilla Vim, NeoVim, MacVim or changing shells - they
# can be changed in the variables below.
#
# TODO: write an install script that puts all of the files in the correct place
# on the target environment and maybe installs all of the prerequisites in
# the README.  For now, just copy the files by hand to the locations they 
# came from in the variables below.

# Config file for the user's shell (.zshrc, .bashrc, etc)
SHELL_CONFIG=$HOME/.zshrc

# Location of vim config, plugins, etc.  This probably needs
# to be changed around for NeoVim since it puts things in 
# different directories.
VIM_HOME=$HOME/.EverVim

# Vimrc file (usually .vimrc for vanilla Vim; .EverVim.vimrc for EverVim)
VIMRC=$HOME/.EverVim.vimrc

# Things that would normally go in .vimrc but need to load after all plugins
VIMRC_AFTER=$HOME/.EverVim.vimrc.after

# Vim Plug plugin configuration file
VIM_PLUG_BUNDLES=$HOME/.EverVim.bundles

# Custom scripts written to support plugins
VIM_CUSTOM_SCRIPTS_DIR=custom_scripts

# Dir containing filetype overrides
PLUGIN_AFTER_FTPLUGIN_DIR=bundle/vim/after/ftplugin

# Ctags configuration dir
CTAGS_CONFIG_DIR=$HOME/.ctags.d

# Gitconfig; don't think this location ever changes
GIT_CONFIG_DIR=$HOME/.gitconfig

LOCAL_VIM_HOME=.EverVim

# Pull in all assets that should be pushed to GitHub.

# Set up Zsh/OhMyZsh and plugins
cp $SHELL_CONFIG .

# Set up EverVim, plugins, and customizations
cp $VIMRC .
cp $VIMRC_AFTER .
cp $VIM_PLUG_BUNDLES .
cp -R $VIM_HOME/$VIM_CUSTOM_SCRIPTS_DIR $LOCAL_VIM_HOME

# This is where any filetype-specific overrides should go.  Some of these
# would work in .vimrc, but for example certain autocmd overrides *must*
# be specified inside an ftplugin script.  for example, 
cp -R $VIM_HOME/$PLUGIN_AFTER_FTPLUGIN_DIR $LOCAL_VIM_HOME/$PLUGIN_AFTER_FTPLUGIN_DIR
cp -R $CTAGS_CONFIG_DIR .

# Set up Git
cp $GIT_CONFIG_DIR .

### ONE-OFFS ###
# This file was changed to allow for the additon of .EverVim.vimrc.after
cp $VIM_HOME/core/core.vim ./one-offs

# I had to make changes to vim_markdown to make anchors work properly.  There
# is a PR out to the author for that; once he merges it this line can go away.
cp $HOME/.asdf/installs/python/3.10.10/lib/python3.10/site-packages/vimwiki_markdown.py ./one-offs

# Modified CSS for Dark VimWiki Template
cp $HOME/Documents/vimwiki_html/css/style.css ./one-offs
