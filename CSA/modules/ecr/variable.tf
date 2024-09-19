variable "repository_names" {
  description = "List of names for the ECR repositories"
  type        = list(string)
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
