alias k='kubectl'

alias kctx='kubectl config use-context $(kubectl config get-contexts -o=name | fzf)'

# config things
alias kconf='kubectl config'
alias kconfs='kubectl config get-contexts'
alias kconfd='kubectl config delete-context'
alias kconfu='kubectl config use-context'
alias khome='kubectl config use-context docker-for-desktop'

# Get things
alias kg='kubectl get'
alias kd='kubectl delete'
alias kgall='kubectl get deploy,svc,pods'
alias kaf='kubectl apply -f'
alias kcf='kubectl create -f'
alias kdf='kubectl delete -f'
alias kdes='kubectl describe'
alias kgcr='kubectl get cronjobs'
alias kgc='kubectl get configmaps'
alias kge='kubectl get endpoints'
alias kgd='kubectl get deploy'
alias kgi='kubectl get ingress'
alias kgj='kubectl get jbos'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kgs='kubectl get service'
alias kgstore='kubectl get storageclass'
alias kgpJSON='kubectl get pods -o=json'
alias kpf='kubectl port-forward'
alias kgcs='kubectl get componentstatuses'

# Delete things
alias kdel='kubectl delete'
alias krmf='kubectl delete -f'
alias kdp='kubectl delete pods'
alias kds='kubectl delete service'
alias kdd='kubectl delete deploy'
alias kdi='kubectl delete ingress'
alias kdiALL='kubectl delete ingress --all-namespaces'

# Useful non-operation things
alias ka='kubectl apply -f'
alias kl='kubectl logs '
alias klf='kubectl logs -f'
alias kx='kubectl exec -i -t'

function kexec () {
  exec_pod=`kubectl get pods --field-selector 'status.phase!=Failed' | grep ${1} | cut -d" " -f 1 | head -1`
  echo "Executing ${2} in ${exec_pod} at `kubectl config view -o=jsonpath='{.current-context}'`"
  echo ""

  kubectl exec $exec_pod -c $2 -it $3
  unset exec_pod
}

# TMP
function autoappTunnel() {
  PORT="$1"
  ssh dahn@bastion -L ${PORT}:localhost:${PORT}
}

function kgpn() {
  kubectl get pods -n $1 -owide --show-labels | fzf
}

function orionTunnel() {
  PORT="$1"
  ssh ubuntu@10.30.8.222 -L ${PORT}:localhost:${PORT}
}

function orionTunnel() {
  PORT="$1"
  ssh ubuntu@10.30.8.222 -L ${PORT}:localhost:${PORT}
}

function score() {
  kube-score score $1
}
