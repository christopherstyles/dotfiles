Many thanks to [thoughtbot](https://github.com/thoughtbot/dotfiles) and [Paul Irish](https://github.com/paulirish/dotfiles), whose dotfiles were shamelessly borrowed from to create my own.

# Install

## Clone the repo:

    git clone git://github.com/christopherstyles/dotfiles.git

### Install [Homebrew](https://brew.sh/)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Install gpg, autosign commits

Export gpg keys from previous computer

    gpg --export-secret-keys -a <YOUR SIGNING KEY> > private_key_<YOUR SIGNING KEY>.asc
    gpg --export -a <YOUR SIGNING KEY> > public_key_<YOUR SIGNING KEY>.asc

Copy those keys to the new computer and import the keys

    gpg --import public_key_405581AFB24E09D59AEDDD9213086AA0E6996E33.asc
    gpg --import public_key_405581AFB24E09D59AEDDD9213086AA0E6996E33.asc

Install dependencies

    brew install gnupg gnupg2 pinentry-mac

Configure git

    git config --global user.signingkey <YOUR_SIGNING_KEY>
    git config --global commit.gpgsign true
    git config --global gpg.program gpg

Put the following in `~/.gnupg/gpg.conf`

    no-tty

Put the following in `~/.gnupg/gpg-agent.conf`

    pinentry-program /usr/local/bin/pinentry-mac

Execute the following to terminate the GPG (Gnu Privacy Guard) agent:

    killall gpg-agent

### Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

### Install:

    rcup -d dotfiles -x README.md -x LICENSE -x Brewfile

This will create symlinks for config files in your home directory. The `-x`
options, which exclude the `README.md`, `LICENSE`, and `Brewfile` files, are
needed during installation but can be skipped once the `.rcrc` configuration
file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

## Make your own customizations

Put your customizations in dotfiles appended with `.local`:

- `~/.aliases.local`
- `~/.gitconfig.local`
- `~/.gvimrc.local`
- `~/.tmux.conf.local`
- `~/.vimrc.local`
- `~/.vimrc.bundles.local`
- `~/.bashrc.local`

Install Vundle (the vim plugin manager) with the following:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Launch `vim` and run `:PluginInstall`
