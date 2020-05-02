#!/bin/bash
# 
# This file places all dotfiles to the location specified by the variable $HOME
# If the variable $HOME does not exist, the script aborts and informs the user
# to specify the variable.
#

# Function to safely, symbolically link files to the $HOME directory
# *safely* means, that a backup copy is made in case the dotfile already exists
safe_ln_file()
{
	if [ -e $HOME/$1 ];
	then
		# Backup dotfile if it already exists
		mv $HOME/$1 $HOME/$1.$(date +%Y)-$(date +%m)-$(date +%d)T$(date +%H):$(date +%M).bckp
	fi
	ln -s $PWD/$1 $HOME/$1
}

if [ -z ${HOME+x} ]
then
	# HOME is not set
	echo "This script can only be executed if the HOME variable is set. Please set it and try again."
	echo "The HOME variable should point to your user directory and all dotfiles will be placed thererin."
	echo " "
else
	# HOME is set
	echo "A backup of existing dotfiles will be made in case there are any."
	echo "The backup file will be named: <original dotfile name>.YYYY-MM-DDTHH:MM.bckp"
	echo " "

	# Call safe_ln_file function for each dotfile
	safe_ln_file .zshrc
	safe_ln_file .bashrc
	safe_ln_file .gitconfig
	safe_ln_file .p10k.zsh
	safe_ln_file .vimrc
fi




