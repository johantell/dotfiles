# Git autocompletion
# source: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source ~/user-configuration/bin/git-completion.bash

# Git prompt
# source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/user-configuration/bin/.git-prompt.sh

# Set locale
export LC_ALL=en_US.utf8

# Show a different color on master branch
function git_branch_color() {
  [[ $(__git_ps1 '%s') = 'master' ]] && echo '31' || echo '36';
}

# Set vim as default editor
export EDITOR="vim"

# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PS1="\[\033[33;1m\]\w\[\033[m\]\[\033[\$(git_branch_color)m\]\$(__git_ps1 '@%s')\[\033[m\]\$ "

# Ignore duplicates in terminal history
export HISTCONTROL=ignoredups

# Allow mix escripts to be executed
export PATH="/Users/johantell/.mix/escripts:$PATH"

# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Export rvm bins into path
export PATH="$PATH:$HOME/.rvm/bin"

# Export ~/bin into path
export PATH="$PATH:$HOME/bin"

# Export ~/.local/bin into path
export PATH="$PATH:$HOME/.local/bin"

# Export /usr/local/sbin to path
export PATH="/usr/local/sbin:$PATH"

# Export ~/.carbo/bin for rust programs
export PATH="$PATH:$HOME/.cargo/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Helper methods
alias la="ls -lah"

# Alias for deleting merged branches from git
alias burn_branches='git branch | egrep -v "(^\*|master|dev)" | xargs git branch -D'

# Source ASDF
export PATH="$PATH:$HOME/.asdf/bin"
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

