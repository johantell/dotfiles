# Export /usr/local/bin to path
export PATH="/usr/local/bin:$PATH"

# Export /usr/local/sbin to path
export PATH="/usr/local/sbin:$PATH"

# Export ~/.local/bin into path
export PATH="$PATH:$HOME/.local/bin"

# Export ~/bin into path
export PATH="$PATH:$HOME/bin"

# Export asdf shims into path
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Allow mix escripts to be executed
export PATH="$HOME/.mix/escripts:$PATH"

# Export ~/.cargo/bin for rust programs
export PATH="$PATH:$HOME/.cargo/bin"

# Export zsh completions in front of fpath
export fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
