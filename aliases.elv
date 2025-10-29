fn alias { |name lambda|
  edit:add-var $name"~" $lambda
}
fn complete-with { |cmd completable-cmd @complete-args|
  set edit:completion:arg-completer[$cmd] = { |0 @args|
    $edit:completion:arg-completer[$completable-cmd] $completable-cmd (all $complete-args) (all $args)
  }
}
fn completable-alias { |alias-str cmd @cmd-args|
  alias $alias-str { |@args| eval (str:join ' ' [$cmd (all $cmd-args) (all $args)]) }
  complete-with $alias-str $cmd (all $cmd-args)
}

alias hx   { |@args| helix  $@args }
alias l    { |@args| ls -lA $@args }
alias wifi { |@args| iwctl  $@args }

alias mds { |file| md:show (slurp <$file) | bat }

alias gd { |@args| git diff (all $args) | delta }
complete-with gd git diff

completable-alias ga git add
completable-alias gl git log --oneline
completable-alias gr git rebase
completable-alias gsp git stash
completable-alias gs git status 
completable-alias gch git checkout
completable-alias gp git pull

alias gco { |@args|
  if (> (count $args) 0) {
    git commit -m (str:join ' ' $args)
  } else {
    git commit
  }
}

completable-alias doc doc:show
#alias doc { |@args| doc:show $@args }
#complete-with doc doc:show
