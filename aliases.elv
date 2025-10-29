fn alias { |name lambda|
  edit:add-var $name"~" $lambda
}
fn complete-with { |cmd completable-cmd @complete-args|
  set edit:completion:arg-completer[$cmd] = { |0 @args|
    $edit:completion:arg-completer[$completable-cmd] $completable-cmd (all $complete-args) (all $args)
  }
}
fn completable-alias { |alias-str cmd @cmd-args|
  alias $alias-str { |@args| (search-external $cmd) (all $cmd-args) (all $args) }
  complete-with $alias-str $cmd (all $cmd-args)
}

alias hx   { |@args| helix  $@args }
alias l    { |@args| ls -lA $@args }
alias wifi { |@args| iwctl  $@args }

alias gd { |@args| git diff (all $args) | delta }
complete-with gd git diff

completable-alias gl git log --oneline
completable-alias gs git status 
alias gc { |@args|
  try {
    git commit -m $args[0]
  } catch {
    git commit
  }
}
