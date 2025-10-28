eval (slurp < ~/.config/elvish/aliases.elv)
eval (slurp < ~/.config/elvish/env.elv)
eval (slurp < ~/.config/elvish/abbreviations.elv)

# Completions via Carapace (https://carapace.sh/)
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)

# Zoxide (https://github.com/ajeetdsouza/zoxide)
eval (zoxide init elvish | slurp)
