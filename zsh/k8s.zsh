alias k='kubectl'

# Get things
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgpJSON='kubectl get pods -o=json'

# Delete things
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
alias krming='kubectl delete ingress'
alias krmingl='kubectl delete ingress -l'
alias krmingall='kubectl delete ingress --all-namespaces'

# Useful non-operation things
alias ka='kubectl apply -f'
alias klo='kubectl logs -f'
alias kex='kubectl exec -i -t'
