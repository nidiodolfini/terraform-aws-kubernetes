#vamos associar as coisas entre rota e subrede, para especificar
#o caminho que os serviços dentro das nossas subs devem fazer
resource "aws_route_table_association" "assossiacao_publica" {
  #estou passando qual subrede minha rota vai estar vinculada
  subnet_id = aws_subnet.subrede_publica_kubernetes.id
  #passando a rota que vai ser vinculada
  route_table_id = aws_route_table.rota_publica_kubernetes.id
}

resource "aws_route_table_association" "assossiacao_publica_gerenciamento" {
  #estou passando qual subrede minha rota vai estar vinculada
  subnet_id = aws_subnet.subrede_publica_gerenciamento.id
  #passando a rota que vai ser vinculada
  route_table_id = aws_route_table.rota_publica_gerenciamento.id
}