#Criando security group
resource "aws_security_group" "ssh_prod_sg" {
  vpc_id      = aws_vpc.prod-vpc.id
  name        = "ssh_prod_sg"
  description = "Sec Grp for prod ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = [var.MYIP]
  }
  tags = {
    Name = "allow-ssh"
  }
}
