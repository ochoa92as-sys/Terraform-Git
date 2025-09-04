variable "virginia_cidr" {
description = "cidr de virginia"
type = string
sensitive = false
}

# variable "public_subnet" {
#   description = "cidr_public_subnet"
#   type = string

# }

# variable "private_subnet" {
#   description = "cidr_public_subnet"
#   type = string

# }

variable "subnets" {
  description = "lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "tags del proyecto"
  type = map(string)
}

variable "ingress_cidr_sg" {
  description = "cidr para el ingress"
  type = string
}

variable "ec2_specs" {
  description = "parametros de una instancia ec2"
  type = map(string)
}

variable "enable_monitoring" {
  description = "habilita despliegue mon"
  type = number
  
}

variable "ingress_port_list" {
  description = "lista de puertos ingress"
  type = list(number)
  
}

### VARIABLES PARA CONECTAR A TERRAFORM - AWS ######

variable "accesskey" {
  
}

variable "secretkey" {
  
}