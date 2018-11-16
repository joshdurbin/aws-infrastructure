//resource "google_compute_global_address" "gcp_ingress_ip" {
//  name = "gcp-${var.k8s_cluster_name}-ingress-ip"
//}

//resource "google_container_cluster" "gcp_kubernetes" {
//
//  name = "${var.k8s_cluster_name}"
//  zone = "${var.default_google_zone}"
//  initial_node_count = "${var.k8s_cluster_node_count}"
//
//  node_version = "${data.google_container_engine_versions.engine_versions.latest_node_version}"
//  min_master_version = "${data.google_container_engine_versions.engine_versions.latest_master_version}"
//
//  master_auth {
//    username = "${var.k8s_cluster_master_auth_user}"
//    password = "${var.k8s_cluster_master_auth_password}"
//  }
//
//  node_config {
//    machine_type = "${var.k8s_cluster_matchine_type}"
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