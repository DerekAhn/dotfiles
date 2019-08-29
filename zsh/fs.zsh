# override cd to (cd && ls)
function cd {
  builtin cd "$@" && ls
}

function mkc () {
  mkdir -p "$@" && cd "$@"
}

# unzip tar.gz
function untargz() {
  echo "orig size    (bytes): "
  gunzip -c "$1" | tar xopf -
}

function 7zip() {
  tar cf - "$@" | 7za a -si "$@".tar.7z;
}

function 7unzip() {
  7za x -so "$@" | tar xf -;
}

# get gzipped size
function gzsize() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# Clear terminal files
alias terminal-clean='sudo rm -f /private/var/log/asl/*.asl'

# File size
alias fs="stat -f \"%z bytes\""

# Show/Hide finder hidden files
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# file explorer that shows size
alias s="ncdu"

