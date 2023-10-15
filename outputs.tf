output "vpn1_peer_ip" {
  value       = aws_vpn_connection.lab-vpn-1.tunnel1_address
  description = "Public IP of tunnel 1"
}

output "vpn2_peer_ip" {
  value       = aws_vpn_connection.lab-vpn-1.tunnel2_address
  description = "Public IP of tunnel 2"
}
