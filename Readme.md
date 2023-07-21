## Pull in all assets that should be pushed to GitHub.

### Prerequisites
* [Zsh](https://www.zsh.org/): ZSH shell (On Mac, this is the default shell so 
  no need to install)
* [OhMyZsh](https://ohmyz.sh/): Zsh customization & plugins
* [EverVim](https://github.com/LER0ever/EverVim): Vim distro prepackaged with 
  several customizations & plugins. **NOTE**: if you get errors installing this
  with NeoVim, delete .Evervim and .Evervim.vimrc and try reinstalling with Vim.
  You can then use NeoVim as normal.
* [Vimwiki Markdown](https://pypi.org/project/vimwiki-markdown/): Convert 
  Vimwiki to HTML
* [Dark VimWiki Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template): 
  Template for Vimwiki HTML formatting. Download the files in the repo - 
  they will be used in the installation below.
* [The Silver Searcher](https://geoff.greer.fm/ag/): fast drop-in replacement for ack
* [fzf](https://github.com/junegunn/fzf): fuzzy find engine
* [universal-ctags](https://ctags.io/): creates tags used by vim for code 
  navigation (may work with exuberant ctags but unsure)
* [YouCompleteMe](https://ycm-core.github.io/YouCompleteMe/): Code completion engine
* GNU coreutils: `brew install coreutils`

#### Optional (but recommended)
* [DiffMerge](https://sourcegear.com/diffmerge/): Git diff/merge tool 
  (however see note below if you do not install it)
* NeoVim.  If you install NeoVim you will also need to install pynvim.

### Installation 
(TODO: Update the instructions as this isn't actually correct.
Copy all the files to the 'correct' locations for each application.)

Copy all files from this project to `$HOME` (back up the existing files listed
in package_assets.sh if you want to be careful not to override anything).  You
must do this *after* installing the prerequisites above, as several files from
this repo are copied into hidden directories that the EverVim installer
creates.

#### EverVim EverVim uses [Vim Plug](https://github.com/junegunn/vim-plug) as
its plugin manager.  To install the plugins included here, open a vim session
and type the following two commands in normal mode:

* `:PlugInstall`
* `:PlugClean!`

Run the following commands to override some of EverVim's plugin customizations.

```sh
cp .Evervim/core/core.vim $HOME/.EverVim/core
cp .Evervim.vimrc.after $HOME
```
#### vimwiki 
The current configuration uses the [Dark Vimwiki HTML
Template](https://github.com/rahul13ramesh/Dark-Vimwiki-Template). In order for
this to work, after the wiki is generated you need to manually copy the
contents of the `wiki_html` folder to `~/Downloads/vimwiki_html` (or wherever
you have configured your vimwiki files to live if you changed that).  

Vimwiki is configured in `.Evervim.vimrc`.  If you wish to change the path
where the vimwiki files are located or disable/change this template, you can do
so there.

#### git 
If you are optionally using DiffMerge, copy the file
usr/local/bin/diffmerge.sh to your /usr/local/bin.

### Configuraton 
#### EverVim custom configuration 
With the rare exception of some plugin configuration variables (see next 
paragraph), **all Vim customization should be added to .Evervim.vimrc**. 
Standard .vimrc is not read by EverVim!  If using NeoVim then you can 
make updates as usual to ~/.config/init.vim; however note that installing the 
files in this repo *will* overwrite your existing one.  So if you wish to 
keep anything from your existing NeoVim config, copy it before installing this!

Most configuration for Vim can be handled by updating .Evervim.vimrc as you
would normally do with a .vimrc file.  However, all of this configuration is
loaded _before_ EverVim performs its own setup - meaning that it may override
some values you have set in .EverVim.vimrc.  If setting a variable in that file
doesn't seem to work, that is probably the reason why (you can check for this
explicitly by adding your variable to .EverVim.vimrc and then in a vim session
type `:echo <variable>` - if the value isn't what you set, then EverVim has
hijacked it).

EverVim does not supply a way to override this behavior, so I have added the
file .EverVim.vimrc.after to this project.  Any variables added here will take
precedence over the values that EverVim has set.  In general it's a good idea
to keep most of your configuration in .EverVim.vimrc so it's all in one place;
only add variables here that need to be here.

#### Git Merge 
This config is set up to use [DiffMerge](https://sourcegear.com/diffmerge/) as 
its tool for both Git Diffs and Git merges.  If it is installed locally then 
following the instructions above will configure this as well.  If this is not 
the desired tool, then .gitconfig can be modified accordingly.

Almost everything here should work from a remote terminal session except for
using DiffMerge since it's a graphical tool.  In that case, you still have the
option of using vimdiff, which is built in to vim: `gdtlvim <file1> <file2>`
for diffing, and `gmtlvim` for merging.

## Usage 
Several customizations have been made to .zshrc and .Evervim.vimrc;
those two files are well commented and should indicate all of the existing
customizations.  Here are a few important ones:

* Vim plus the slew of plugins here add a tremendous number of shortcuts.  
  Making things more complex, the available shortcuts may change depending on 
  what is going on in your current Vim session.  I have added the `ListShortcuts` 
  command which will open a new vsplit that displays all of the currently 
  available shortcuts plus the location where it is set from (in case you want 
  to make any modifications).  For further convenience, you can pull this up at 
  any time by typing `<leader>sh`.
* Vim's built-in pager is terrible, and there isn't a way to change it.  When 
  a Vim command returns a long list, this means there isn't a way to use `less` 
  to search the contents.  Instead of running your command directly, you can 
  run `:Redir <command>` and the output will be displayed in a new vsplit.
* The [vim-startify](https://github.com/mhinz/vim-startify) plugin adds a 
  useful start page that is shown when simply typing `vim`.  In addition to the 
  out-of-the-box functionality, it has been modified to show any files that 
  were bookmarked in NERDTree, and any uncommited/untracked files in the 
  current git project.  The docs at the plugin wiki show how to create any 
  other customizations you'd like.
* vimwiki files are saved in ``$HOME/Documents``, as this will automatically sync 
  their contents across all your Macs if you use iCloud sharing (and it's a dir 
  that exists on Linux and Windows as well).  You can change this in .Evervim.vimrc.
* Support for `.tsx` Typescript files has been added to Tagbar.

## Creating Updates 
In order to update the contents of this repo, run the package_assets.sh script 
in this project, `git commit`, then `git push origin`.

## Reference
ctags and the Vim Tagbar plugin have poor support for .tsx files.
Installing this package should make this work better with no additional
configuration required.  This gist was used as reference for the ctags
customization in /.ctags.d/:
[https://gist.github.com/romgrk/](https://gist.github.com/romgrk/) 
