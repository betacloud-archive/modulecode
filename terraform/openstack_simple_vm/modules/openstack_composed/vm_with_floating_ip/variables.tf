variable "name" {}

variable "availability_zone" {
  default = "south-2"
}

variable "flavor_name" {
  default = "2C-2GB-20GB"
}

variable "image_name" {
  default = "Ubuntu 20.04"
}

variable "network_name" {
  default = "net-to-external-beermann"
}

variable "key_pair" {
  default = null
}
