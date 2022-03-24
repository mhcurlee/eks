variable "project_name" {
  default = "mhcurlee-eks"
  type    = string

}

variable "k8s_admin_role_arn" {
  type    = string
  default = "arn:aws:iam::683035411291:role/k8sAdmin"
}

variable "cluster_write_kubeconfig" {
  type    = bool
  default = false

}

variable "cluster_version" {
  type    = string
  default = "1.21"

}

variable "cluster_enabled_log_types" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "cluster_instance_type" {
  type    = string
  default = "t3.small"
}

variable "cluster_asg_desired_capacity" {
  type    = number
  default = 2
}

variable "cluster_asg_max_size" {
  type    = number
  default = 2
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"

}