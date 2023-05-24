resource "ibm_network_vlan" "public" {
  name       = "${var.datacenter}-public"
  datacenter = var.datacenter
  type       = "PUBLIC"
  router_hostname = "fcr03a.${var.datacenter}"
  tags       = var.tags
}

resource "ibm_network_vlan" "private" {
  name       = "${var.datacenter}-private"
  datacenter = var.datacenter
  type       = "PRIVATE"
  #router_hostname = "bcr03a.${var.datacenter}"
  router_hostname = replace(ibm_network_vlan.public.router_hostname, "/^f/", "b")
  tags = var.tags
}
