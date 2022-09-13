#criando um Subrede, pedacinho da rede da VPC
resource "aws_subnet" "nidio_public_subnet" {
  #estamos vinculando nossa subrede com a VPC que acabamos de criar.
  vpc_id                  = aws_vpc.nidio_vpc.id
  # bloco de IP para essa subrede, teremos 254 hosts
  cidr_block              = "10.0.1.0/24"
  #estamos habilitando como verdadeira a opção de vim com IP publico por padrão
  map_public_ip_on_launch = true 
  #dizendo em qual zona eu quero criar minha sub.
  availability_zone       = "ca-central-1a"
  #tag Name nomeia tá, isso vai servir para todos.
  tags = {
    Name = "Public subnet"
  }
}

resource "aws_subnet" "nidio_public_subnet_mngt" {
  vpc_id                  = aws_vpc.nidio_vpc.id
  cidr_block              = "10.0.3.0/24" 
  map_public_ip_on_launch = true 
  availability_zone       = "ca-central-1a"
  tags = {
    Name = "Public subnet mngt"
  }
}

resource "aws_subnet" "nidio_private_subnet" {
  #o que muda nesse rede é que não tem o IP publico habilitado.
  vpc_id                  = aws_vpc.nidio_vpc.id
  cidr_block              = "10.0.2.0/24" 
  availability_zone       = "ca-central-1a"
  tags = {
    Name = "Private subnet"
  }
}