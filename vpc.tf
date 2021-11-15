#Criando uma VPC com 2 redes publicas e 2 redes privadas e todas usando subnet diferente
#VPC onde rede Private consegue acessar internet por causa da configuração de NAT
#codigo tirado do vídeo:  https://www.youtube.com/watch?v=8mRZJcCgoS0

resource "aws_vpc" "prod-vpc" { #criando a VPC e nomeando esse recurso AWS VPC de main
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc-prod"
  }
}

resource "aws_subnet" "prod-pub-1" { #Criando a primeira subnet para ser rede publica
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "prod-pub-1"
  }
}

resource "aws_subnet" "prod-pub-2" { #Criando a segunda subnet para ser rede publica
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "prod-pub-2"
  }
}

resource "aws_subnet" "prod-priv-1" { #Criando a primeira subnet para ser rede privada
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "prod-priv-1"
  }
}

resource "aws_subnet" "prod-priv-2" { #Criando a segunda subnet para ser rede privada
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "prod-priv-2"
  }
}


#criando Internet Gateways que permite que as instancias tenha acesso na internet, será usado nas subnets publicas
resource "aws_internet_gateway" "prod-IGW" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "prod-IGW"
  }
}

#criando Route Table
resource "aws_route_table" "prod-pub-RT" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-IGW.id
  }
  tags = {
    Name = "prod-pub-RT"
  }
}

#anexar o Route para as subnets publicas, isso vai liberar o trafigo da internet nelas
resource "aws_route_table_association" "prod-pub-1-a" {
  subnet_id      = aws_subnet.prod-pub-1.id
  route_table_id = aws_route_table.prod-pub-RT.id
}

resource "aws_route_table_association" "prod-pub-2-a" {
  subnet_id      = aws_subnet.prod-pub-2.id
  route_table_id = aws_route_table.prod-pub-RT.id
}


