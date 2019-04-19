alias GC='gcloud'
alias GCils='gcloud compute instances list'

# SSH into specific GCP instance
# Usage: gcSSH test_cluster us-west2-a
function gcSSH() {
  echo "Initializing shell for $1 in $2\n"
  gcloud compute ssh $1 --zone $2
}

# Creates a new GCP GKE cluster with designated name and zone
# Usage: gcNewCluster test_cluster us-west2-a
function gcNewCluster() {
  echo "Creating a new GCP k8s cluster named: $1 in zone: $2\n"
  gcloud container clusters create $1 --zone $2
  gcloud container clusters get-credentials $1 --zone $2
}
