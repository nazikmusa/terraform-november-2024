module "november-2024" {
  source  = "nazikmusa/november-2024/module"
  version = "1.0.0"
  region = "us-east-1"
  vpc_cidr = "10.0.0.0/16"
}