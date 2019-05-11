alias only1="git branch | grep -v \"master\" | xargs git branch -D"

# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"

# Interactively add files
alias gaf="git add | fpp"

# git whatchanged
gwtf() {
  git whatchanged --since="$1"
}
