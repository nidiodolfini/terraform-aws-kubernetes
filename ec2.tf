#instando = VM
resource "aws_instance" "ec2_kubernetes" {
  #falando pra criar dois recursos
  count = 2
  #a Amazon Machine Image que será usada
  ami = var.imagem_instancia_ami
  #tipo da instancia, ou seja o tipo de hardware que será usado
  instance_type = "t2.micro"
  #tag Name nomeia
  tags = {
    #aqui estamos fazendo um concatenação de de string do texto
    #que digitamos e o numero do contador(count) como falamos para criar
    #2 recursos desse e começa em 0 ficará assim
    #uma VM com o nome de: k8s_nidio_ec2_0
    # a outra como k8s_nidio_ec2_1
    Name = "k8s_${var.usuario}_ec2_${count.index}"
  }
  #passando a chave que vamos usar, é a mesma que nós subimos em keypair
  key_name = "${var.usuario}-terraform-aws"
  #solicitando o vinculo com um IP publico
  associate_public_ip_address = var.mapear_ip_publico
  #aqui fazemos o vinculo com os grupos de segurança
  #se reparar estamos pedindo o grupo nidio_sg_ssh(libera a porta 22 para dentro da VPC)
  # e o nidio_sg_web(libera a porta 80 para ser acessivel pela web)
  vpc_security_group_ids = ["${aws_security_group.sg_acesso_ssh_local.id}","${aws_security_group.sg_acesso_web_publico.id}" ]
  #vinculando nossa instancia(VM) a subrede publica kubernetes
  subnet_id = aws_subnet.subrede_publica_kubernetes.id
}

resource "aws_instance" "ec2_gerenciamento" {
  count = 1
  ami = var.imagem_instancia_ami
  instance_type = var.tipo_instancia
  tags = {
    Name = "ger_${var.usuario}_ec2_${count.index}"
  }
  key_name = "${var.usuario}-terraform-aws"
  vpc_security_group_ids = ["${aws_security_group.sg_acesso_ssh_publico.id}" ]
  subnet_id = aws_subnet.subrede_publica_gerenciamento.id
  #usando o dados do usuário para instalar o ansible para nós
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository --yes --update ppa:ansible/ansible -y
    sudo apt-get install ansible -y
  EOF
}
