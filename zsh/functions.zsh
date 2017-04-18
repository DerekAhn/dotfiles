####################
# functions
####################
# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@";
}
function md() {
  mkdir -p "$@" && cd "$@";
}

function 7zip() {
  tar cf - "$@" | 7za a -si "$@".tar.7z;
}

function 7unzip() {
  7za x -so "$@" | tar xf -;
}

function hist() {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# override cd to (cd && ls)
function cd {
  builtin cd "$@" && ls
}

# going up n levels
function .. (){
  local arg=${1:-1};
  local dir=""
  while [ $arg -gt 0 ]; do
    dir="../$dir"
    arg=$(($arg - 1));
  done
  cd $dir #>&/dev/null
}

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

function hist() {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# find shorthand
function f() {
  find . -name "$1"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
    mkdir -p "$1"
    git archive master | tar -x -C "$1"
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# All the dig info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}


# syntax highlight the contents of a file or the clipboard and place the result on the clipboard
function hl() {
  if [ -z "$3" ]; then
      src=$( pbpaste )
  else
      src=$( cat $3 )
  fi

  if [ -z "$2" ]; then
      style="moria"
  else
      style="$2"
  fi

  echo $src | highlight -O rtf --syntax $1 --font Inconsoloata --style $style --line-number --font-size 24 | pbcopy
}

# Man Command colorizer
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
			man "$@"
}
