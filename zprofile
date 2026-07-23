# Expose Homebrew (Apple Silicon) to the shell; sets PATH, MANPATH and INFOPATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Export ~/.local/bin into path
export PATH="$PATH:$HOME/.local/bin"

# Export ~/bin into path
export PATH="$PATH:$HOME/bin"

# Allow mix escripts to be executed
export PATH="$HOME/.mix/escripts:$PATH"

# Export ~/.cargo/bin for rust programs
export PATH="$PATH:$HOME/.cargo/bin"

# Export zsh completions in front of fpath
export fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)

# Export postgres path into env (not sure if needed)
# export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
