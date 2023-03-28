# -------------------------------------------------------------*
# Create and config Kubernetes cluster
# -------------------------------------------------------------*
# This will created the Kubernetes cluster and nodes in GCP
resource "google_container_cluster" "primary" {
  name               = "mm-challenge-2023"  # cluster name
  location          = "us-central1-c"
  initial_node_count = 4               # number of node (VMs) for the cluster

  # let's now configure kubectl to talk to the cluster
  provisioner "local-exec" {
    # we will pas the project ID, zone and cluster name here
    # nodejs-demo-319000 | us-central1-c | node-demo-k8s
    command = "gcloud container clusters get-credentials mm-challenge-2023 --zone us-central1-c --project a37nnunvhmc0oiwh3rx0rwkcl4gr5r"
  }

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["mm-challenge-2023"]
  }

  timeouts {
    # time out after 45 min if the Kubernetes cluster creation is still not finish
    create = "45m" 
    update = "60m"
  }
}