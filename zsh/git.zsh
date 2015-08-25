# Git Aliases
alias gf="git fetch"
alias ugp="git reset HEAD@{1}"

# Git-Crypt
alias gcrypt-init="git-crypt init"
alias gcrypt-allow="git-crypt add-gpg-user"
alias gcrypt-attr="touch .gitattributes && echo 'secretfile filter=git-crypt diff=gitcrypt\n.env filter=git-crypt diff=git-crypt' > .gitattributes"
alias gdecrypt="git-crypt unlock"