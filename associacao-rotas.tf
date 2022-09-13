#vamos associar as coisas entre rota e subrede, para especificar
#o caminho que os serviços dentro das nossas subs devem fazer
resource "aws_route_table_association" "public_association" {
  #estou passando qual subrede minha rota vai estar vinculada
  subnet_id      = aws_subnet.nidio_public_subnet.id
  #passando a rota que vai ser vinculada
  route_table_id = aws_route_table.nidio_public_rt.id
}

resource "aws_route_table_association" "public_association_mngt" {
  #estou passando qual subrede minha rota vai estar vinculada
  subnet_id      = aws_subnet.nidio_public_subnet_mngt.id
  #passando a rota que vai ser vinculada
  route_table_id = aws_route_table.nidio_public_rt_mngt.id
}

resource "aws_route_table_association" "private_association" {
  #estou passando qual subrede minha rota vai estar vinculada
  subnet_id      = aws_subnet.nidio_private_subnet.id
  #passando a rota que vai ser vinculada
    route_table_id = aws_route_table.nidio_private_rt.id
}