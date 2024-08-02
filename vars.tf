variable "vpc_cidr" {
  type    = string
  default = "100.64.0.0/23"
}

variable "customer_ip" {
  type    = string
  default = "1.1.1.1"
}

variable "private_subnets" {
  type    = list(string)
  default = ["100.64.0.0/24"]
}

variable "customer_asn" {
  type    = string
  default = "65001"
}

variable "aws_asn" {
  type    = string
  default = "64512"
}

variable "key_name" {
  type    = string
  default = "aws-lab"
}

variable "ike_versions" {
  type    = list(string)
  default = ["ikev2"]
}

variable "ip_version" {
  type    = string
  default = "ipv4"
}

variable "tunnel1_psk" {
  type    = string
  default = "uRnc1Eco2Q_5BShMQEpkj6ikLOUp3EC1"
}

variable "tunnel2_psk" {
  type    = string
  default = "kiAjYMF4DDrPzciy7j6PQJOoseGgetmP"
}

variable "tunnel1_cidr" {
  type    = string
  default = "169.254.254.100/30"
}

variable "tunnel2_cidr" {
  type    = string
  default = "169.254.254.104/30"
}

variable "local_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "remote_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "dpd_action" {
  type    = string
  default = "clear"
}

variable "dpd_timeout" {
  type    = number
  default = 30
}

variable "ph1_encryption" {
  type    = list(string)
  default = ["AES256"]
}

variable "ph1_integrity" {
  type    = list(string)
  default = ["SHA2-256", "SHA2-512"]
}

variable "ph1_dh" {
  type    = list(number)
  default = [14, 21]
}

variable "ph1_lifetime" {
  type    = number
  default = 14400
}

variable "ph2_encryption" {
  type    = list(string)
  default = ["AES256"]
}

variable "ph2_integrity" {
  type    = list(string)
  default = ["SHA2-256", "SHA2-512"]
}

variable "ph2_dh" {
  type    = list(number)
  default = [14, 21]
}

variable "ph2_lifetime" {
  type    = number
  default = 3600
}
