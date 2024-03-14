variable "kubernetes_version" {
  default = "1.18"
}

variable "workers_count" {
  default = "2"
}

variable "cluster_name" {
  type = string
   default = "helmterraformaks"
}

variable "location" {
  type = string
   default = "East US"
}
