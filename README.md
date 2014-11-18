Many thanks to [thoughtbot](https://github.com/thoughtbot/dotfiles) and [Paul Irish](https://github.com/paulirish/dotfiles), whose dotfiles were shamelessly borrowed from to create my own.

Install
-------

Clone the repo:

    git clone git://github.com/christopherstyles/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile

This will create symlinks for config files in your home directory. The `-x`
options, which exclude the `README.md`, `LICENSE`, and `Brewfile` files, are
needed during installation but can be skipped once the `.rcrc` configuration
file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

Make your own customizations
----------------------------

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`
* `~/.bashrc.local`

Install Vundle (the vim plugin manager) with the following:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Install the vim plugins with:

    Launch `vim` and run `:PluginInstall`
