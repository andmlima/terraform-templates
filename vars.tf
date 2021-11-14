variable REGION {
  default = "sa-east-1"
}

variable ZONE1 {
  default = "sa-east-1a"
}

variable AMIS {
  type = map
  default = {
    sa-east-1 = "ami-05855ed85de7fbd77"
    us-east-1 = "ami-054a31f1b3bf190920"
  }
}