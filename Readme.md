## Pull in all assets that should be pushed to GitHub.

### Prerequisites
* EverVim
* Zsh
* OhMyZsh
* universal-ctags (may work with exuberant ctags but unsure)
* youcompleteme engine
* Optional: DiffMerge (however see note below if you do not install it)

### Installation
Copy all files from this project to $HOME (back up the existing files listed in package_assets.sh if you want to be careful not to override anything.  You must do this *after* installing the prerequisites above, as several files from this repo are copied into hidden directories that the EverVim installer creates.

#### EverVim
EverVim uses [Vim Plug](https://github.com/junegunn/vim-plug) as its plugin manager.  To install the plugins included here, open a vim session and type the following two commands in normal mode:

* `:PlugInstall`
* `:PlugClean!`

#### vimwiki
The current configuration uses the [Dark Vimwiki HTML Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template). In order for this to work, after the wiki is generated you need to manually copy the contents of the `wiki_html` folder to `~/Downloads/vimwiki_html` (or wherever you have configured your vimwiki files to live if you changed that).  

Vimwiki is configured in `.Evervim.vimrc`.  If you wish to change the path where the vimwiki files are located or disable/change this template, you can do so there.

#### git
Finally, if you are optionally using DiffMerge, copy the file user/local/bin/diffmerge.sh to your /usr/local/bin.

### Updates
In order to update this repo, run the package_assets.sh script in this project, `git commit`, then `git push origin`.

### Notes
* **All Vim customization should be added to .Evervim.vimrc**. Standard .vimrc is not read by EverVim!
* This config is set up to use [DiffMerge](https://sourcegear.com/diffmerge/) as its tool for both Git Diffs and Git merges.  If it is installed locally then following the instructions above will configure this as well.  If this is not the desired tool, then .gitconfig can be modified accordingly.
* Almost everything here should work from a remote terminal session except for using DiffMerge since it's a graphical tool.  In that case, you still have the option of using vimdiff, which is built in to vim: `gdtlvim <file1> <file2>` for diffing, and `gmtlvim` for merging.
* ctags and the Vim Tagbar plugin have poor support for .tsx files.  Installing this package should make this work better with no additional configuration required.  This gist was used as reference for the ctags customization in /.ctags.d/: [https://gist.github.com/romgrk/](https://gist.github.com/romgrk/) 