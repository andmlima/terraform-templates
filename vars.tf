variable REGION {
  default = "sa-east-1"
}

variable USER {
  default = "ec2-user"
}

variable ZONE1 {
  default = "sa-east-1a"
}

variable ZONE2 {
  default = "sa-east-1b"
}

variable AMIS {
  type = map
  default = {
    sa-east-1 = "ami-05855ed85de7fbd77"
    us-east-1 = "ami-054a31f1b3bf190920"
  }
}
