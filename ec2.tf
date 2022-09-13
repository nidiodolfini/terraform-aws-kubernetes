#instando = VM
resource "aws_instance" "front_nidio-ec2" {
  #falando pra criar dois recursos
  count = 2
  #a Amazon Machine Image que será usada
  ami = "ami-0b6937ac543fe96d7"
  #tipo da instancia, ou seja o tipo de hardware que será usado
  instance_type = "t2.micro"
  #tag Name nomeia
  tags = {
    #aqui estamos fazendo um concatenação de de string do texto
    #que digitamos e o numero do contador(count) como falamos para criar
    #2 recursos desse e começa em 0 ficará assim
    #uma VM com o nome de: front_nidio-ec2-0
    # a outra como front_nidio-ec2-1
    Name = "front_nidio-ec2-${count.index}"
  }
  #passando a chave que vamos usar, é a mesma que nós subimos em keypair
  key_name = "nidio-terraform-aws"
  #solicitando o vinculo com um IP publico
  associate_public_ip_address = true
  #aqui fazemos o vinculo com os grupos de segurança
  #se reparar estamos pedindo o grupo nidio_sg_ssh(libera a porta 22 para dentro da VPC)
  # e o nidio_sg_web(libera a porta 80 para ser acessivel pela web)
  vpc_security_group_ids = ["${aws_security_group.nidio-acesso-ssh-private.id}","${aws_security_group.nidio-acesso-web.id}" ]
  #vinculando nossa instancia(VM) a subrede publica
  subnet_id = aws_subnet.nidio_public_subnet.id
}

resource "aws_instance" "mngt_nidio-ec2" {
  count = 1
  ami = "ami-0b6937ac543fe96d7"
  instance_type = "t2.micro"
  tags = {
    Name = "mngt_nidio-ec2-${count.index}"
  }
  key_name = "nidio-terraform-aws"
  #apenas o SG nidio_sg_ssh-mngt(libera a porta 22 para internet)
  vpc_security_group_ids = ["${aws_security_group.nidio-acesso-ssh-mngt.id}" ]
  subnet_id = aws_subnet.nidio_public_subnet_mngt.id
  #usando o dados do usuário para instalar o ansible para nós
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF
}
