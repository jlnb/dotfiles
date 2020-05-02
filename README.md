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
* Make sure **oh-my-zsh** is installed
* Make sure **powerlevel10k** theme is available
* Create symbolic links from the dotfiles in this repository to the correct
  places on the machine. You can use the shell script "linkFiles.sh" for this
  task. It will backup possibly already existing dotfiles and create symbolic
  links to dotfiles contained in this repository.

Even though points two and three are indicated as optional, it is recommended to
install the font and use it in the terminal app.

## Open tasks

* Add my .vimrc file
* Add possibility to incorporporate local adjustments to configurations without
  touching / changing the files in this repository

## Adding additional configuration files

In case a configuration file of an application not yet contained in this
repository is added, make sure to change the linkFiles.sh accordingly.
