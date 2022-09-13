#estamos criando o recurso VPC.
resource "aws_vpc" "nidio_vpc" {
  #definimos o bloco de ip que vamos usar, no /16 teremos 65k de IP para hosts
  cidr_block           = "10.0.0.0/16"
  #tipo de criação da nossa estrutura, na dedicada teremos um hardware dedicado paara nós, mas isso fica caro
  instance_tenancy     = "default" 
  #habilitando o suporte DNS para resolver os nomes
  enable_dns_support   = true 
  #habilitando DNS para as nossas VMs
  enable_dns_hostnames = true
  #tag Name nomeia nosso arquivo
  tags = {
    Name = "VPC nidio"
  }
} 