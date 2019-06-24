# Homebrew completion
# source ~/dotfiles/bin/homebrew-completion.bash

# Git autocompletion
# source: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
# source ~/dotfiles/bin/git-completion.bash

# Git prompt
# source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/dotfiles/bin/.git-prompt.sh

# Set locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Force $SHELL to be /bin/zsh
export SHELL=/bin/zsh

# Set vim as default editor
export EDITOR="vim"

# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Show a different color on master branch
function git_branch_color() {
  [[ $(__git_ps1 '%s') =~ ^(master|develop)$ ]] && echo "red" || echo "cyan";
}

# Set prompt to always be redrawn
function build_prompt() {
  CURRENT_DIR="%F{yellow}%20<...<%~%<<%f";

  function git_branch() {
    echo "%F{$(git_branch_color)}$(__git_ps1 "@%s")%f";
  }

  echo "$CURRENT_DIR$(git_branch)$ ";
}

function precmd {
  PROMPT=$(build_prompt);
}

setopt prompt_subst
PROMPT=$(build_prompt);


# Ignore duplicates in terminal history
export HISTCONTROL=ignoredups

# Allow mix escripts to be executed
export PATH="$HOME/.mix/escripts:$PATH"

# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

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

# Helper methods
alias la="ls -lah"

# Use hub as a wrapper for git
alias git="hub"

# Alias for deleting merged branches from git
alias burn_branches='git branch | egrep -v "(^\*|master|dev)" | xargs git branch -D'

# export where ASDF is stored
export ASDF_DIR=$(brew --prefix asdf)
source "$ASDF_DIR/asdf.sh"
