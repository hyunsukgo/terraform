locals {
  service_name = "skcc"
  owner        = "Community Team"
  cidr = "10.0.0.0/16"
  cidrtrim = substr("local.cidr", 0, 3)
}