
module "ec2" {
  source = "./main/ec2"
}
module "sg" {
  source = "./main/sg"
}
module "main" {
  source = "./main/"
}
