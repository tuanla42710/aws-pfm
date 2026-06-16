variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_cidr" {
  type        = string
  description = "IP for VPC"
}

variable "environment" {
  type        = string
  description = "environment name"
}

variable "public_cidr_blocks" {
  type        = list(string)
  description = "IP"
}

variable "private_cidr_blocks" {
  type        = list(string)
  description = "IP"
}

variable "availability_zones" {
  type        = string
  description = "List AZ deploy"
}

