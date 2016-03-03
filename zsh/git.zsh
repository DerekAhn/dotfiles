# Git Aliases
alias gf="git fetch"
alias ugc="git reset HEAD@{1}"
alias ugp="git reset --hard HEAD~1 && git push -f"
alias gstat="git shortlog -s -n"

# Git-Crypt
alias gcrypt-init="git-crypt init"
alias gcrypt-allow="git-crypt add-gpg-user"
alias gcrypt-attr="touch .gitattributes && echo '.env filter=git-crypt diff=git-crypt' > .gitattributes"
alias gdecrypt="git-crypt unlock"

