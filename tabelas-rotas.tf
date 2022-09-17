#criando a tabela de rota que depois será vinculada a uma subrede
resource "aws_route_table" "rota_publica_kubernetes" {
  #passando em qual VPC essa rota será criada
  vpc_id = aws_vpc.vpc.id
    route {
      #passando o destino da rota, pois for vinculado a essa 
      #rota pode ir para este destino
      cidr_block = var.bloco_ip_destino_publico
      #usando este recurso (internet gateway),
      #ou seja quem for ligado a essa rota pode ir pra internet 
      #usando o gateway de internet
      gateway_id = aws_internet_gateway.internet_gateway.id
    }
    tags = {
      Name = "${var.usuario} tabela de rotas publicas"
    }
}

resource "aws_route_table" "rota_publica_gerenciamento" {
 vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = var.bloco_ip_destino_local
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
    tags = {
        Name = "${var.usuario} tabela de rotas publicas do gerenciamento"
  }
}
