resource "aws_instance" "linuxserver" {
  ami               = var.AMIS[var.REGION]
  instance_type     = "t2.micro"
  availability_zone = var.ZONE1
  key_name          = "andmlima-aws"
  vpc_security_group_ids = [aws_security_group.ssh_prod_sg.id]

  tags = {
    Name    = "Linux01"
    Project = "TerraformLab"
  }
}
output "PublicIP" {       
  value = aws_instance.linuxserver.public_ip
}

output "PrivateIP" {
  value = aws_instance.linuxserver.private_ip
}