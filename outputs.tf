output "vpn1_peer_ip" {
  value       = aws_vpn_connection.lab-vpn-1.tunnel1_address
  description = "Public IP of tunnel 1"
}

output "vpn2_peer_ip" {
  value       = aws_vpn_connection.lab-vpn-1.tunnel2_address
  description = "Public IP of tunnel 2"
}

output "ec2_ip" {
  value       = aws_instance.lab-ec2-private.private_ip
  description = "Private IP of EC2 instance"
}
