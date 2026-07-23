autoload -Uz compinit && compinit -C

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_all_dups hist_reduce_blanks share_history inc_append_history

# Git prompt
# source: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/dotfiles/bin/.git-prompt.sh

# Show a different color on master branch
function git_branch_color() {
  [[ $1 == master ]] && echo "red" || echo "cyan";
}

# Set prompt to always be redrawn
function build_prompt() {
  local branch=$(__git_ps1 '%s');
  local current_dir="%F{yellow}%20<...<%~%<<%f";
  local git_branch="";
  [[ -n $branch ]] && git_branch="%F{$(git_branch_color "$branch")}@$branch%f";

  echo "$current_dir$git_branch$ ";
}

function precmd {
  PROMPT=$(build_prompt);
}

setopt prompt_subst
PROMPT=$(build_prompt);

# Helper methods
alias la="ls -lah"

# Alias for what_the_color
alias wtc="what_the_color"

# Alias for deleting merged branches from git
alias burn_branches='git branch | egrep -v "(^\*|master|main)" | xargs git branch -D'

# Alias for listing the most recently committed local branches
alias last_used_branches='git for-each-ref --sort="committerdate" --format="%(committerdate)%09%(refname)" refs/heads | sed -e "s-refs/heads/--"'

bindkey "^N" down-line-or-search
bindkey "^P" up-line-or-search

# Activate mise
eval "$(mise activate zsh)"

# Expose homebrew to shell
# eval "$(/opt/homebrew/bin/brew shellenv)"

# Integrate FZF
eval "$(fzf --zsh)"
