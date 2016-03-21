# Git Aliases
alias gf="git fetch"
alias ugc="git reset HEAD@{1}"
alias ugp="git reset --hard HEAD~1 && git push -f"
alias gstat="git shortlog -s -n"
alias glog1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# Git-Crypt
alias gcrypt-init="git-crypt init"
alias gcrypt-allow="git-crypt add-gpg-user"
alias gcrypt-attr="touch .gitattributes && echo '.env filter=git-crypt diff=git-crypt' > .gitattributes"
alias gdecrypt="git-crypt unlock"

