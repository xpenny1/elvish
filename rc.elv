eval (slurp < ~/.config/elvish/aliases.elv)
eval (slurp < ~/.config/elvish/env.elv)

# Completions via Carapace (https://carapace.sh/)
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)

eval (zoxide init elvish | slurp)
