# toogle go v1.11 module support
# export GO111MODULE=on

alias gt="go test ."
alias gob="go test --bench ."
alias gol="go list -f '{{ .Dir }}' -m github.com/golang/protobuf"
alias gtc="go test ./... -coverprofile cp.out"
alias gtcm="grep -v -e 1$ cp.out"
alias sc="staticcheck"
