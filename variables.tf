variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "chinnu"
  type        = string
}

variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  default     = null
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
  type        = string
}

variable "profile_name" {
  description = "AWS user profile"
  default     = "yahya"
  type        = string
}

variable "kubernetes_version" {
  description = "AWS EKS version"
  default     = "1.27"
  type = string
}

variable "tag_owner" {
  default = "CHINNU_Y"
  type = string
}

variable "tag_category" {
  default = "ENG_ASSESSMENT"
  type = string
}

variable "desired_capacity" {
  default = 4
  type = number
}

variable "max_capacity" {
  default = 6
  type = number
}

variable "min_capacity" {
  default = 2
  type = number
}