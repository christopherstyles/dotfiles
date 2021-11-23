set -x PATH $PATH /Applications/Postgres.app/Contents/Versions/latest/bin
set -U -x PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig

# QT weirdness – https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#homebrew
set -x PATH $PATH /usr/local/opt/qt/bin
set -x PATH $PATH /usr/local/Cellar/qt@5.5/5.5.1_1/bin
set -U -x LDFLAGS "-L/usr/local/opt/qt/lib"
set -U -x CPPFLAGS "-I/usr/local/opt/qt/include"

# go
# set -gx GOPATH ~/go
# set -gx PATH $PATH /usr/local/go/bin/go $GOPATH/bin

# # rbenv – https://github.com/rbenv/rbenv
# set -x PATH $PATH /usr/local/bin/rbenv
# status --is-interactive; and source (rbenv init -|psub)

# rubocop-daemon-wrapper – https://github.com/fohte/rubocop-daemon#more-speed
set -x PATH /usr/local/bin/rubocop-daemon-wrapper $PATH

# set -gx LDFLAGS "-L/usr/local/opt/readline/lib" # For compilers to find readline
# set -gx CPPFLAGS "-I/usr/local/opt/readline/include" # For compilers to find readline
# set -gx PKG_CONFIG_PATH "/usr/local/opt/readline/lib/pkgconfig" # For pkg-config to find readline

# nvm


# Link Rubies to Homebrew's OpenSSL 1.1
# set -x RUBY_CONFIGURE_OPTS $RUBY_CONFIGURE_OPTS "--with-openssl-dir=(brew --prefix openssl@1.1)"

# direnv – https://direnv.net
direnv hook fish | source

# gnupg2
# set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
# set -gx LDFLAGS "-L/usr/local/opt/gettext/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/gettext/include"
set -x GPG_TTY (tty)

# Editor
# set -Ux EDITOR vim -w
set -Ux EDITOR code -w

# See https://thoughtbot.com/blog/git-safe
set -p PATH '.git/safe/../../bin'

# test -s /Users/christopherstyles/.nvm-fish/nvm.fish; and source /Users/christopherstyles/.nvm-fish/nvm.fish

# load_nvm

# set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths

# source (anyenv init - | psub)
# source (pyenv init - | psub)
# status --is-interactive; and source (pyenv init -|psub)

status is-login; and pyenv init --path | source
pyenv init - | source

source /usr/local/opt/asdf/asdf.fish
