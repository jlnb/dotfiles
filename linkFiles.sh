#!/bin/bash
# 
# This file places all dotfiles to the location specified by the variable $HOME
# If the variable $HOME does not exist, the script aborts and informs the user
# to specify the variable.
#

if [ -z ${HOME+x} ]
then
	# HOME is not set
	echo "This script can only be executed if the HOME variable is set. Please set it and try again."
	echo "The HOME variable should point to your user directory and all dotfiles will be placed thererin."
	echo " "
else
	# HOME is set
	echo "A backup of existing dotfiles will be made in case there are any."
	echo "The backup file will be named: <original dotfile name>.YYYY-MM-DD.bckp"
	echo " "

	# Config file for z shell (zsh)
	if [ -e $HOME/.zshrc ]
	then
		# zshrc already exists - lets back it up
		mv $HOME/.zshrc $HOME/.zshrc.$(date +%Y)-$(date +%m)-$(date +%d).bckp
	fi
	ln -s $PWD/.zshrc $HOME/.zshrc

	# Config file for bourne-again shell (bash)
	if [ -e $HOME/.bashrc ];
	then
		# .bashrc already exists - lets back it up
		mv $HOME/.bashrc $HOME/.bashrc.$(date +%Y)-$(date +%m)-$(date +%d).bckp
	fi
	ln -s $PWD/.bashrc $HOME/.bashrc

	# Config file for git
	if [ -e $HOME/.gitconfig ];
	then
		# .gitconfig already exists - lets back it up
		mv $HOME/.gitconfig $HOME/.gitconfig.$(date +%Y)-$(date +%m)-$(date +%d).bckp
	fi
	ln -s $PWD/.gitconfig $HOME/.gitconfig

	# Config for powerlevel10k theme for zsh
	if [ -e $HOME/.p10k.zsh ];
	then
		# .p10k.zsh already exists - lets back it up
		mv $HOME/.p10k.zsh $HOME/.p10k.zsh.$(date +%Y)-$(date +%m)-$(date +%d).bckp
	fi
	ln -s $PWD/.p10k.zsh $HOME/.p10k.zsh
fi




