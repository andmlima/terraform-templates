resource "aws_instance" "linuxserver" {
  ami               = var.AMIS[var.REGION]
  instance_type     = "t2.micro"
  availability_zone = var.ZONE1
  key_name          = "andmlima-aws"
  tags = {
    Name    = "Linux01"
    Project = "TerraformLab"
  }
}
