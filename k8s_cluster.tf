resource "google_compute_global_address" "gcp_ingress_ip" {
  name = "gcp-${var.cluster_name}-ingress-ip"
}

//resource "google_container_cluster" "gcp_kubernetes" {
//
//  name = "${var.cluster_name}"
//  zone = "${var.default_google_zone}"
//  initial_node_count = "${var.gcp_cluster_count}"
//
//  node_version = "${data.google_container_engine_versions.engine_versions.latest_node_version}"
//  min_master_version = "${data.google_container_engine_versions.engine_versions.latest_master_version}"
//
//  additional_zones = [
//    "us-west1-b",
//    "us-west1-c"
//  ]
//
//  master_auth {
//    username = "${var.k8s_cluster_linux_admin_username}"
//    password = "${var.k8s_cluster_linux_admin_password}}"
//  }
//
//  node_config {
//    machine_type = "${var.gcp_node_type}"
//    oauth_scopes = [
//      "https://www.googleapis.com/auth/compute",
//      "https://www.googleapis.com/auth/devstorage.read_only",
//      "https://www.googleapis.com/auth/logging.write",
//      "https://www.googleapis.com/auth/monitoring",
//    ]
//
//    labels {
//      managed-by-terraform = true
//    }
//  }
//
//  addons_config {
//    kubernetes_dashboard {
//      disabled = true
//    }
//  }
//
//  maintenance_policy {
//    daily_maintenance_window {
//      start_time = "03:00"
//    }
//  }
//}