#estamos criando o recurso VPC.
resource "aws_vpc" "vpc" {
  #definimos o bloco de ip que vamos usar, no /16 teremos 65k de IP para hosts
  cidr_block =  var.bloco_ip_destino_local
  #tipo de criação da nossa estrutura, na dedicada teremos um hardware dedicado paara nós, mas isso fica caro
  instance_tenancy = var.tipo_criacao 
  #habilitando o suporte DNS para resolver os nomes
  enable_dns_support = var.suporte_dns 
  #habilitando DNS para as nossas VMs
  enable_dns_hostnames = var.dns_host_names
  #tag Name nomeia nossa VPC
  tags = {
    Name = "${var.usuario}-vpc"
  }
} 