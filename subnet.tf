#criando um Subrede, pedacinho da rede da VPC
resource "aws_subnet" "subrede_publica_kubernetes" {
  #estamos vinculando nossa subrede com a VPC que acabamos de criar.
  vpc_id                  = aws_vpc.vpc.id
  # bloco de IP para essa subrede, teremos 254 hosts
  cidr_block              = var.bloco_ip_kubernetes
  #estamos habilitando como verdadeira a opção de vim com IP publico por padrão
  map_public_ip_on_launch = var.mapear_ip_publico 
  #dizendo em qual zona eu quero criar minha sub.
  availability_zone       = var.zona_disponibilidade
  #tag Name nomeia tá, isso vai servir para todos.
  tags = {
    Name = "${var.usuario} - Subrede Publica kubernetes"
  }
}

resource "aws_subnet" "subrede_publica_gerenciamento" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.bloco_ip_gerenciamento
  map_public_ip_on_launch = var.mapear_ip_publico 
  availability_zone       = var.zona_disponibilidade
  tags = {
    Name = "${var.usuario} - Subrede Publica Gerenciamento"
  }
}