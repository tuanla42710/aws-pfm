variable "username" {
    type = string
    description = "login username"
}

variable "password" {
    type = string
    description = "login password"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

