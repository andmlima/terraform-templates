resource "aws_instance" "linuxserver" {
  ami               = var.AMIS[var.REGION]
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.prod-pub-1.id #selecionando a subnet
  vpc_security_group_ids = [aws_security_group.ssh_prod_sg.id]
  key_name          = "andmlima-aws"

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