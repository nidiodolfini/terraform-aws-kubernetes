#criando um portão para a Internet, todos serviços com IP publico
#poderam sair por ele
resource "aws_internet_gateway" "internet_gateway" {
 #vinculando com a nossa VPC,
 vpc_id = aws_vpc.vpc.id
 #tag Name só nomeia o recurso rs
 tags = {
    Name = "${var.usuario} Internet gateway"
  }
}