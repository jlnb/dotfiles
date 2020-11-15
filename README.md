# dotfiles
Configuration files for vim, bash, etc.

This is just a way to easily access my configuration files online. Most settings
are presumably not very special. However, even if the customizations are little,
I like to play around with virtual machines and I want to keep my settings on
all virtual machines in sync such that vim, bash (or zsh) have the same look /
behavior.

## To-do on new machines

* Clone this repository
* Install fonts located in the fonts folder (optional)
* Make sure the terminal uses these fonts (optional)
* Make sure **zsh** is installed
* Make sure **oh-my-zsh** is installed (<https://www.github.com/ohmyzsh/ohmyzsh>)
* Make sure **powerlevel10k** theme is available (<https://www.github.com/romkatv/powerlevel10k>)
* Create symbolic links from the dotfiles in this repository to the correct
  places on the machine. You can use the shell script "linkFiles.sh" for this
  task. It will backup possibly already existing dotfiles and create symbolic
  links to dotfiles contained in this repository.

Even though points two and three are indicated as optional, it is recommended to
install the font and use it in the terminal app.

### Further Steps...

In order to get everything functioning as intended, install the Vim bundle
plugin manager (<https://www.github.com/VundleVim/Vundle.vim>) and clone
the 'UltiSnips' repository (<https://www.github.com/jlnb/UltiSnips>) to
~/.vim. After that open vim and run ':PluginInstall'.

Note: As UltiSnips relies on python, vim has to be compiled accordingly.

## Assumptions

All dotfiles and extensions assume standard locations for directories and
configuration files. Just right now it is not planned to consider any
customizations to these standard paths and locations. 

The standard path is: $HOME (not sure how this would work on / translate to a
Windows or Mac system; I only tested things on Linux). The standard directories
are listed below, together with software using it.

| Software		| Standard directory for further configuration 	|
|-----------------------|-----------------------------------------------|
| oh-my-zsh 		| $HOME/.oh-my-zsh 				|
| vim 			| $HOME/.vim 					|

The content of these directories is (so far) not part of the dotfiles contained
in this repository.

## Individual Local Settings

Currently, there is the possibility to have a local settings file for vim which
may contain settings that are only suited for a specific computer. For an example
have a look at the '.vimrc.local' file. Therein are settings where to place
backup and undo files as well as which pdf viewer to use for vimtex. These
settings should of course be adjusted for each machine individually, since
folder structures and available pdf viewer may vary from machine to machine.

If you place a file with name '.vimrc.local' in the ~/.vim folder it is
automatically loaded after all other settings are made in the '.vimrc' file:

> " Possibility to add local configuration adjustments
> if filereadable($HOME . "/.vim/.vimrc.local")
>	source ~/.vim/.vimrc.local
> endif

Note: The '.vimrc.local' file is not placed anywhere automatically. It only
serves as example.

## Adding additional configuration files

In case a configuration file of an application not yet contained in this
repository is added, make sure to change the linkFiles.sh accordingly.
