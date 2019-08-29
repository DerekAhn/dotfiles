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

alias gstat="git shortlog --summary"

alias only1="git branch | grep -v \"master\" | xargs git branch -D"

# Interactively add selected parts of files
alias gaap="git add -p"
alias gsp="git stash -p"

alias gitrecent="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# Git push new branch
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# git whatchanged
function gwtf() {
  git whatchanged --since="$1"
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

# Git Checkout Search
function gcos () {
  git fetch
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}
