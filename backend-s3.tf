terraform {
  backend "s3" {
    bucket = "andmlima-s3-us-east-1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}