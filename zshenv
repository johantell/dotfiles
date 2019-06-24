# Used for setting user's environment variables; it should not contain
# commands that produce output or assume the shell is attached to a tty.
#
# This file will always be sourced.

# Set locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set vim as default editor
export EDITOR="vim"

# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Ignore duplicates in terminal history
export HISTCONTROL=ignoredups

# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Allow mix escripts to be executed
export PATH="$HOME/.mix/escripts:$PATH"

# Export ~/bin into path
export PATH="$PATH:$HOME/bin"

# Export ~/.local/bin into path
export PATH="$PATH:$HOME/.local/bin"

# Export /usr/local/sbin to path
export PATH="/usr/local/sbin:$PATH"

# Export /usr/local/bin to path
export PATH="/usr/local/bin:$PATH"

# Export ~/.carbo/bin for rust programs
export PATH="$PATH:$HOME/.cargo/bin"

