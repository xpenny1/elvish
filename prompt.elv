set edit:rprompt = {
    if ?(var commit = (git log --oneline 2>/dev/null | head -n 1)) {
      styled "("$commit")" inverse green
      styled " "
    }
    styled (whoami)✸(hostname) inverse blue
}

set edit:prompt = {
  styled (tilde-abbr $pwd) italic blue
  try {
    var branch = (git branch --show-current 2>/dev/null)
    styled " ("$branch")" green
    styled '❱ ' bright-red
  } catch {
    styled '❱ ' bright-red
  }
}


