#criando a tabela de rota que depois será vinculada a uma subrede
resource "aws_route_table" "nidio_public_rt" {
  #passando em qual VPC essa rota será criada
  vpc_id = aws_vpc.nidio_vpc.id
    route {
      #passando o destino da rota, pois for vinculado a essa 
      #rota pode ir para este destino
      cidr_block = "0.0.0.0/0"
      #usando este recurso (internet gateway),
      #ou seja quem for ligado a essa rota pode ir pra internet 
      #usando o gateway de internet
      gateway_id = aws_internet_gateway.nidio_igw.id
    }
    tags = {
      Name = "tabela de rotas publicas"
    }
}

resource "aws_route_table" "nidio_public_rt_mngt" {
 vpc_id = aws_vpc.nidio_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.nidio_igw.id
    }
    tags = {
        Name = "tabela de rotas publicas do MNGT"
  }
}

resource "aws_route_table" "nidio_private_rt" {
  vpc_id = aws_vpc.nidio_vpc.id
    route {
      #essa rota é pra subrede privada sem IP publico que para ir
      #para a internet(0.0.0.0/0) 
      cidr_block = "0.0.0.0/0"
      #vai precisar usar o NAT gateway (ele empresta o IP dele)
      #para quem não tem IP publico ir para a internet
      nat_gateway_id = aws_nat_gateway.nidio_nat_gateway.id
    }
    tags = {
      Name = "tabela de rotas privatas"
    }
}