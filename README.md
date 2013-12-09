# Dotfiles
## Installation
The `install.sh` does everything for you. Here's how it works:
### Standard dotfiles  
The script will create a backup of the old dotfiles into `$HOME/.dotfiles.backup/`  
It will then create symlinks to all of the dotfiles located in the `files/` directory of this repo. You must not move or delete this repo after installing, or the symlinks will be broken and you will have to call `install.sh` again.  
###Vim plugins
The `install.sh` script will also create a symlink from `$HOME/.vim/` to the empty `.vim/` directory in this repo. It will then clone [vundle](https://github.com/gmarik/vundle) and run BundleInstall in vim automatically. You shouldn't need to do anything.
###Getting updates
When an edit to a dotfile is pushed, you don't need to run `install.sh`. Simply pull the repo. This is because the dotfile in your home directory is symlinked. For newly added files, run `install.sh`.
##Uninstallation
A script named `uninstall.sh` has been provided. This will restore the state of your home directory, using the original files located in one of the backup directories in `$HOME/.dotfiles.backup/`. It will restore the files backed up after the first installation.
