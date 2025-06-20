variable "region" {
  type        = string
  description = "Region to deploy to."
}

variable "region_prefix" {
  type        = string
  description = "Short region string."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC IP CIDR range."
}

variable "subnet1_public_cidr" {
  type        = string
  description = "Public subnet1 IP CIDR range."
}

variable "subnet1_private_cidr" {
  type        = string
  description = "Private subnet1 IP CIDR range."
}

variable "subnet2_private_cidr" {
  type        = string
  description = "Private subnet2 IP CIDR range."
}

variable "bucket_encryption_key_arn" {
  type        = string
  description = "Encryption key ARN to use for S3 bucket."
}

variable "just_eu_north_1" {
  type        = bool
  default     = false
  description = "For use in conditional resources that should only exist in North Europe/Stockholm."
}

variable "just_eu_west_2" {
  type        = bool
  default     = false
  description = "For use in conditional resources that should only exist in West Europe/London."
}
