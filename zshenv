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

# Build documentation when building erlang
export KERL_BUILD_DOCS="yes"

# Don't update homebrew when running `install` command
export HOMEBREW_NO_AUTO_UPDATE=1
