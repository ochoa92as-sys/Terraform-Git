resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-test"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "private_subnet-test"
  }
  depends_on = [ aws_subnet.public_subnet ]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "igw vpc virginia"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
   Name = "public crt" 
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "public_instance_sg" {
  name        = "Public instante sg"
  description = "Allow ssh in and out"
  vpc_id      = aws_vpc.vpc_virginia.id


####### Ejemplo Ingress Dynamic Blocks ########

dynamic "ingress" {
  for_each = var.ingress_port_list
  content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr_sg]
  }
}


# ingress {
#   description = "tls pvc"
#   cidr_blocks       = [var.ingress_cidr_sg]
#   from_port         = 22
#   protocol          = "tcp"
#   to_port           = 22

# }

# ingress {
#   description = "http"
#   cidr_blocks       = [var.ingress_cidr_sg]
#   from_port         = 80
#   protocol          = "tcp"
#   to_port           = 80

# }

# ingress {
#   description = "https"
#   cidr_blocks       = [var.ingress_cidr_sg]
#   from_port         = 443
#   protocol          = "tcp"
#   to_port           = 443

# }




egress {
  
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  cidr_blocks = ["0.0.0.0/0"]

}

  tags = {
    Name = "public instante sg"
  }
}
