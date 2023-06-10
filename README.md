# Dotfiles
## Installation
The `install.sh` does everything for you. Here's how it works:
### Standard dotfiles
The script will create symlinks to all of the dotfiles located in the `files` directory of this repo. You must not move or delete this repo after installing, or the symlinks will be broken and you will have to call `install.sh` again.
### Templated dotfiles
Sometimes you want exactly the same dotfile across all your machines except for a small change, for example, a different dpi. This is often possible if the config for a program allows you to include another local config file or reference environment variables, but this is not a universal solution. To cover every case, you can use this template system. Inside the `templates` directory there is a `config` directory which consists of YAML files defining local configuration such as dpi, and a `files` directory consisting of templated dotfiles. A templated dotfile is a regular dotfile containing placeholders. A placeholder is anything in curly braces and @ signs, e.g. `{@ dpi @}`. When the real dotfiles are generated from the templates, these placeholders will get replaced from the relevant config file. For example, if you need to generate dotfiles for a high dpi setup, you would run `./generate-from-templates.py -c high-dpi`, referring to the `high-dpi.yml` config file. If a particular placeholder doesn't exist in the specified config file, it will use the `default.yml` config as a fallback.
### Neovim plugins
The `install.sh` script will install [vim-plug](https://github.com/junegunn/vim-plug) and run PlugInstall in neovim automatically. You shouldn't need to do anything.
### Getting updates
When an edit to a dotfile is pushed, you don't need to run `install.sh`. Simply pull the repo. This is because the dotfile in your home directory is symlinked. For newly added files or neovim plugins, run `install.sh`. If a templated dotfile is changed, run `generate-from-templates.py`.
