#criando um portão para a Internet, todos serviços com IP publico
#poderam sair por ele
resource "aws_internet_gateway" "nidio_igw" {
 #vinculando com a nossa VPC,
 vpc_id = aws_vpc.nidio_vpc.id
 #tag Name só nomeia o recurso rs
 tags = {
    Name = "Internet gateway nidio"
  }
}