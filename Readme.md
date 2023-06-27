## Pull in all assets that should be pushed to GitHub.

### Prerequisites
* [EverVim](https://github.com/LER0ever/EverVim)
* Zsh
* OhMyZsh
* universal-ctags (may work with exuberant ctags but unsure)
* youcompleteme engine
* Optional: DiffMerge (however see note below if you do not install it)

### Installation
Copy all files from this project to `$HOME` (back up the existing files listed in package_assets.sh if you want to be careful not to override anything).  You must do this *after* installing the prerequisites above, as several files from this repo are copied into hidden directories that the EverVim installer creates.

#### EverVim
EverVim uses [Vim Plug](https://github.com/junegunn/vim-plug) as its plugin manager.  To install the plugins included here, open a vim session and type the following two commands in normal mode:

* `:PlugInstall`
* `:PlugClean!`

Run the following commands to override some of EverVims plugin customizations.

> cp .Evervim/core/core.vim $HOME/.EverVim/core
> 
> cp .Evervim.vimrc.after $HOME

#### vimwiki
The current configuration uses the [Dark Vimwiki HTML Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template). In order for this to work, after the wiki is generated you need to manually copy the contents of the `wiki_html` folder to `~/Downloads/vimwiki_html` (or wherever you have configured your vimwiki files to live if you changed that).  

Vimwiki is configured in `.Evervim.vimrc`.  If you wish to change the path where the vimwiki files are located or disable/change this template, you can do so there.

#### git
If you are optionally using DiffMerge, copy the file usr/local/bin/diffmerge.sh to your /usr/local/bin.

### Updates
In order to update this repo, run the package_assets.sh script in this project, `git commit`, then `git push origin`.

### Configuraton
#### EverVim custom configuration
With the rare exception of some plugin configuration variables (see next paragraph), **all Vim customization should be added to .Evervim.vimrc**. Standard .vimrc is not read by EverVim!

Most configuration for Vim can be handled by updating .Evervim.vimrc as you would normally do with a .vimrc file.  However, all of this configuration is loaded _before_ EverVim performs its own setup - meaning that it may override some values you have set in .EverVim.vimrc.  If setting a variables in that file doesn't seem to work, that's probably the reason why (you can check for this explicitly by adding your variable to .EverVim.vimrc and then in a vim session type `:echo <variable>` - if the value isn't what you set, then EverVim has hijacked it).

EverVim does not supply a way to override this behavior, so I have added the file .EverVim.vimrc.after to this project.  Any variables added here will take precedence over the values that EverVim has set.  In general it's a good idea to keep most of your configuration in .EverVim.vimrc so it's all in one place; only add variables here that need to be here.

#### Git Merge
This config is set up to use [DiffMerge](https://sourcegear.com/diffmerge/) as its tool for both Git Diffs and Git merges.  If it is installed locally then following the instructions above will configure this as well.  If this is not the desired tool, then .gitconfig can be modified accordingly.

Almost everything here should work from a remote terminal session except for using DiffMerge since it's a graphical tool.  In that case, you still have the option of using vimdiff, which is built in to vim: `gdtlvim <file1> <file2>` for diffing, and `gmtlvim` for merging.

## Reference
ctags and the Vim Tagbar plugin have poor support for .tsx files.  Installing this package should make this work better with no additional configuration required.  This gist was used as reference for the ctags customization in /.ctags.d/: [https://gist.github.com/romgrk/](https://gist.github.com/romgrk/) 