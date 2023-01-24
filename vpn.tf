resource "aws_customer_gateway" "lab-cgw-1" {
  bgp_asn    = var.customer_asn
  ip_address = var.customer_ip
  type       = "ipsec.1"

  tags = {
    Name = "lab-cgw-1"
  }
}

resource "aws_vpn_connection" "lab-vpn-1" {
  customer_gateway_id      = aws_customer_gateway.lab-cgw-1.id
  transit_gateway_id       = aws_ec2_transit_gateway.lab-tgw-1.id
  type                     = "ipsec.1"
  tunnel_inside_ip_version = var.ip_version

  local_ipv4_network_cidr  = var.local_cidr
  remote_ipv4_network_cidr = var.remote_cidr

  tunnel1_ike_versions = var.ike_versions
  tunnel2_ike_versions = var.ike_versions

  tunnel1_dpd_timeout_action = var.dpd_action
  tunnel2_dpd_timeout_action = var.dpd_action

  tunnel1_dpd_timeout_seconds = var.dpd_timeout
  tunnel2_dpd_timeout_seconds = var.dpd_timeout

  tunnel1_preshared_key = var.tunnel1_psk
  tunnel2_preshared_key = var.tunnel2_psk

  tunnel1_inside_cidr = var.tunnel1_cidr
  tunnel2_inside_cidr = var.tunnel2_cidr

  #phase1
  tunnel1_phase1_encryption_algorithms = var.ph1_encryption
  tunnel2_phase1_encryption_algorithms = var.ph1_encryption

  tunnel1_phase1_integrity_algorithms = var.ph1_integrity
  tunnel2_phase1_integrity_algorithms = var.ph1_integrity

  tunnel1_phase1_dh_group_numbers = var.ph1_dh
  tunnel2_phase1_dh_group_numbers = var.ph1_dh

  tunnel1_phase1_lifetime_seconds = var.ph1_lifetime
  tunnel2_phase1_lifetime_seconds = var.ph1_lifetime

  #phase2
  tunnel1_phase2_encryption_algorithms = var.ph2_encryption
  tunnel2_phase2_encryption_algorithms = var.ph2_encryption

  tunnel1_phase2_integrity_algorithms = var.ph2_integrity
  tunnel2_phase2_integrity_algorithms = var.ph2_integrity

  tunnel1_phase2_dh_group_numbers = var.ph2_dh
  tunnel2_phase2_dh_group_numbers = var.ph2_dh

  tunnel1_phase2_lifetime_seconds = var.ph2_lifetime
  tunnel2_phase2_lifetime_seconds = var.ph2_lifetime

  tags = {
    Name = "lab-vpn-1"
  }
}
