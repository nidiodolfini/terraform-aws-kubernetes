#levando nossa chave publica, lá pra AWS, pois assim podemos
#usa nossa chaves em várias regiões e serviços
resource "aws_key_pair" "terraform_aws_key" {
  #passando o nome da chave que vamos usar
  key_name = "${var.usuario}-terraform-aws"
  #passando o arquivo que será levado para a AWS .pub = fechadura
  public_key = file("terraform-aws.pub")
}