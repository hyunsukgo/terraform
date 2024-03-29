variable "service_name" {
  type = string
}
variable "workload" {
  type = string
}
variable "cidr" {
  type = string
}
variable "onprem" {
  type = string
}
variable "cgw" {
  type = string
}
variable "peerid" {
  type = string
}
variable "account_id" {
  type = string
}
variable "region" {
  type    = string
  default = "ap-northeast-2"
}
variable "peervpcid" {
  type = string
}
variable "architect" {
  type = string
}
variable "passwd" {
  type = string
}

variable "reporturl" {
  type = string
}

variable "co-op" {
  type = string
}

variable "dns" {
  type = string
}

variable "peering-cidr" {
  type = string
}

variable "ksnet-cgw" {
  type = string
}

variable "ksnet" {
  type = string
}

variable "newvpn" {
  type = string
}

variable "sap-weburl" {
  type = string
}

variable "sap-inturl" {
  type = string
}

variable "pourl" {
  type = string
}


variable "po-weburl" {
  type = string
}

variable "po-inturl" {
  type = string
}