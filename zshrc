autoload -Uz compinit && compinit

# Git prompt
# source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/dotfiles/bin/.git-prompt.sh

# Show a different color on master branch
function git_branch_color() {
  [[ $(__git_ps1 '%s') == master ]] && echo "red" || echo "cyan";
}

# Set prompt to always be redrawn
function build_prompt() {
  CURRENT_DIR="%F{yellow}%20<...<%~%<<%f";
  GIT_BRANCH="%F{$(git_branch_color)}$(__git_ps1 "@%s")%f";

  echo "$CURRENT_DIR$GIT_BRANCH$ ";
}

function precmd {
  PROMPT=$(build_prompt);
}

setopt prompt_subst
PROMPT=$(build_prompt);

# Helper methods
alias la="ls -lah"

# Use hub as a wrapper for git
alias git="hub"

# Alias for what_the_color
alias wtc="what_the_color"

# Alias for deleting merged branches from git
alias burn_branches='git branch | egrep -v "(^\*|master|main)" | xargs git branch -D'

# Alias for listing the most recently committed local branches
alias last-used-branches='git for-each-ref --sort="committerdate" --format="%(committerdate)%09%(refname)" refs/heads | sed -e "s-refs/heads/--"'

bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search

# Expose homebrew to shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# export where ASDF is stored
export ASDF_DIR=$(brew --prefix asdf)
source "$ASDF_DIR/asdf.sh"
