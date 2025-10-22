fn alias { |name lambda|
  edit:add-var $name"~" $lambda
}
alias hx { |@args| helix  $@args }
alias l  { |@args| ls -lA $@args }
