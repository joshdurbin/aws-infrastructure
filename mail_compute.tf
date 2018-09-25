resource "digitalocean_droplet" "mail_server" {

  image = "${var.digital_ocean_mail_server_machine_image}"
  name = "${var.mail_joshdurbin_net}"
  region = "${var.default_digitalocean_zone}"
  size = "${var.digital_ocean_mail_server_machine_type}"

  ssh_keys = [
    "${digitalocean_ssh_key.platypus_pub_key.id}",
    "${digitalocean_ssh_key.firefly_pub_key.id}"
  ]

  monitoring = true
  backups = true

  tags = [
    "${digitalocean_tag.managed_by_terraform.id}"
  ]

}

resource "digitalocean_tag" "managed_by_terraform" {

  name = "managed-by-terraform"
}

resource "digitalocean_firewall" "mail_server_inbound" {

  name = "mail-server-inbound"
  droplet_ids = ["${digitalocean_droplet.mail_server.id}"]

  inbound_rule = [
    {
      protocol = "tcp"
      port_range = "25"
    },
    {
      protocol = "tcp"
      port_range = "587"
    },
    {
      protocol = "tcp"
      port_range = "993"
    }
  ]
}

resource "digitalocean_firewall" "ssh_inbound" {

  name = "ssh-inbound"
  droplet_ids = ["${digitalocean_droplet.mail_server.id}"]

  inbound_rule = [
    {
      protocol = "tcp"
      port_range = "22"
    }
  ]
}

resource "digitalocean_ssh_key" "platypus_pub_key" {
  name = "platypus"
  public_key = "${file("/Users/jdurbin/crypto/platypus/ssh_jdurbin_platypus.pub")}"
}

resource "digitalocean_ssh_key" "firefly_pub_key" {
  name = "platypus"
  public_key = "${file("/Users/jdurbin/crypto/firefly/ssh_jdurbin_firefly.pub")}"
}