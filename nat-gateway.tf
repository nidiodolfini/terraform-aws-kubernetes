#estamos criando um NAT, serviço que empresta seu IP para VMs 
#que não tem acesso ou IP publico irem para a internet
resource "aws_nat_gateway" "nidio_nat_gateway" {
  #estamos alocando um IP publico que pedimos no Elastic IP
  allocation_id = aws_eip.nidio_nat_eip.id 
  #estamos falando que ela vai estar na subrede public, 
  #pois ela precisa ir para a internet
  #ela poderia estar em qual outra subrede? 
  subnet_id = aws_subnet.nidio_public_subnet.id
  #colocando que ela terá uma conectividade publica, pois
  #a partir dela as VMs das redes privadas irão para a internet
  connectivity_type = "public"

  tags = {
    Name = "NATGW nidio"
  }
}