variable "name" {
  description = "The name prefix for all resources."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type = string
}

variable "azs" {
  description = "A list of availability zones in the region."
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
