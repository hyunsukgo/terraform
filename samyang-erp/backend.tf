terraform {
  backend "remote" {
    organization = "kafka-tf"

    workspaces {
      name = "terraform-samyang-erp"
    }
  }
}