#criando um SG e liberando a entrada via SSH(22) só para quem estiver
#dentro da VPC e  deixando as maquinas sairem para a internet
resource "aws_security_group" "nidio-acesso-ssh-private" {
  #descrição do que estamos fazendo
  description = "nidio sg acesso ssh somente VPC"
  #vinculando nosso SG a uma VPC
  vpc_id = aws_vpc.nidio_vpc.id
  
  #aqui está sendo passando a permissão de entrada para porta 22
  #mas só para quem estiver cidr da VPC
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]

  }
  #permissão de saida da maquina, para a internet, pois se não
  #seria impossivel instalar algo nela ou dar apt-get update
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "nidio_sg_ssh"
  }
}

#SG de permitindo o acesso a porta 80 para toda a internet, 
#pois quem for acessar nosso front, estara na internet
resource "aws_security_group" "nidio-acesso-web" {
  name = "nidio-acesso-web"
  description = "nidio sg acesso web"
  vpc_id = aws_vpc.nidio_vpc.id
  #liberando a entrada pela porta 80 - HTTP
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "nidio_sg_web"
  }
}

#liberando SSH(22) para a internet, mas poderia ser para o IP da sua empresa
#pois nossa VM de gerenciamento, tem que ser acessivel de fora da VPC
resource "aws_security_group" "nidio-acesso-ssh-mngt" {
  name = "nidio-acesso-ssh-mngt"
  description = "nidio sg acesso ssh-mngt"
  vpc_id = aws_vpc.nidio_vpc.id
 
  ingress {
    description      = "SSH-mngt"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "nidio_sg_ssh-mngt"
  }
}