fn hx {|@args| helix $@args}
fn l {|@args| ls -lA $@args}

# Completions via Carapace (https://carapace.sh/)
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)

eval (zoxide init elvish | slurp)
