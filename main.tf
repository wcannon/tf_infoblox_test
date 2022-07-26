locals {

 cidrs = {
  dev = {
    onprem = ["10.6.224.0/23"]
    east = {
        vpc = ["10.50.0.0/15"]
	jumpbox = ["10.51.248.0/22"]
        shared_services = ["10.51.224.0/19"]
    }
    west =  {
        vpc = ["10.18.0.0/15"]
	jumpbox = ["10.19.248.0/22"]
        shared_services = ["10.19.224.0/19"]
    }
  }
  prod = {
    onprem = ["10.0.9.79/32", "10.0.9.80/32", "10.0.9.81/32"]
    east = {
        vpc = ["10.48.0.0/15"]
	jumpbox = ["10.49.249.0/22"]
        shared_services = ["10.49.224.0/19"]
    }
    west =  {
        vpc = ["10.16.0.0/15"]
	jumpbox = ["10.17.248.0/22"]
        shared_services = ["10.17.224.0/19"]
    }
  }
 }

}

variable "dev-ingress-general" {
  description = "list of dev ingress cidr"
  type = list(string)
  default = []
}

variable "env" {
  description = "environment: e.g. prod, dev"
  type = string
  default = "prod"
}

output "combined" {
  description = "combined info"
  value = concat(local.cidrs["${var.env}"].onprem, local.cidrs.dev.east.vpc)
  //value =      local.vpc["${var.env}"].onprem
}
